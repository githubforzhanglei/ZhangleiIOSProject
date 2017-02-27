//
//  RuntimeViewController.m
//  ZhangleiIOSProject
//
//  Created by ZhangLei on 2017/2/16.
//  Copyright © 2017年 zhanglei. All rights reserved.
//

#import "RuntimeViewController.h"

#import "SimpleRuntimeObject.h"
#import <objc/runtime.h>

@interface RuntimeViewController ()

@end

@implementation RuntimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self selectFunc];
    [self setGetTest];
    [self stringChange];
    [self intChange];
}

- (void)selectFunc {
    SimpleRuntimeObject *object = [[SimpleRuntimeObject alloc] init];
    if (object != nil && [object respondsToSelector:@selector(simpleFunc)]) {
        //        [object simpleFunc];
        [object performSelector:@selector(simpleFunc)];
    }
}

- (void)setGetTest {
    SimpleRuntimeObject *object = [[SimpleRuntimeObject alloc] init];
    
    [object setName:@"123"];
    NSString *aaa = [object name];
    
    char *charString = "1";
    NSLog(@"...%x", &charString);
    NSLog(@"...%s", charString);
    
    charString = "2";
    NSLog(@"...%x", &charString);
    NSLog(@"...%s", charString);
    
    NSString *key = @"1";
    
    NSString *string = @"thisisString";
    
    objc_setAssociatedObject(object, &key, string, OBJC_ASSOCIATION_ASSIGN);
    NSLog(@"%x", &key);
    NSLog(@"%p", key);
    
    key = @"123";
    NSString  *messageString = objc_getAssociatedObject(object, &key);

    NSLog(@"%@", messageString);
    
    NSLog(@"%x", &key);
    NSLog(@"%p", key);
//    char * kMapperObjectKey =
    [self printtt:key];
}

- (void)printtt:(NSString *)key{
    NSLog(@"%x", &key);
    NSLog(@"%p", key);
}

- (void)intChange {
    int a = 1;
    changeInt(&a);
    NSLog(@"%d", a);
}

- (void)stringChange {
    NSString *str = @"456";
    
    changeStr(&str);
    
    NSLog(@"%@", str);
}

void changeInt(int *int2) {
    *int2 = 2;
}

void changeStr(NSString **str2) {
    *str2 = @"123";
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
