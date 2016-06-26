//
//  AppDelegate.m
//  LocalNotification
//
//  Created by zhangbin on 16/6/26.
//  Copyright © 2016年 zhangbin. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 注意: 在iOS8中, 必须提前注册通知类型
    if ([UIDevice currentDevice].systemVersion.doubleValue >= 8.0) {
        UIUserNotificationType type = UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound;
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:type categories:nil];
        // 注册通知类型
        [application registerUserNotificationSettings:settings];
    }
    
    static int count = 0;
    count++;
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(self.window.frame.size.width/2-100,64 , 200, 200);
    label.numberOfLines = 0;
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:21];
    label.backgroundColor = [UIColor orangeColor];
    label.text = [NSString stringWithFormat:@" %@", launchOptions[UIApplicationLaunchOptionsLocalNotificationKey]];
    [self.window.rootViewController.view addSubview:label];
    return YES;
    
}
// 代理方法:接收到本地通知时就会调用.程序必须在前台/后台,如果程序完全退出则不调用
// 当程序在前台时, 会自动调用该方法
// 当程序在后台时, 只有用户点击了提示的通知才会调用
- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    NSLog(@"%s", __func__);
    
    // 点击"注册通知"按钮,5秒后将会显示灰色的UILabel,与此同时,通知的内容也会一同显示在灰色的UILabel上
    static int count = 0;
    count++;
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(self.window.frame.size.width/2-100, 300, 200, 200);
    label.numberOfLines = 0;
    label.textColor = [UIColor whiteColor];
    label.text = [NSString stringWithFormat:@" %@", notification.userInfo];
    label.font = [UIFont systemFontOfSize:21];
    label.backgroundColor = [UIColor grayColor];
    [self.window.rootViewController.view addSubview:label];
}

@end
