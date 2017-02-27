//
//  InternalFuncViewController.m
//  ZhangleiIOSProject
//
//  Created by ZhangLei on 2017/2/21.
//  Copyright © 2017年 zhanglei. All rights reserved.
//

#import "InternalFuncViewController.h"
#import <objc/runtime.h>

@interface InternalFuncViewController ()

@end

@implementation InternalFuncViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self printInternal];
}

- (void)printInternal {
    NSLog(@"%s", __func__);
    NSLog(@"%d", __LINE__);
//    __weak __typeof(self)wself = self;
//    Class a = __typeof(self);
    NSLog(@"%s", __FILE__);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
