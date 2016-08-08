//
//  LangCaptain.h
//  ZhangleiIOSProject
//
//  Created by Allone on 16/8/8.
//  Copyright © 2016年 zhanglei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LangCaptain : NSObject

+ (LangCaptain *)getInstance;

#pragma getLang
- (NSString *)getLangByCode:(NSString *)code;
- (NSString *)getErrMessageByCode:(NSString *)code;

@end
