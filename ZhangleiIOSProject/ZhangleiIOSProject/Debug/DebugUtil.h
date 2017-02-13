//
//  DebugUtil.h
//  ZhangleiIOSProject
//
//  Created by Allone on 16/8/9.
//  Copyright © 2016年 zhanglei. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 [DebugUtil] Debug工具
 **/

#define DebugLog(s, ...) NSLog(@"%s(%d): %@", __FUNCTION__, __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__])

@interface DebugUtil : NSObject

@end
