//
//  YCMobiSDK.h
//  YicheMobileAds
//
//  Created by YICHE on 16/8/15.
//  Copyright © 2016年 YICHE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ADMobiReqModel.h"
#import "ADBean.h"
@import UIKit;

typedef enum : NSInteger {
    SSP_AD_SDK_Debug = 0, //线下调试环境
    SSP_AD_SDK_PRE,//预览环境
    SSP_AD_SDK_Release,//正式发版环境，正式上线务必要使用此模式！此模式下无日志打印！
}SSPEnvironment;

typedef void(^YCFailureBlock)(NSString *errrorCode,NSString *errorMsg);

typedef void(^YCSuccessBlock)(UIView *uiview,ADBean *adBean);

@interface YCMobiSDK : NSObject

/**
 *  初始化 pubid & key 以及开发环境枚举设置
 *  SSPEnvironment，正式上线请务必设置为：SSP_AD_SDK_Release
 */
+ (void) initNativeAds:(NSString *)pubid andkey:(NSString *)key andEnvironment:(SSPEnvironment)environment;
/**
 *  同步dvid 用于更新id
 */
+ (void)synchronizeForDvid:(NSString *)dvid ;

/**
 *   获取广告 ：只要接口调用成功, resultBlock 的 Bool 就返 回 YES。可根据 dataArray 的 count 值判断此广告位 有无物料。
 *   @param model  请求参数model
 *   Block返回值：
 *   isSuccess： 广告位请求是否成功 标识
 *   dataArray：封装好的 ADBean 广告物料数组
 *   msg ： 指示信息
 */
+ (void)fetchNativeAdWithADMobiReqModel:(ADMobiReqModel *)model ResultBlock:(void (^)(BOOL isSuccess, NSArray *dataArray,NSString *msg))resultBlock;

/**
 *  发送曝光统计
 *
 *  @param model 获取到的广告物料
 */
+ (void)sendExposeWithADModel:(ADBean *)model;


/**
 *  发送点击统计,此方法废弃，使用 `+(void)sendClickTrackWithADModel:`方法代替
 *
 *  @param model 获取到的广告物料
 */
+ (void)sendClickWithWithADModel:(ADBean *)model DEPRECATED_MSG_ATTRIBUTE("use +(void)sendClickTrackWithADModel: instead");

/**
 *  发送点击统计
 *
 *  @param model 获取到的广告物料
 */
+ (void)sendClickTrackWithADModel:(ADBean *)model;

/**
 *  获取sdk版本号
 *
 *  @return version
 */
+ (NSString *)sdkVersion;

/**
 *   获取广告,请传单广告位大图广告
 *
 */
+ (void)getBannerView:(ADMobiReqModel *)model successBlock:(YCSuccessBlock)successBlock failueBlock:(YCFailureBlock)failueBlock;





@end
