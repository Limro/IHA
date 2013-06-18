package limrotoTech.sweight;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import android.app.AlertDialog;
import android.content.*;
import android.text.InputType;
import android.view.*;
import android.widget.*;

import android.os.Bundle;
import android.app.Activity;
import android.util.Log;
import android.view.View.OnKeyListener;
import android.view.inputmethod.InputMethodManager;

public class MainActivity extends Activity implements AdapterView.OnItemClickListener
{
	private static final String TAG = "MainActivity";
	private Database db = null;
    private ListView listView;
    private List<weightRowItem> rowItems;
    private BroadcastReceiver bcReceiver;

	@Override
	protected void onCreate(Bundle savedInstanceState)
	{
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);

		db = new Database(this);
		KeyboardListener();


        BroadCast();
        RegisterBroadCast();

		ShowKeyBoardOnStartup();
		
	}

    private void RegisterBroadCast()
    {
        Log.i(TAG, "Register broadcast");
        IntentFilter filter = new IntentFilter();
        filter.addAction("EditClick");
        registerReceiver(bcReceiver, filter);
    }

    private void BroadCast() {
        bcReceiver = new BroadcastReceiver()
        {
            @Override
            public void onReceive(Context context, Intent intent)
            {
                Log.i(TAG, "Broadcast received");
                int pos = intent.getIntExtra("ClickRow", Integer.MAX_VALUE);

                Entry e = FindEntry(pos);

                if(pos == Integer.MAX_VALUE)
                {
                    CharSequence text = getResources().getString(R.string.ErrorBadListPos);
                    int duration = Toast.LENGTH_SHORT;

                    Toast toast = Toast.makeText(context, text, duration);
                    toast.show();

                    return;
                }

                Log.i(TAG, "Entry found: " + e.ID);
                ShowDialog(e);
            }
        };
    }

    private Entry FindEntry(int pos)
    {
        Log.i(TAG, "Locating position in list: " + pos);
        ListView list = (ListView)findViewById(R.id.listLatestData);
        weightRowItem item = (weightRowItem)list.getItemAtPosition(pos);
        Entry e = new Entry(item.GetId(), Double.parseDouble(item.GetWeight()), item.GetDate());
        return e;
    }

    private void ShowKeyBoardOnStartup()
	{
		Log.i(TAG, "Tries to show keyboard");
		InputMethodManager imm = (InputMethodManager)getSystemService(
			    Context.INPUT_METHOD_SERVICE);
			imm.showSoftInput(findViewById(R.id.editText1), 0);
	}

	@Override
 	public boolean onCreateOptionsMenu(Menu menu)
	{
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.main, menu);
		return true;
	}
	
	private List<Entry> GetEntryData()
	{
		Calendar c1 = Calendar.getInstance();
		Calendar c2 = Calendar.getInstance();
		c1.set(2013, 1, 1, 1, 1, 1);

		
		String currentTime = (String) android.text.format.DateFormat
				.format("yyyy-MM-dd kk:mm:ss", c2.getTime()); //24 hour format
		
		String pastTime = (String) android.text.format.DateFormat
				.format("yyyy-MM-dd kk:mm:ss",c1.getTime()); //24 hour format
		
		Log.i(TAG, "Fetching all entries");
		List<Entry> list = db.getEntriesInPeriod(currentTime, pastTime);
		
		return list;
	}
	
	private void ShowData()
	{
        Log.i(TAG, "Showing data");
		List<Entry> list = GetEntryData();

        if(list == null)
        {
            Context context = getApplicationContext();
            CharSequence text = getResources().getString(R.string.ErrorNoData);
            int duration = Toast.LENGTH_SHORT;

            Toast toast = Toast.makeText(context, text, duration);
            toast.show();

            return;
        }

        rowItems = new ArrayList<weightRowItem>();
        for (Entry entry : list) {
            weightRowItem item = new weightRowItem( entry.ID, entry.DateEntry, entry.WeightEntry);
            rowItems.add(item);
        }

        listView = (ListView) findViewById(R.id.listLatestData);
        CustomListViewWeightAdapter adapter = new CustomListViewWeightAdapter(this,
                R.layout.rowfile, rowItems);
        listView.setAdapter(adapter);
        listView.setOnItemClickListener(this);

		adapter.notifyDataSetChanged();
	}
	
	public void GetData(View v)
	{
		ShowData();
	}

	private void HideKeyboard()
	{
		Log.i(TAG, "Hiding keyboard");
		//getWindow().setSoftInputMode(WindowManager.LayoutParams
		//		.SOFT_INPUT_STATE_ALWAYS_HIDDEN);	
		
		EditText t = (EditText)findViewById(R.id.editText1);
		
		InputMethodManager imm = (InputMethodManager)getSystemService(
			      Context.INPUT_METHOD_SERVICE);
			imm.hideSoftInputFromWindow(t.getWindowToken(), 0);
	}

    public void OnGraphClick(View v)
    {
        Log.i(TAG, "Clicked for graph activity");

        List<Entry> list = GetEntryData();

        if(list == null)
        {
            Context context = getApplicationContext();
            CharSequence text = getResources().getString(R.string.ErrorNoData);
            int duration = Toast.LENGTH_SHORT;

            Toast toast = Toast.makeText(context, text, duration);
            toast.show();

            return;
        }

        Intent intent = new Intent(this, chart.class);
        startActivity(intent);
    }

	public void OnAddClick(View v)
	{
		Log.i(TAG,"Click on 'Enter' button");
		EditText t = (EditText)findViewById(R.id.editText1);
		
		try
		{
			Log.i(TAG, "Fetching the input");
			double input = Double.parseDouble(t.getText().toString());
			
			Log.i(TAG, "Fetching the current time");
			String currentTime = (String) android.text.format.DateFormat.format("yyyy-MM-dd kk:mm:ss", new java.util.Date());
			Log.i(TAG, "Time = " + currentTime);
			
			Log.i(TAG, "Creating new Entry");
			Entry e = new Entry(input, currentTime);
			
			Log.i(TAG, "Inserting in database");
			db.insertEntry(e);
			
			t.setText(""); //Clear text
			
			ShowData();
		}
		catch(java.lang.NumberFormatException e)
		{
			Log.i(TAG, e.toString());
			Context context = getApplicationContext();
			CharSequence text = getString(R.string.ErrorNoInput);
			int duration = Toast.LENGTH_SHORT;

			Toast toast = Toast.makeText(context, text, duration);
			toast.show();
		}
		catch(Exception e)
		{
			Log.d(TAG, "Something went wrong");
			Context context = getApplicationContext();
			CharSequence text = getString(R.string.ErrorUndefined);
			int duration = Toast.LENGTH_SHORT;

			Toast toast = Toast.makeText(context, text, duration);
			toast.show();
		}
	}
	
	private void KeyboardListener()
	{
		final EditText t = (EditText) findViewById(R.id.editText1);
        //final Button b = (Button) findViewById(R.id.RowEdit);
		
		t.setOnKeyListener(new OnKeyListener()
		{
		    @Override
			public boolean onKey(View v, int keyCode, KeyEvent event)
		    {
            if (event.getAction() == KeyEvent.ACTION_DOWN)
            {
                switch (keyCode)
                {
                    case KeyEvent.KEYCODE_ENTER:
                        Log.i(TAG, "Enter clicked");
                        OnAddClick(v); //Add data to database
                        //t.clearFocus();
                        HideKeyboard();
                        return true;
                    default:
                        break;
                }
            }
            return false;
		    }
		});

//        b.setOnClickListener(new View.OnClickListener() {
//            @Override
//            public void onClick(View view) {
//                UpdateEntry();
//            }
//        });
	}

    public void ShowDialog(final Entry entry)
    {
        Log.i(TAG, "Starting dialog");
        AlertDialog.Builder builder = new AlertDialog.Builder(this);

        final EditText et = new EditText(this);
        et.setInputType(InputType.TYPE_NUMBER_FLAG_DECIMAL);

        builder.setMessage(R.string.dialog_message)
                .setTitle(R.string.dialog_title);

        builder.setView(et);

        Log.i(TAG, "Adding buttons");
        builder.setPositiveButton(R.string.ok, new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialog, int id)
            {
                Log.i(TAG, "Modifying the data");
                if(et == null)
                    Log.e(TAG, "Couldn't find TextView 'EditedWeight'");

                Log.i(TAG, "Parsing data");
                Double value = Double.parseDouble(et.getText().toString());
                Log.i(TAG, et.getText().toString());
                Log.i(TAG, "Value = " + value);

                Log.i(TAG, "Creating new tag");
                Entry newEntry = new Entry(entry.ID, value, entry.DateEntry);

                UpdateEntry(newEntry);
                ShowData();
            }
        });
        builder.setNegativeButton(R.string.cancel, new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialog, int id) {
                //Do nothing
            }
        });

        builder.setNeutralButton(R.string.delete, new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialog, int id) {
                Log.i(TAG, "Click on delete");
                db.removeEntry(entry.ID);
                ShowData();
            }
        });


        AlertDialog dialog = builder.create();
        dialog.show();
    }

    private void UpdateEntry(Entry entry)
    {
        Log.i(TAG, "Updating entry");
        boolean success = db.updateEntry(entry.ID, entry);

        if(!success)
        {
            Log.d(TAG, "Data was not updated");
            Context context = getApplicationContext();
            CharSequence text = getResources().getString(R.string.BadUpdate);
            int duration = Toast.LENGTH_SHORT;

            Toast toast = Toast.makeText(context, text, duration);
            toast.show();
        }

    }

    @Override
    public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
        Toast toast = Toast.makeText(getApplicationContext(),
                "Item " + (position + 1) + ": " + rowItems.get(position),
                Toast.LENGTH_SHORT);
        //toast.setGravity(Gravity.BOTTOM|Gravity.CENTER_HORIZONTAL, 0, 0);
        toast.show();
    }
}
