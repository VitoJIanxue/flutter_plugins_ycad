//
//  ADBean.h
//  YicheNativeAds
//
//  Created by YICHE on 16/8/26.
//  Copyright © 2016年 YICHE. All rights reserved.
// 广告对象

#import <Foundation/Foundation.h>

@interface ADDetailModel : NSObject

@property (nonatomic,copy)NSNumber *creativeid;       //广告素材ID
@property (nonatomic,copy)NSString *picUrl;           //广告素材图片地址（多个以逗号分隔)
@property (nonatomic,strong)NSArray *picUrls;        //广告素材图片地址数组（是根据上面的picUrl由逗号","分割得来的数组)
@property (nonatomic,copy)NSString *title;                //广告素材标题
@property (nonatomic,copy)NSString *url;                  //广告素材落地页
@property (nonatomic,copy)NSString *videoUrl;        //视频类型素材，该地址为视频资源地
@property (nonatomic,copy)NSString *content;         //内容
@property (nonatomic,copy)NSString *summary;        //简介
@property (nonatomic,assign)NSInteger evtType;      //广告点击事件的类型（0:不操作 1:ios APP 2：安卓APP 3:网址链接）
@property (nonatomic,copy)NSString *showTime;//显示时间（开机广告）
@property (nonatomic,copy)NSString *appId;          //苹果ID
@property (nonatomic,copy)NSString *brandId;        //品牌ID，默认为0
@property (nonatomic,copy)NSString *serialId;       //车型ID，默认为0
@property (nonatomic,copy)NSString *exposureTp;     //第三方曝光监控URL地址，以英文输入法状态下的|,|分隔
@property (nonatomic,copy)NSString *clickTp;        //第三方点击监控URL地址(已弃用)
@property (nonatomic,copy)NSString *clickTrack;      //第三方点击监控URL地址
@property (nonatomic,copy) NSString *tempId;        //素材模版ID

@property (nonatomic,copy) NSString *packName;        //小视频推荐：品牌名
@property (nonatomic,copy) NSString *packUrl;        //背景长图的占位图或者小视频推荐的品牌logo

@property (nonatomic,strong) NSDictionary *extData; // 扩展信息
@property (nonatomic,copy) NSString *carid;         //车款id

@end

@interface ADBean : NSObject

@property (nonatomic,copy) NSString *statusCode;// 广告位请求状态码
@property (nonatomic,copy) NSString *statusMsg;//状态信息
@property (nonatomic,assign) NSInteger pid;//广告位ID
@property (nonatomic,assign) NSInteger type;//广告素材类型//文档目前为19种，具体样式不做渲染
@property (nonatomic,strong) ADDetailModel *result;//广告内容实体，包括广告组成的单元项

@end
