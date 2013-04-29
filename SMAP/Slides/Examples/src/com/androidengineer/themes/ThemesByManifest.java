package com.androidengineer.themes;

import android.app.Activity;
import android.os.Bundle;

/**
 * This activity's theme is set in the manifest.  It does not need to set the
 * theme in the onCreate() method.
 *
 * @author Matt Quigley
 *
 */
public class ThemesByManifest extends Activity
{
	/** Called when the activity is first created. */
	@Override
	public void onCreate(Bundle savedInstanceState)
	{
		super.onCreate(savedInstanceState);
		setContentView(R.layout.main);
	}
}