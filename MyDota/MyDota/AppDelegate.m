//
//  AppDelegate.m
//  MyDota
//
//  Created by Xiang on 15/10/14.
//  Copyright © 2015年 iOGG. All rights reserved.
//

#import "AppDelegate.h"
#import "GGRequest.h"
#import "WXApi.h"
#import "MobClick.h"
#import "WXApiManager.h"
#import "MyDefines.h"
#import "UMFeedback.h"
#import "MMUSDK.h"



@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [WXApi registerApp:WXApi_ID];
    [MobClick startWithAppkey:MobClick_ID];
    [UMFeedback setAppkey:MobClick_ID];

    [MMUSDK sharedInstance].delegate = (id<MMUSDKDelegate>)self; //设置delegate
    [self.window makeKeyAndVisible];

    [self initGDTSplashAd];

    return YES;
}

-(void)initGDTSplashAd{
    //开屏广告初始化并展示代码

    GDTSplashAd *splash = [[GDTSplashAd alloc] initWithAppkey:@"1104096526" placementId:@"1030000658357420"];
    splash.delegate = self; //设置代理
    //根据iPhone设备不同设置不同背景图
    
    NSString *colorStr;
    if (IS_IPHONE_6P) {
        colorStr = @"LaunchImage-800-Portrait-736h";
    }else if (IS_IPHONE_6){
        colorStr = @"LaunchImage-800-667h";

    }else if (IS_IPHONE_5){
        colorStr = @"LaunchImage-700-568h";

    }else{
        colorStr = @"LaunchImage-700";
    }
    
    splash.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:colorStr]];
    splash.fetchDelay = 3; //开发者可以设置开屏拉取时间,超时则放弃展示
    //开屏广告拉取并展示在当前window中
    [splash loadAdAndShowInWindow:self.window];
    self.splash = splash;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}




- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    dispatchDelay(0.2, [WXApi handleOpenURL:url delegate:[WXApiManager sharedManager]];);
    return  YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    dispatchDelay(0.2, [WXApi handleOpenURL:url delegate:[WXApiManager sharedManager]];);
    return YES;
}



#pragma mark --- GDT
//开屏广告成功展示
-(void)splashAdSuccessPresentScreen:(GDTSplashAd *)splashAd{
    
}
-(void)splashAdFailToPresent:(GDTSplashAd *)splashAd withError:(NSError *)error{
    
}
- (void)splashAdApplicationWillEnterBackground:(GDTSplashAd *)splashAd{
    
}
- (void)splashAdClicked:(GDTSplashAd *)splashAd{
    
}
- (void)splashAdClosed:(GDTSplashAd *)splashAd{
    
}


#pragma mark -
#pragma mark - MMUSDKDelegate methods

/**
 
 @return 是否响应来自SDK的分享请求，响应时：返回YES；不响应时：返回NO
 
 */

- (BOOL)shouldHandleShareRequestFromSDK
{
    return NO;
}

/**
 
 用于处理来自SDK的分享请求
 
 @param  titleToShare 本次分享的标题
 @param  contentToShare 本次分享的文本内容
 @param  urlToShare 本次分享对应的url
 @param  imageToShare 需要分享的图片信息
 @param  controller 需哟使用分享功能的页面
 
 */

- (void)handleShareRequestWithTitle:(NSString *)titleToShare
                            content:(NSString *)contentToShare
                                url:(NSURL *)urlToShare
                              image:(UIImage *)imageToShare
                 withViewController:(UIViewController *)controller
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    //在此处完成分享，并通过 [[MMUSDK sharedInstance] handleShareResult:shareType result:1]; 将对应的结果同步给SDK
}


@end
