//
//  ViewController.m
//  Fingerprint-master
//
//  Created by 黄海燕 on 16/9/13.
//  Copyright © 2016年 huanghy. All rights reserved.
//

#import "ViewController.h"
#import "LocalAuthentication/LAContext.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //判断手机系统版本
    if ([[UIDevice currentDevice].systemVersion floatValue] < 8.0) {
        NSLog(@"不支持指纹识别");
        return;
    }
    //创建一个LAContext实例，用于执行认证策略
    LAContext *myContext = [[LAContext alloc]init];
    NSError *authError = nil;
    NSString *myLocalizedReasonString = @"请输入指纹";
    if ([myContext canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&authError]) {
        // 输入指纹，异步
        // 提示：指纹识别只是判断当前用户是否是手机的主人！程序原本的逻辑不会受到任何的干扰！
        [myContext evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:myLocalizedReasonString reply:^(BOOL success, NSError * _Nullable error) {
            if (success) {
                
            }else{
                // 错误 error.code = ?
            }
        }];
    }else{
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
