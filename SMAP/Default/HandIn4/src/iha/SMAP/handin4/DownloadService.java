package iha.SMAP.handin4;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URI;
import java.net.URISyntaxException;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import android.app.IntentService;
import android.app.Service;
import android.content.Intent;
import android.os.Bundle;
import android.os.IBinder;
import android.util.Log;

public class DownloadService extends IntentService {
	
	private final String TAG = "DownloadService";
	private final String PARAM_OUT_MSG = "asd";
	
	public DownloadService(String name) {
		super(name);
		// TODO Auto-generated constructor stub
	}

	@Override
	protected void onHandleIntent(Intent workIntent) {
	    
		String result = null;
		URI myURI = null;

		try
		{
			Log.i(TAG, "Getting uri");
			myURI = new URI("itog/action/list/format/json");
		}
		catch (URISyntaxException e)
		{
			Log.d(TAG, "Uri not retrived");
		}

		HttpClient httpClient = new DefaultHttpClient();
		HttpGet getMethod = new HttpGet(myURI);
		HttpResponse webServerResponse = null;

		try
		{
			Log.i(TAG, "Executing webSerResponse");
			webServerResponse = httpClient.execute(getMethod);
		}
		catch (ClientProtocolException e)
		{
			Log.d(TAG, e.toString());
		}
		catch (IOException e)
		{
			Log.d(TAG, e.toString());
		}

		Log.i(TAG, "Creating httpEntity");
		HttpEntity httpEntity = webServerResponse.getEntity();

		if (httpEntity != null)
		{
			InputStream instream;
			try
			{
				Log.i(TAG, "Fetching data content");
				instream = httpEntity.getContent();
				result = convertStreamToString(instream);
				instream.close();
			}
			catch (IllegalStateException e)
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			catch (IOException e)
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		JSONObject myJSON = null;

		try
		{
			myJSON = new JSONObject(result);
			JSONArray array = myJSON.getJSONArray("items");

			for (int i = 0; i < array.length(); i++)
			{
				JSONObject windJSON = array.getJSONObject(i);

				String name = windJSON.getString("name");
				Log.d("WINDSPOTTER", name);

			}
			
			Intent broadcastIntent = new Intent();
			Bundle b = new Bundle();
			b.put
			
			broadcastIntent.setAction(DownloadReceiver.ACTION_RESP);
			broadcastIntent.addCategory(Intent.CATEGORY_DEFAULT);
			broadcastIntent.putExtra(PARAM_OUT_MSG, array);
			
			sendBroadcast(broadcastIntent);
		}
		catch (JSONException e)
		{}

	}

}
