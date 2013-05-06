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

import android.app.Service;
import android.content.Intent;
import android.os.Binder;
import android.os.IBinder;
import android.util.Log;

public class ITogService extends Service
{
	public ITogService()
	{
		DownloadJSONList(); //Overskrider 5 sek? Ingen netforbindelse?
	}

	// Binder given to clients
	private final IBinder mBinder = new LocalBinder();


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
		String result = null;
		URI myURI = null;

		try
		{
			myURI = new URI("itog/action/list/format/json");
		}
		catch (URISyntaxException e)
		{
			// Deal with it
		}

		HttpClient httpClient = new DefaultHttpClient();
		HttpGet getMethod = new HttpGet(myURI);
		HttpResponse webServerResponse = null;

		try
		{
			webServerResponse = httpClient.execute(getMethod);
		}
		catch (ClientProtocolException e)
		{}
		catch (IOException e)
		{}

		HttpEntity httpEntity = webServerResponse.getEntity();

		if (httpEntity != null)
		{
			InputStream instream;
			try
			{
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
		}
		catch (JSONException e)
		{}
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
