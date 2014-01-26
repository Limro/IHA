package iha.SMAP.handin2;

import java.util.Currency;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.Vibrator;
import android.sax.StartElementListener;
import android.widget.Toast;
import android.content.Context.*;

public class MyBroadcastReceiver extends BroadcastReceiver {
	public MyBroadcastReceiver() {
	}

	@Override
	public void onReceive(Context context, Intent intent) {
		
		Intent i = new Intent();
		i.setClass(context, ActivityB.class);
		i.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
		context.startActivity(i);
		
		Toast.makeText(context, "Don't panik but your time is up!!!!.", Toast.LENGTH_LONG).show();

		// Vibrate the mobile phone
	    Vibrator vibrator = (Vibrator) context.getSystemService(Context.VIBRATOR_SERVICE);
	    vibrator.vibrate(2000);
	}
}
