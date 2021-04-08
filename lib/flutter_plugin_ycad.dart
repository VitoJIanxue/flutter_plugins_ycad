
import 'dart:async';

import 'package:flutter/services.dart';

class FlutterPluginYcad {
  static const MethodChannel _channel =
      const MethodChannel('flutter_plugin_ycad');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future init(String pubid){
    return  _channel.invokeMethod('init',{'pubid': pubid});
  }

  static Future getAd(int pid){
    return  _channel.invokeMethod('getAd',{'pid': pid});
  }

}
