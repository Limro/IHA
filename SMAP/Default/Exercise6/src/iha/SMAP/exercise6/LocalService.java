package iha.SMAP.exercise6;

import android.app.Service;
import android.content.Intent;
import android.os.Binder;
import android.os.IBinder;
import android.util.Log;

public class LocalService extends Service {
	private final String Tag = "LocalService";
	// Binder given to clients
    private final IBinder mBinder = new LocalBinder();
    
    
    private Integer aValue = 0;

	@Override
	public void onDestroy() {
		// TODO Auto-generated method stub
		super.onDestroy();
		stopSelf();
	}
	
    /**
     * Class used for the client Binder.  Because we know this service always
     * runs in the same process as its clients, we don't need to deal with IPC.
     */
    public class LocalBinder extends Binder {
        LocalService getService() {
        	Log.i(Tag, "Service started");
            // Return this instance of LocalService so clients can call public methods
            return LocalService.this;
        }
    }

    @Override
    public IBinder onBind(Intent intent) {
    	Log.i(Tag, "onBind()");
        return mBinder;
    }

    public int getValue()
    {
    	Log.i(Tag, "Setting value");
    	return aValue;
    }
    
    public void changeValue(int newValue)
    {
    	Log.i(Tag, "Returning value");
    	aValue = newValue;
    }
}
