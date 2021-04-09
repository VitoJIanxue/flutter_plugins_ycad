package com.yixin.flutter_plugin_ycad;

import android.app.Activity;
import android.provider.Telephony;

import androidx.annotation.NonNull;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.yiche.ssp.ad.ISDKCallBack;
import com.yiche.ssp.ad.YCAdPlatform;
import com.yiche.ssp.ad.bean.AdBean;
import com.yiche.ssp.ad.bean.Paras;

import java.util.ArrayList;
import java.util.List;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugin.common.PluginRegistry.Registrar;


/**
 * FlutterPluginYcadPlugin
 */
public class FlutterPluginYcadPlugin implements FlutterPlugin, MethodCallHandler, ActivityAware {

    private Activity activity;
    private MethodChannel channel;

    static class AdBeanWrapper {
        private int statusCode;
        private List<AdBean> beans;

        public int getStatusCode() {
            return statusCode;
        }

        public void setStatusCode(int statusCode) {
            this.statusCode = statusCode;
        }

        public List<AdBean> getBeans() {
            return beans;
        }

        public void setBeans(List<AdBean> beans) {
            this.beans = beans;
        }
    }

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {

        channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "flutter_plugin_ycad");
        channel.setMethodCallHandler(this);
    }

    @Override
    public void onMethodCall(@NonNull final MethodCall call, @NonNull final Result result) {
        if (call.method.equals("init")) {
            String pubid = call.argument("pubid");
            if (pubid == null || pubid.isEmpty()) {
                result.error("-1", "pubid cannot be empty", "");
                return;
            }
            YCAdPlatform.getInstance().init(activity.getApplicationContext(), pubid);
            YCAdPlatform.getInstance().setUrl(YCAdPlatform.URL_RELEASE);
            result.success(null);
        } else if (call.method.equals("getAd")) {
            int pid = call.argument("pid");
            List<Paras> paras = new ArrayList<>();
            Paras paras1 = new Paras();
            paras1.setPid(285820);
//            sizeModel1.pid(@"285820").areaId(@"110000");
            paras1.setAreaId(110000);
            paras.add(paras1);
            YCAdPlatform.getInstance().getAd(paras, new ISDKCallBack() {
                @Override
                public void onResponse(int status, List<AdBean> beans) {
                    AdBeanWrapper wrapper = new AdBeanWrapper();
                    wrapper.setStatusCode(status);
                    wrapper.setBeans(beans);
                    String json = new Gson().toJson(wrapper);
                    String json1 = new Gson().toJson(beans.get(0));
                    AdBean bb = new Gson().fromJson(json, AdBean.class);
                    result.success(json1);

                }

                @Override
                public void onError(int status, String msg) {
                    result.error(""+status,msg,null);
                }
            });
        } else {
            result.notImplemented();
        }
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        channel.setMethodCallHandler(null);
    }

    @Override
    public void onAttachedToActivity(@NonNull ActivityPluginBinding binding) {
        this.activity = binding.getActivity();
    }

    @Override
    public void onDetachedFromActivityForConfigChanges() {

    }

    @Override
    public void onReattachedToActivityForConfigChanges(@NonNull ActivityPluginBinding binding) {

    }

    @Override
    public void onDetachedFromActivity() {

    }
}
