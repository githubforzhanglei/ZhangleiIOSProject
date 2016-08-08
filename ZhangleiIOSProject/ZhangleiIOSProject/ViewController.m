//
//  ViewController.m
//  ZhangleiIOSProject
//
//  Created by Allone on 16/8/8.
//  Copyright © 2016年 zhanglei. All rights reserved.
//

#import "ViewController.h"
#import "LangCaptain.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self getConfigTest];
}

- (void)getConfigTest {
    NSString *lang = [[LangCaptain getInstance] getLangByCode:@"LangA"];
    NSString *err = [[LangCaptain getInstance] getErrMessageByCode:@"ERR_Name"];
    NSLog(@"lang is %@", lang);
    NSLog(@"err is %@", err);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
