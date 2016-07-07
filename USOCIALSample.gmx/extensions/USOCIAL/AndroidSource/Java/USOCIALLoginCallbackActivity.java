package ${YYAndroidPackageName};

import android.app.Activity;
import android.util.Log;
import android.net.Uri;
import android.os.Bundle;

import com.yoyogames.runner.RunnerJNILib;

public class USOCIALLoginCallbackActivity extends Activity {

	private static final int EVENT_OTHER_SOCIAL = 70;
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);

		if (getIntent() != null) {

		    Uri uri = getIntent().getData();

		    if (uri != null) {

		        int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
				RunnerJNILib.DsMapAddString(dsMapIndex, "type", "USOCIAL_LOGIN");
				RunnerJNILib.DsMapAddString(dsMapIndex, "token", uri.getQueryParameter("token"));
				RunnerJNILib.DsMapAddString(dsMapIndex, "verifier", uri.getQueryParameter("verifier"));
				RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
			}
		}
        finish();
	}
}
