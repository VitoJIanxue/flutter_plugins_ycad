//
//  ADMobiReqModel.h
//  YicheNativeAds
//
//  Created by YICHE on 2017/8/6.
//  Copyright © 2017年 YICHE. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YCAdSizeModel : NSObject

//广告平台分配给媒体的广告位唯一标识 （必传）
@property (readonly, nonatomic, copy) YCAdSizeModel * (^pid)(NSString *pid);

//广告位的物理宽度描述 （非必传，默认为 0）
@property (readonly, nonatomic, copy) YCAdSizeModel * (^adw)(NSString *adw);

//广告位的物理高度描述 （非必传，默认为 0）
@property (readonly, nonatomic, copy) YCAdSizeModel * (^adh)(NSString *adh);

//广告位省份ID或城市ID描述 （非必传，默认为 1）
@property (readonly, nonatomic, copy) YCAdSizeModel * (^areaId)(NSString *areaId);

//广告位的品牌ID描述，按易车品牌库标准传递，（非必传，默认为 0）
@property (readonly, nonatomic, copy) YCAdSizeModel * (^brandId)(NSString *brandId);

//广告位的车型ID描述，按易车车型库标准传递，（非必传，默认为 0）
@property (readonly, nonatomic, copy) YCAdSizeModel * (^modelId)(NSString * modelId);

//广告位的关键词，字符串以utf-8编码，获取无效可传空数组,非必传
@property (readonly, nonatomic, copy) YCAdSizeModel * (^keyword)(NSArray<NSString*> *keyword);

//广告位是否支持deepLink,YES 表示支持则调起第三方APP,NO 表示不支持,(非必传，默认为 NO）
@property (readonly, nonatomic, assign) YCAdSizeModel * (^appInstall)(BOOL appInstall);
//搜索词广告添加新参数，参数名称是search，类型是字符串（非必填，默认为 0）
@property (readonly, nonatomic, copy) YCAdSizeModel * (^search)(NSString * search);

//客户端上下文内容ID 类型是字符串（非必传，默认为 0）
@property (readonly, nonatomic, copy) YCAdSizeModel * (^pageId)(NSString * pageId);

//客户端上下文内容类型 类型是字符串（非必传，默认为 0）
@property (readonly, nonatomic, copy) YCAdSizeModel * (^dtype)(NSString * dtype);

@end


@interface ADMobiReqModel : NSObject

/***请传YCAdSizeModel对象 (必传)***/
@property (readonly, nonatomic, copy) ADMobiReqModel * (^adsize)(NSArray<YCAdSizeModel*> *adsize);

/***SDK 单独设置每次请求的超时时间，单位为 毫秒 (非必传)，默认为 1000 ms ***/
@property (readonly, nonatomic, copy) ADMobiReqModel * (^timeOut)(NSInteger timeOut);


@end


