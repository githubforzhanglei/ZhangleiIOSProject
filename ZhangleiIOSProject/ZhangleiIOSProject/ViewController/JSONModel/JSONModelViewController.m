//
//  JSONModelViewController.m
//  ZhangleiIOSProject
//
//  Created by ZhangLei on 2017/2/13.
//  Copyright © 2017年 zhanglei. All rights reserved.
//

#import "JSONModelViewController.h"
#import "JSONModel.h"
#import "SimpleJsonModel.h"

@interface JSONModelViewController ()

@end

@implementation JSONModelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    JSONModelError *err = nil;
    SimpleJsonModel *model = [[SimpleJsonModel alloc] initWithString:@"{\"jsonString\":\"myString'\"}" error:&err];
//    NSLog(@"%@", err);
    NSLog(@"%@", model);
    
    
    
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
