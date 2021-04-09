#import "FlutterPluginYcadPlugin.h"
#import "YCMobiSDK.h"
#import "MJExtension.h"

@implementation FlutterPluginYcadPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"flutter_plugin_ycad"
            binaryMessenger:[registrar messenger]];
  FlutterPluginYcadPlugin* instance = [[FlutterPluginYcadPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    //初始化易车广告SDK
    [YCMobiSDK initNativeAds:@"485572e2b357f9c7471e84f8092e977a" andkey:@"140aae90c852e3a03406c005dfa5bf2c" andEnvironment:SSP_AD_SDK_Release];
    [self getHomeBannerListresult:result];


//  if ([@"getPlatformVersion" isEqualToString:call.method]) {
//  NSLog(@"时0000000额");
//    result([@"iOS：：：： " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
//  } else {
//    result(FlutterMethodNotImplemented);
//  }
}


//获取首页顶部Banner
- (void)getHomeBannerListresult:(FlutterResult)result
{
    YCAdSizeModel *sizeModel1 = [YCAdSizeModel new];
    sizeModel1.pid(@"285820").areaId(@"110000");
//    YCAdSizeModel *sizeModel2 = [YCAdSizeModel new];
//    sizeModel2.pid(@"285778").areaId(@"1001000");
//    YCAdSizeModel *sizeModel3 = [YCAdSizeModel new];
//    sizeModel3.pid(@"285785").areaId(@"12324");
//    YCAdSizeModel *sizeModel4 = [YCAdSizeModel new];
//    sizeModel4.pid(@"285792").areaId(@"97678");
//    YCAdSizeModel *sizeModel5 = [YCAdSizeModel new];
//    sizeModel5.pid(@"285799").areaId(@"78766");
//    YCAdSizeModel *sizeModel6 = [YCAdSizeModel new];
//    sizeModel6.pid(@"285820").areaId(@"9888");
//    YCAdSizeModel *sizeModel7 = [YCAdSizeModel new];
//    sizeModel7.pid(@"285827").areaId(@"89887");
//    YCAdSizeModel *sizeModel8 = [YCAdSizeModel new];
//    sizeModel8.pid(@"285834").areaId(@"998");
    ADMobiReqModel *reqModel=[[ADMobiReqModel alloc] init];
//    reqModel.adsize(@[sizeModel1,sizeModel2,sizeModel3,sizeModel4,sizeModel5,sizeModel6,sizeModel7,sizeModel8]); reqModel.timeOut(2000);
    reqModel.adsize(@[sizeModel1]); reqModel.timeOut(2000);
    [YCMobiSDK fetchNativeAdWithADMobiReqModel:reqModel ResultBlock:^(BOOL isSuccess, NSArray *dataArray, NSString *msg) {
        NSLog(@"%@",dataArray);
        ADBean *bean = dataArray[0];
        NSDictionary *stuDict = bean.mj_keyValues;
        
        result([self convertToJsonData:stuDict]);
        //        dispatch_async(dispatch_get_main_queue(), ^{
//            if (isSuccess && dataArray.count > 0) {
//                self.arrayBanner = [NSMutableArray array];
//                self.arrayImgs = [NSMutableArray array];
//                for (ADBean *bean in dataArray) {
//                    [self.arrayImgs addObject:bean.result.picUrl];
//                    [self.arrayBanner addObject:bean];
//                }
//                [self setBannerView];
//                self.cycleScrollView.placeholderImage = UIImage.new;
//
//            }else{
//                DLog(@"msg=%@",msg);
//            }
//        });
    }];
    
}

-(NSString *)convertToJsonData:(NSDictionary *)dict

{

    NSError *error;

    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];

    NSString *jsonString;

    if (!jsonData) {

        NSLog(@"%@",error);

    }else{

        jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];

    }

    NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];

    NSRange range = {0,jsonString.length};

    //去掉字符串中的空格

    [mutStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:range];

    NSRange range2 = {0,mutStr.length};

    //去掉字符串中的换行符

    [mutStr replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range2];

    return mutStr;

}

@end
