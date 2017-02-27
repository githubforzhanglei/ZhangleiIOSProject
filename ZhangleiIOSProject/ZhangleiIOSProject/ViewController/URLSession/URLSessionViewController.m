//
//  URLSessionViewController.m
//  ZhangleiIOSProject
//
//  Created by ZhangLei on 2017/2/21.
//  Copyright © 2017年 zhanglei. All rights reserved.
//

#import "URLSessionViewController.h"

@interface URLSessionViewController (){
    NSURLSession *mSession;
}

@end

@implementation URLSessionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self upload];
}

- (void)upload {
    mSession = [NSURLSession sharedSession];
//    NSString *urlString = @"http://img4.duitang.com/uploads/blog/201310/18/20131018213446_smUw4.thumb.600_0.jpeg";
    NSURL *url = [NSURL URLWithString:@"http://www.daka.com/login?username=daka&pwd=123"];
    
    NSURLSessionTask *task = [mSession dataTaskWithURL:url
                                     completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                          NSLog(@"%@", [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil]);
                                     }];
    
    // 启动任务
    [task resume];
    
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
