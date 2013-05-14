package iha.SMAP.exercise6;

import iha.SMAP.exercise6.LocalService.LocalBinder;
import android.os.Bundle;
import android.os.IBinder;
import android.app.Activity;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.view.View;
import android.widget.Toast;
import android.util.Log;

public class BindingActivity extends Activity {
    LocalService mService;
    boolean mBound = false;
    private final String Tag = "BindingActivity";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        
        setContentView(R.layout.activity_binding);
        mConnection = service();
    }

    @Override
    protected void onStart() {
        super.onStart();
        
        Log.i(Tag, "Starting service");
        Intent intent = new Intent(this, LocalService.class);
        boolean bound = bindService(intent, mConnection, Context.BIND_AUTO_CREATE);
        if(!bound){
        	Log.d(Tag, "Service is not bound from 'BindService()'");
        }
        if(mConnection == null)
        {
        	Log.d(Tag, "mConnection ej sat");
        }
    }

    @Override
    protected void onStop() {
        super.onStop();
        
        // Unbind from the service
        Log.i(Tag, "unbinding from service");
        try
        {
            unbindService(mConnection);
            mBound = false;
        }
        catch(Exception e)
        {
        	Log.e(Tag, e.toString());
        }
    }

    /** Called when a button is clicked (the button in the layout file attaches to
      * this method with the android:onClick attribute) */
    public void onButtonClick(View v) {
        if (mBound) {
        	Log.i(Tag, "Button Clicked");
            // Call a method from the LocalService.
            // However, if this call were something that might hang, then this request should
            // occur in a separate thread to avoid slowing down the activity performance.
            int num = mService.getValue();
            Toast.makeText(this, "number: " + num, Toast.LENGTH_SHORT).show();
        }
        else{
        	Log.d(Tag, "Button NOT clicked!");
        }
    }

    private ServiceConnection mConnection;
    
    private ServiceConnection service()
    {
    	/** Defines callbacks for service binding, passed to bindService() */
    	return new ServiceConnection() {

        @Override
        public void onServiceConnected(ComponentName className, 
        		IBinder service) {
        	Log.i(Tag, "Binding to service");
            // We've bound to LocalService, cast the IBinder and get LocalService instance
            LocalBinder binder = (LocalBinder) service;
            mService = binder.getService();
            mBound = true;
        }

        @Override
        public void onServiceDisconnected(ComponentName arg0) {
        	Log.i(Tag, "Disconnecting from service");
            mBound = false;
        }
    };
    }
}