package iha.SMAP.handin4;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

import android.app.Service;
import android.content.Intent;
import android.os.Binder;
import android.os.IBinder;
import android.util.Log;

public class ITogService extends Service
{
	private final String TAG = "ITogService";
	private final IBinder mBinder = new LocalBinder();
	
	public ITogService()
	{
		DownloadJSONList(); 
	}	

	public class LocalBinder extends Binder
	{
		ITogService getService()
		{
			return ITogService.this;
		}
	}

	@Override
	public IBinder onBind(Intent intent)
	{
		return mBinder;
	}

	public void DownloadJSONList()
	{
		Log.i(TAG, "Starting DownloadService");
		Intent i = new Intent(this, DownloadService.class);
		startService(i);
	}
	
	public String convertStreamToString(InputStream is) throws IOException
	{
		if (is != null)
		{
			StringBuilder sb = new StringBuilder();
			String line = null;

			try
			{
				BufferedReader reader = new BufferedReader(
						new InputStreamReader(is, "UTF-8"));

				while ((line = reader.readLine()) != null)
				{
					sb.append(line).append("\n");
				}
			}
			finally
			{
				is.close();
			}

			return sb.toString();
		}
		else
		{
			return "";
		}
	}
}
