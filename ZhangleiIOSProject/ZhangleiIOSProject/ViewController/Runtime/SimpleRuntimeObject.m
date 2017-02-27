//
//  SimpleRuntimeObject.m
//  ZhangleiIOSProject
//
//  Created by ZhangLei on 2017/2/16.
//  Copyright © 2017年 zhanglei. All rights reserved.
//

#import "SimpleRuntimeObject.h"

@implementation SimpleRuntimeObject

@dynamic name;

- (void)setName:(NSString *)name {}

- (NSString *)name {
    return @"name";
}

- (void)simpleFunc {
    NSLog(@"this is simpleFunc");
}

@end
