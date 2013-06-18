package limrotoTech.sweight;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import android.content.Intent;
import android.widget.*;
import limrotoTech.sweight.Entry;

import android.os.Bundle;
import android.app.Activity;
import android.content.Context;
import android.util.Log;
import android.view.KeyEvent;
import android.view.Menu;
import android.view.View;
import android.view.View.OnKeyListener;
import android.view.WindowManager;
import android.view.inputmethod.InputMethodManager;

public class MainActivity extends Activity
{
	private static final String TAG = "MainActivity";
	private Database db = null;

	@Override
	protected void onCreate(Bundle savedInstanceState)
	{
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
		
		db = new Database(this);
		KeyboardListener();

		ShowKeyBoardOnStartup();
		
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
				.format("yyyy-MM-dd hh:mm:ss", c2.getTime());
		
		String pastTime = (String) android.text.format.DateFormat
				.format("yyyy-MM-dd hh:mm:ss",c1.getTime());
		
		Log.i(TAG, "Fetching all entries");
		List<Entry> list = db.getEntriesInPeriod(currentTime, pastTime);
		
		return list;
	}
	
	private void ShowData()
	{
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
		
		Log.i(TAG, "Attaching lists");
		ArrayList<String> l = new ArrayList<String>();
		ArrayAdapter<String> adaptor = new ArrayAdapter<String>(this, 
				R.layout.rowfile, R.id.rowTextView, l);
		
		ListView mainList = (ListView)findViewById(R.id.listLatestData);
		
		mainList.setAdapter(adaptor);
		
		for (Entry entry : list) {
			Log.i(TAG, "Adding entry weight: " + entry.WeightEntry);
			l.add(entry.DateEntry + " - " + entry.WeightEntry);
		}
		adaptor.notifyDataSetChanged();
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
			String currentTime = (String) android.text.format.DateFormat.format("yyyy-MM-dd hh:mm:ss", new java.util.Date());
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
	}
}
