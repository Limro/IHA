package iha.SMAP.handin4;

import android.app.Activity;
import android.os.Bundle;
import android.text.Editable;
import android.text.TextWatcher;
import android.widget.ArrayAdapter;
import android.widget.EditText;

public class MainActivity extends Activity
{
	private EditText filterText = null;
	ArrayAdapter<String> adapter = null;
	
	private DownloadReceiver _downloadReceiver = null;

	@Override
	protected void onDestroy()
	{
		super.onDestroy();
		filterText.removeTextChangedListener(filterTextWatcher);
	}

	/** Called when the activity is first created. */
	@Override
	public void onCreate(Bundle savedInstanceState)
	{
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
		
		_downloadReceiver = new DownloadReceiver();

		FilterListener(); //When text changes
	}

	@Override
	protected void onResume() {
		// TODO Auto-generated method stub
		super.onResume();
		//_downloadReceiver.o
	}



	private TextWatcher filterTextWatcher = new TextWatcher()
	{
		@Override
		public void afterTextChanged(Editable s)
		{}

		public void beforeTextChanged(CharSequence s, int start, int count, int after)
		{}

		public void onTextChanged(CharSequence s, int start, int before, int count)
		{
			adapter.getFilter().filter(s);
		}
	};

	private void FilterListener()
	{
	    filterText = (EditText) findViewById(R.id.editText1);
	    filterText.addTextChangedListener(filterTextWatcher);

	    //setListAdapter(new ArrayAdapter<String>(this, android.R.layout.list_content, getStringArrayList());
	}
}
