package iha.SMAP.exercise3_2;

import android.os.Bundle;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.view.Menu;
import android.view.View;
import android.widget.Toast;

public class SecondActivity extends Activity {

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_second);
		
//		String message = (String)getIntent().getStringExtra("message");
//		
//		Context context = getApplicationContext();
//		int duration = Toast.LENGTH_SHORT;
//
//		Toast toast = Toast.makeText(context, message, duration);
//		toast.show();
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.second, menu);
		return true;
	}
	
	public void MainClick(View v)
	{
		Intent i = new Intent(this, MainActivity.class);
		startActivityForResult(i, 1);
	}
	
}
