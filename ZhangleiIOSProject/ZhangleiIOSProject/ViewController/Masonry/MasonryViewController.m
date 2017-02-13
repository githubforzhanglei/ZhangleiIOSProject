//
//  MasonryViewController.m
//  ZhangleiIOSProject
//
//  Created by ZhangLei on 2017/2/9.
//  Copyright © 2017年 zhanglei. All rights reserved.
//

#import "MasonryViewController.h"
#import "UpdateBaseView.h"

@implementation MasonryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
}

- (void)initView {
    UpdateBaseView *baseView = [[UpdateBaseView alloc] init];
    [baseView setFrame:self.view.frame];
    [self.view addSubview:baseView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
