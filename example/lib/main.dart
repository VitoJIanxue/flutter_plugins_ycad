import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:async';
import './models/yc_ad_model.dart';

import 'package:flutter/services.dart';
import 'package:flutter_plugin_ycad/flutter_plugin_ycad.dart';
void reportErrorAndLog(FlutterErrorDetails details) {
  print("...// 构建错误信息");
  print(details);
  Zone.current.handleUncaughtError(details.exception, details.stack);
  print("... //上报错误和日志逻辑");

}

FlutterErrorDetails makeDetails(Object obj, StackTrace stack) {
  print("...// 构建错误信息");
  // EasyLoading.showError(obj.toString(), duration: Duration(seconds: 30));
  print(obj);
  print(stack);
}

void main() {

  runZoned(
        () => runApp(MyApp()),
    onError: (Object obj, StackTrace stack) {
      var details = makeDetails(obj, stack);
      reportErrorAndLog(details);
    },
  );

  // runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();

    // FlutterPluginYcad.init('485572e2b357f9c7471e84f8092e977a').then((value){
    //   print("success=$value");
    //   // FlutterPluginYcad.getAd(5000).then((value){
    //   //   print("success=$value");
    //   // }).catchError((e){
    //   //   print("error=$e");
    //   // });
    //
    // }).catchError((e){
    //   print("error=$e");
    // });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(onPressed: (){
                  FlutterPluginYcad.init('485572e2b357f9c7471e84f8092e977a').then((value){
                  print("success=$value");
                  var json = jsonDecode(value);
                  YXADBean adbean = YXADBean.fromJson(json);
                  print(adbean.result);
                  print(adbean.result.picUrl);
                }).catchError((e){
                  print("error=$e");
                });
              }, child: Text('初始化')),
              TextButton(onPressed: (){
                // \sizeModel1.pid(@"285820").areaId(@"110000");
                FlutterPluginYcad.getAd(5000).then((value){
                  print("success=$value");
                  var json = jsonDecode(value);
                  YXADBean adbean = YXADBean.fromJson(json);
                  print(adbean.result);
                  print(adbean.result.picUrl);
                }).catchError((e){
                  print("error=$e");
                });
              }, child: Text('获取广告')),
            ],
          ),
        ),
      ),
    );
  }
}
