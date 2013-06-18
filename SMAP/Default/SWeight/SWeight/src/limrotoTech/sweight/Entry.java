package limrotoTech.sweight;

import java.text.SimpleDateFormat;
import java.util.Date;

import android.util.Log;

//Object type stored in 'EntryTable'
public class Entry
{
	private static final String TAG = "Entry";
	
	public Entry(Double weight, Date date)
	{
		WeightEntry = weight;
		DateEntry = FormatDateToTime(date);
	}
	
	public Entry(Double weight, String date)
	{
		WeightEntry = weight;
		DateEntry = date;
	}

    public Entry(int id, Double weight, String date)
    {
        ID = id;
        WeightEntry = weight;
        DateEntry = date;
    }

	public Double WeightEntry;
	public String DateEntry;
    public int ID;

	// Helper function to format Date to String
	public static String FormatDateToTime(Date timeToFormat)
	{
		Log.i(TAG, "Formating Date to String");
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		StringBuilder builder = new StringBuilder(format.format(timeToFormat));

		return builder.toString();
	}


}