package dev.emmanuelrobinson.keepawake;

import com.getcapacitor.JSObject;
import com.getcapacitor.Plugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.PluginMethod;
import com.getcapacitor.annotation.CapacitorPlugin;
import android.app.Activity;
import android.view.WindowManager;

@CapacitorPlugin(name = "KeepAwake")
public class KeepAwakePlugin extends Plugin {

    private KeepAwake implementation = new KeepAwake();
    private boolean isKeepingAwake = false;

    @PluginMethod
    public void echo(PluginCall call) {
        String value = call.getString("value");

        JSObject ret = new JSObject();
        ret.put("value", implementation.echo(value));
        call.resolve(ret);
    }

    @PluginMethod
    public void enable(PluginCall call) {
        Activity activity = getActivity();
        if (!isKeepingAwake) {
            activity.runOnUiThread(() -> {
                activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
                isKeepingAwake = true;
            });
        }
        call.resolve();
    }

    @PluginMethod
    public void disable(PluginCall call) {
        Activity activity = getActivity();
        if (isKeepingAwake) {
            activity.runOnUiThread(() -> {
                activity.getWindow().clearFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
                isKeepingAwake = false;
            });
        }
        call.resolve();
    }

    @PluginMethod
    public void isEnabled(PluginCall call) { // Return the current state
        JSObject result = new JSObject();
        result.put("value", isKeepingAwake);
        call.resolve(result);
    }

}
