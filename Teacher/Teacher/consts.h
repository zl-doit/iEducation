//
//  GlobalMacro.h
//  SearchDriver
//
//  Created by xcode on 13-5-6.
//  Copyright (c) 2013年 zhangL. All rights reserved.
//



#import "AppDelegate.h"

//测试标标识，发布时干掉
#ifndef edu_DEBUG
#define edu_DEBUG 0
#endif

#if edu_DEBUG
#define HOST @"139.129.194.164:8080/request"
//#define HOST @"localhost:8080/edu.service/request/"
#define alipay_nofity_url @"http://139.129.194.164:8080/pay/alipay"
#define ABOUT_US_URL @"http://139.129.194.164:8085/app/about"
#else
#define HOST @"service.dudusulian.com/request"
#define alipay_nofity_url @"http://service.dudusulian.com/pay/alipay"
#define ABOUT_US_URL @"http://mobile.dudusulian.com/app/about"
#endif

//内部版本号，1,2,3,4
#ifndef kBundleVersion
#define kBundleVersion  [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]
#endif

//app间调用的scheme
#define kSelfScheme @"edu"
#define kSelfSchemeUrlPrefix @"edu://"

//相关沙盒目录
#define SAND_BOX_PATH_DOCUMENT_GLOBAL_DOCUMENT @"global"
#define SAND_BOX_PATH_DOCUMENT_GLOBAL_FILE_SYSTEM_USERINFO    @"edu_sys_user"

//钥匙串存储key
#define APP_SERVICE_KEY @"edu_system"
#define KEYCHAIN_DEVICE_USER_INFO  @"eduSeviceUserInfo"
#define KEYCHAIN_CURRENT_USER_TOKEN @"usertoken"
#define KEYCHAIN_CURRENT_USER_NAME @"username"
#define KEYCHAIN_CURRENT_USER_PASSWORD @"password"

//默认loading图片
#define loadingDefaultImage ([UIImage imageNamed:@"loading_detault"])

//导航栏背景
#define NAV_BAR_BG_COLOR            RGBACOLOR(250,250,250,1.0)
//导航栏前景颜色
#define NAV_BAR_TINT_COLOR          RGBACOLOR(172,172,172,1.0)
//普通分割线默认颜色
#define SPLITE_BACKGROUND_COLOR     RGBCOLOR(230,230,230)
