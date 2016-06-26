//
//  ViewController.m
//  LocalNotification
//
//  Created by zhangbin on 16/6/26.
//  Copyright © 2016年 zhangbin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

/*
 @property(nonatomic,copy) NSDate *fireDate; 指定通知发送的时间
 @property(nonatomic,copy) NSTimeZone *timeZone; 指定发送通知的时区
 
 @property(nonatomic) NSCalendarUnit repeatInterval;  重复的周期, 枚举
 @property(nonatomic,copy) NSCalendar *repeatCalendar; 重复的周期  , 2014.12.12
 @property(nonatomic,copy) NSString *alertBody;      通知内容
 @property(nonatomic) BOOL hasAction;                是否需要华东事件
 @property(nonatomic,copy) NSString *alertAction;    锁屏状态的标题
 @property(nonatomic,copy) NSString *alertLaunchImage;   点击通知之后的启动图片
 @property(nonatomic,copy) NSString *soundName;    收到通知播放的音乐
 @property(nonatomic) NSInteger applicationIconBadgeNumber;  图标提醒数字
 @property(nonatomic,copy) NSDictionary *userInfo;   额外的信息
 */

#warning 验证程序的四大功能 功能1:点击"注册通知"按钮,等5秒看屏幕文字的变化. 功能3：点击"注册通知"按钮，立刻将程序进入后台,然后点击收到的通知进入程序,看屏幕文字的变化 .功能3:点击"注册通知"按钮，立刻将程序关闭，然后点击收到的通知进入程序，看屏幕文字的变化。功能4:点击"注册通知"按钮,然后立刻按住Command+L锁屏，然后再次按住Command+L看到滑动解锁的字样，此时你看锁屏界面的变化。

- (IBAction)AddNotification:(UIButton *)sender{
    NSLog(@"%s", __func__);
    // 1.创建本地通知对象
    UILocalNotification *note = [[UILocalNotification alloc] init];
    
    // 指定通知发送的时间(指定5秒之后发送通知,didReceiveLocalNotification代理方法5秒后才调用)
    note.fireDate = [NSDate dateWithTimeIntervalSinceNow:5];
    // 注意: 在真实开发中一般情况下还需要指定时区(让通知的时间跟随当前时区)
    note.timeZone = [NSTimeZone defaultTimeZone];
    // 指定通知内容
    note.alertBody = @"Hello,我是通知的内容";
    
    // 设置通知重复的周期(1分钟通知一期)
    //    note.repeatInterval = NSCalendarUnitSecond;
    
    // 指定锁屏界面的信息(Command+L)
    note.alertAction = @"Hello,我是锁屏界面的信息";
    
    // 设置点击通知进入程序时候的启动图片
    note.alertLaunchImage = @"Default";
    
    // 收到通知播放的音乐
    note.soundName = @"m_07.wav";
    
    // 设置应用程序的提醒图标
    note.applicationIconBadgeNumber = 345;
    
    // 注册通知时可以指定将来点击通知之后需要传递的数据
    note.userInfo = @{@"name":@"zb",
                      @"age":@"25",
                      @"phone": @"13324233321"};
    
    // 2.注册通知(图片的名称建议使用应用程序启动的图片名称)
    UIApplication *app =  [UIApplication sharedApplication];
    // 每次调用添加方法都会将通知添加到scheduledLocalNotifications数组中
    [app scheduleLocalNotification:note];
    
}
- (IBAction)CancelNotification:(UIButton *)sender {
    UIApplication *app =  [UIApplication sharedApplication];
    // 清空通知
    [app cancelAllLocalNotifications];
    
}

@end
