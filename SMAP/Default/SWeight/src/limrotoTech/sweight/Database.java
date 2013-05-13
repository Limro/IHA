package limrotoTech.sweight;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;

import android.content.ContentValues;
import android.content.Context;
import android.database.*;
import android.database.sqlite.*;
import android.database.sqlite.SQLiteDatabase.CursorFactory;
import java.text.ParseException;
import android.util.Log;

public class Database
{

	private static final String TAG = "Database";

	private static final int DATABASE_VERSION = 1;
	private static final String DATABASE_NAME = "SWeightDatabase.db";
	private static final String DATABASE_TABLE_ENTRY = "EntryTable";
	private static final String ENTRY_COL_ID = "Id";
	private static final String ENTRY_COL_WEIGHT = "Weight";
	private static final String ENTRY_COL_DATE = "Date";

	public static final int COL_ID = 1;
	public static final int COL_DATE = 3;
	public static final int COL_WEIGHT = 2;

	// TODO: Create public field for each column in your table.
	// SQL Statement to create a new database.
	private static final String DATABASE_CREATE = "create table "
			+ DATABASE_TABLE_ENTRY + " (" // begin
			+ ENTRY_COL_ID + " integer primary key autoincrement" + ", " // col1
			+ ENTRY_COL_WEIGHT + " real not null" + ", " // col2
			+ ENTRY_COL_DATE + " text not null);"; // col3

	// Object type stored in 'EntryTable'
	public class Entry
	{
		public Entry(Double weight, Date date)
		{
			WeightEntry = weight;
			DateEntry = date;
		}

		public Double WeightEntry;
		public Date DateEntry;

	}

	// Variable to hold the database instance
	private SQLiteDatabase db;

	// Context of the application using the database.
	private final Context context;

	// Database open/upgrade helper
	private myDbHelper dbHelper;

	public Database(Context _context)
	{
		context = _context;
		dbHelper = new myDbHelper(context, DATABASE_NAME, null,
				DATABASE_VERSION);
	}

	public Database open() throws SQLException
	{
		db = dbHelper.getWritableDatabase();
		return this;
	}

	public void close()
	{
		db.close();
	}

	// Insert a 'Entry' in the database
	public long insertEntry(Entry _myObject)
	{
		Log.i(TAG, "Inserting row in database");

		ContentValues val = new ContentValues();
		val.put(ENTRY_COL_WEIGHT, _myObject.WeightEntry);
		val.put(ENTRY_COL_DATE, FormatDateToTime(_myObject.DateEntry));

		Long output = db.insert(DATABASE_NAME, null, val);
		if (output == -1)
		{
			Log.d(TAG, "Value not inserted in database!");
		}

		return output;
	}

	// Helper function to format Date to String
	public static String FormatDateToTime(Date timeToFormat)
	{
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		StringBuilder builder = new StringBuilder(format.format(timeToFormat));

		return builder.toString();
	}

	// Helper function to dormate String to Date
	public static Date FormatTimeToDate(String time)
	{
		SimpleDateFormat dateFormat = new SimpleDateFormat(
				"yyyy-MM-dd HH:mm:ss");
		try
		{
			return dateFormat.parse(time);
		}
		catch (ParseException e)
		{
			Log.e(TAG, "Formating String to Date failed");
			return null;
		}
	}

	public boolean removeEntry(String table, long _rowIndex)
	{
		return db.delete(table, ENTRY_COL_ID + "=" + _rowIndex, null) > 0;
	}

	// Will order after Date
	public Cursor getAllEntries()
	{
		return db.query(DATABASE_TABLE_ENTRY, new String[]
		{ ENTRY_COL_ID, ENTRY_COL_DATE, ENTRY_COL_WEIGHT }, null, null, null,
				null, ENTRY_COL_DATE);
	}

	public Entry getEntry(long rowIndex)
	{
		Log.i(TAG, "Retrieving data from database, ID: " + rowIndex);

		String where = ENTRY_COL_ID + "=" + rowIndex;
		Cursor entry = db.query(DATABASE_TABLE_ENTRY, null, where, null, null,
				null, null);

		if (entry != null)
		{
			if (entry.moveToFirst())
			{
				Entry e = new Entry(entry.getDouble(COL_WEIGHT),
						FormatTimeToDate(entry.getString(COL_DATE)));
				return e;
			}
			else
			{
				Log.d(TAG, "No rows found!");
				return null;
			}
		}
		else
		{
			Log.d(TAG, "Nothing returned from database!");
			return null;
		}
	}

	public List<Entry> getEntriesInPeriod(Date from, Date to)
	{
		Log.i(TAG, "Retrieving data from database, from "
				+ FormatDateToTime(from) + " to " + FormatDateToTime(to));

		String where = ENTRY_COL_DATE + "=>" + FormatDateToTime(from) + "AND"
				+ ENTRY_COL_DATE + "=<" + FormatDateToTime(to);
		Cursor entry = db.query(DATABASE_TABLE_ENTRY, null, where, null, null,
				null, null);

		if (entry != null)
		{
			if (entry.moveToFirst())
			{
				List<Entry> list = new ArrayList<Entry>();

				Entry e = new Entry(entry.getDouble(COL_WEIGHT),
						FormatTimeToDate(entry.getString(COL_DATE)));

				list.add(e);

				while (entry.moveToNext())
				{
					Entry next = new Entry(entry.getDouble(COL_WEIGHT),
							FormatTimeToDate(entry.getString(COL_DATE)));
					list.add(next);
				}
				return list;
			}
			else
			{
				Log.d(TAG, "No rows found!");
				return null;
			}
		}
		else
		{
			Log.d(TAG, "Nothing returned from database! Check where clause");
			return null;
		}
	}

	public boolean updateEntry(long rowIndex, Entry myObject)
	{
		String where = ENTRY_COL_ID + "=" + rowIndex;
		ContentValues val = new ContentValues();
		val.put(ENTRY_COL_ID, rowIndex);
		val.put(ENTRY_COL_DATE, FormatDateToTime(myObject.DateEntry));
		val.put(ENTRY_COL_WEIGHT, myObject.WeightEntry);

		int output = db.update(DATABASE_TABLE_ENTRY, val, where, null);
		return (output == 0 ? false : true);
	}

	private static class myDbHelper extends SQLiteOpenHelper
	{
		public myDbHelper(Context context, String name, CursorFactory factory,
				int version)
		{
			super(context, name, factory, version);
		}

		// Called when no database exists in disk and the helper class needs
		// to create a new one.
		@Override
		public void onCreate(SQLiteDatabase _db)
		{
			_db.execSQL(DATABASE_CREATE);
		}

		// Called when there is a database version mismatch meaning that the
		// version
		// of the database on disk needs to be upgraded to the current version.
		@Override
		public void onUpgrade(SQLiteDatabase _db, int _oldVersion,
				int _newVersion)
		{
			// Log the version upgrade.
			Log.w("TaskDBAdapter", "Upgrading from version " + _oldVersion
					+ " to " + _newVersion
					+ ", which will destroy all old data");

			// Upgrade the existing database to conform to the new version.
			// Multiple
			// previous versions can be handled by comparing _oldVersion and
			// _newVersion values.
			// The simplest case is to drop the old table and create a new one.
			_db.execSQL("DROP TABLE IF EXISTS " + DATABASE_TABLE_ENTRY);
			// Create a new one.
			onCreate(_db);
		}
	}
}
