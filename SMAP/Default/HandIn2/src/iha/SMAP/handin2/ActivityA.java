package iha.SMAP.handin2;

import android.os.Bundle;
import android.os.IBinder;
import android.app.Activity;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.view.Menu;
import android.view.View;
import android.widget.EditText;
import android.util.Log; 
import iha.SMAP.handin2.TimerService.*;

public class ActivityA extends Activity {

	static String Tag = "ActivityA";
	TimerService mService;
    boolean mBound;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_activity);
        Log.i(Tag, "onCreate Called");    
        mBound = false;
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.activity, menu);
        return true;
    }

	@Override
	protected void onDestroy() {
		// TODO Auto-generated method stub
		super.onDestroy();
		Log.i(Tag, "onDestroy");
	}

	@Override
	protected void onPause() {
		// TODO Auto-generated method stub
		super.onPause();
		Log.i(Tag,"onPause" );
	}

	@Override
	protected void onRestart() {
		// TODO Auto-generated method stub
		super.onRestart();
		Log.i(Tag, "onRestart");
	}

	@Override
	protected void onResume() {
		// TODO Auto-generated method stub
		super.onResume();
		Log.i(Tag, "onResume");
	}

	@Override
	protected void onStart() {
		// TODO Auto-generated method stub
		super.onStart();
		Log.i(Tag, "onStart");
		
//		Intent i = new Intent(this, TimerService.class);
//		Log.i(Tag, "Binding to service...");
//		if(bindService(i, mConnection, Context.BIND_AUTO_CREATE))
//		{
//			Log.i(Tag, "Succesfully started service");
//		}
//		else
//		{
//			Log.i(Tag, "Service NOT started correctly - suck it up");
//		}
		
	}

	@Override
	protected void onStop() {
		// TODO Auto-generated method stub
		super.onStop();
		Log.i(Tag, "onStop");
	}

    /** Defines callbacks for service binding, passed to bindService() */
//    private ServiceConnection mConnection = new ServiceConnection() 
//    {
//        @Override
//        public void onServiceConnected(ComponentName className, IBinder service) 
//        {
//            // We've bound to LocalService, cast the IBinder and get LocalService instance
//            LocalBinder binder = (LocalBinder) service;
//            mService = binder.getService(); 
//            mBound = true;
//            Log.i(Tag, "Establish connection to Service");
//        }
//
//        @Override
//        public void onServiceDisconnected(ComponentName arg0) 
//        {
//        	Log.i(Tag, "Disconnect from Service");
//        	mBound = false;
//        }
//    };
//    
	public void btnSet(View v)
	{
		Log.i(Tag, "Set button clicked");
		
		Bundle extra = new Bundle();
		
		EditText timeField = (EditText)findViewById(R.id.inputSeconds);
		extra.putInt("timerData", Integer.parseInt(timeField.getText().toString()));
		
		Intent i = new Intent();
		
		i.putExtras(extra);		
		i.setClass(this, TimerService.class);
		
		try
		{
			Log.i(Tag, "Activating service");
			startService(i);
		}
		catch(Exception ex)
		{
			Log.e(Tag, ex.toString());
		}
	}
}
