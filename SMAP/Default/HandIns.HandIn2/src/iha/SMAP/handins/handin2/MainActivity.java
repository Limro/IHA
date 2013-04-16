package iha.SMAP.handins.handin2;

import android.os.Bundle;
import android.app.Activity;
import android.view.Menu;
import android.util.Log;
import android.widget.Toast;
import android.content.Context;

public class MainActivity extends Activity {

	private static final String Tag = "activity_main";
	
    @Override
    protected void onCreate(Bundle savedInstanceState) 
    {    	
    	Log.d(Tag, "Checking version");
    	if(android.os.Build.VERSION.SDK_INT <= android.os.Build.VERSION_CODES.DONUT)
    	{
    		Log.d(Tag, "Getting context");
    		Context context = getApplicationContext();
    		
	    	CharSequence text = "Too old phone - please upgrade!";
	    	int duration = 1000;
	
	    	Toast toast = Toast.makeText(context, text, duration);
	    	
	    	Log.d(Tag, "Showing toast message");
	    	toast.show();
    	}
    	else
    	{
        	Log.d(Tag, "Calling super");
        	super.onCreate(savedInstanceState);
	        
	        setContentView(R.layout.activity_main);
	        Log.d(Tag, "Change onCreate state");
    	}
    }


    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.main, menu);
        return true;
    }


	@Override
	protected void onDestroy() {
		// TODO Auto-generated method stub
		super.onDestroy();
        Log.d(Tag, "Change onCreateOptionsMenu state");
	}


	@Override
	protected void onPause() {
		// TODO Auto-generated method stub
		super.onPause();
        Log.d(Tag, "Change onPause state");
	}


	@Override
	protected void onRestart() {
		// TODO Auto-generated method stub
		super.onRestart();
        Log.d(Tag, "Change onRestart state");
		
	}


	@Override
	protected void onRestoreInstanceState(Bundle savedInstanceState) {
		// TODO Auto-generated method stub
		super.onRestoreInstanceState(savedInstanceState);
        Log.d(Tag, "Change onRestoreInstanceState state");
	}


	@Override
	protected void onSaveInstanceState(Bundle outState) {
		// TODO Auto-generated method stub
		super.onSaveInstanceState(outState);
        Log.d(Tag, "Change onSaveInstanceState state");
	}


	@Override
	protected void onStart() {
		// TODO Auto-generated method stub
		super.onStart();
        Log.d(Tag, "Change onStart state");
	}


	@Override
	protected void onStop() {
		// TODO Auto-generated method stub
		super.onStop();
        Log.d(Tag, "Change onStop state");
	}


	@Override
	protected void onResume() {
		// TODO Auto-generated method stub
		super.onResume();
		Log.d(Tag, "change onResume state");
	}
    
    
    
}
