package limrotoTech.sweight;

import limrotoTech.sweight.Entry;

import android.os.Bundle;
import android.app.Activity;
import android.util.Log;
import android.view.KeyEvent;
import android.view.Menu;
import android.view.View;
import android.view.View.OnKeyListener;
import android.widget.EditText;

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
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu)
	{
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.main, menu);
		return true;
	}
	
	public void OnAddClick(View v)
	{
		Log.i(TAG,"Click on 'Enter' button");
		EditText t = (EditText)findViewById(R.id.editText1);
		
		Log.i(TAG, "Fetching the input");
		double input = Double.parseDouble(t.getText().toString());

		Log.i(TAG, "Fetching the current time");
		String currentTime = (String) android.text.format.DateFormat.format("yyyy-MM-dd hh:mm:ss", new java.util.Date());
		
		Log.i(TAG, "Creating new Entry");
		Entry e = new Entry(input, currentTime);
		
		Log.i(TAG, "Inserting in database");
		db.insertEntry(e);
		
		t.setText(""); //Clear text
	}
	
	private void KeyboardListener()
	{
		final EditText t = (EditText) findViewById(R.id.editText1);
		
		t.setOnKeyListener(new OnKeyListener()
		{
		    public boolean onKey(View v, int keyCode, KeyEvent event)
		    {
		        if (event.getAction() == KeyEvent.ACTION_DOWN)
		        {
		            switch (keyCode)
		            {
		                case KeyEvent.KEYCODE_ENTER:
		                	Log.i(TAG, "Enter clicked");
		                    OnAddClick(v); //Add data to database
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
