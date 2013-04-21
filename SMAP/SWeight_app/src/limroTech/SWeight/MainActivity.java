package limroTech.SWeight;

import android.os.Bundle;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.view.Menu;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;

public class MainActivity extends Activity 
{

	Button newEntry, showData, showGraph;
	
    @Override
    protected void onCreate(Bundle savedInstanceState) 
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
		addListenerOnButtons();
    }


    @Override
    public boolean onCreateOptionsMenu(Menu menu) 
    {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.main, menu);
        return true;
    }
    
    public void addListenerOnButtons() 
    {
		final Context context = this;
 
		newEntry = (Button) findViewById(R.id.btnEntry);
		showGraph = (Button) findViewById(R.id.btnData);
		showData = (Button) findViewById(R.id.btnGraph);
 
		newEntry.setOnClickListener(new OnClickListener() 
			{ 
				@Override
				public void onClick(View arg0) 
				{
					Intent intent = new Intent(context, secondActivity.class);
			    	startActivity(intent);   
				} 
			});
		
		showGraph.setOnClickListener(new OnClickListener() 
		{ 
			@Override
			public void onClick(View arg0) 
			{
				Intent intent = new Intent(context, secondActivity.class);
		    	startActivity(intent);   
			} 
		});
		
		showData.setOnClickListener(new OnClickListener() 
		{ 
			@Override
			public void onClick(View arg0) 
			{
				Intent intent = new Intent(context, secondActivity.class);
		    	startActivity(intent);   
			} 
		});
    }
}
