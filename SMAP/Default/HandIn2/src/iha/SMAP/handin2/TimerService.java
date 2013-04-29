package iha.SMAP.handin2;

import android.app.AlarmManager;
import android.app.PendingIntent;
import android.app.Service;
import android.content.Intent;
import android.os.Binder;
import android.os.Bundle;
import android.os.CountDownTimer;
import android.os.IBinder;
import android.util.Log;
import android.widget.Toast;

public class TimerService extends Service {
    int mStartMode;       // indicates how to behave if the service is killed
    IBinder mBinder;      // interface for clients that bind
    boolean mAllowRebind; // indicates whether onRebind should be used
    String Tag = "Service";
    CountDownTimer timer; 
    static AlarmManager aManager;

    @Override
    public void onCreate() {
        // The service is being created
    	Log.i(Tag, "onCreate");
    }
    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        // The service is starting, due to a call to startService()
    	Log.i(Tag, "onStartCommand");
    	
    	Bundle extra = intent.getExtras();
    	if(extra != null)
    	{
    		Log.i(Tag, "bundle found in service");
    		try
    		{
    			int time = extra.getInt("timerData");
    			startAlert(time);
    			stopSelf();
    		}
    		catch(Exception ex)
    		{
    			Log.e(Tag, ex.toString());
    		}
    	}
    	else
    	{
    		Log.e(Tag, "Bundle not found! Give up all hope!");
    	}
        return mStartMode;
    }
    @Override
    public IBinder onBind(Intent intent) {
        // A client is binding to the service with bindService()
    	Log.i(Tag, "onBind");
        return mBinder;
    }
    @Override
    public boolean onUnbind(Intent intent) {
        // All clients have unbound with unbindService()
    	Log.i(Tag, "onUnbind");
        return mAllowRebind;
    }
    @Override
    public void onRebind(Intent intent) {
        // A client is binding to the service with bindService(),
        // after onUnbind() has already been called
    	Log.i(Tag, "onRebind");
    }
    @Override
    public void onDestroy() {
        // The service is no longer used and is being destroyed
    	Log.i(Tag, "onDestroy");
    }
    
	public void startAlert(int time) 
	{
		try
		{
			Log.i(Tag, "BroadCasterIntent");
		    Intent intent = new Intent(this, MyBroadcastReceiver.class);
		    
		    Log.i(Tag, "Getting BroadCast");
		    PendingIntent pendingIntent = PendingIntent.getBroadcast(this.getApplicationContext(), 1, intent, 0);
		    
		    Log.i(Tag, "Getting alarmService");
		    AlarmManager alarmManager = (AlarmManager) getSystemService(ALARM_SERVICE);
		    
		    Log.i(Tag, "Set alarm");
		    alarmManager.set(AlarmManager.RTC_WAKEUP, System.currentTimeMillis() + (time * 1000), pendingIntent);
		    
		    Log.i(Tag, "Toast");
		    Toast.makeText(this, "Alarm set in " + time + " seconds", Toast.LENGTH_LONG).show();
		}
		catch(Exception ex)
		{
			Log.e(Tag, ex.toString()); //Log error
		}
	}
	
    public class LocalBinder extends Binder {
        TimerService getService() {
            // Return this instance of LocalService so clients can call public methods
            return TimerService.this;
        }
    }
}