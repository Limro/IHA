package iha.SMAP.handin4;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;

public class DownloadReceiver extends BroadcastReceiver {
	public static final String ACTION_RESP = "iha.SMAP.intent.action.MESSAGE_PROCESSED";
	private final String TAG = "DownloadReceiver";
	
    @Override
    public void onReceive(Context context, Intent intent) {

    	Log.e(TAG, "Do somethingin here");
    	Bundle extras = intent.getExtras();
    	
    	if(extras != null)
    	{
    		String state = extras.getString(ACTION_RESP);
    		if(state.equals(arg0))
    	}
    }
}
