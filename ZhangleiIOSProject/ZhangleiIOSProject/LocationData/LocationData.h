//
//  LocationData.h
//  ZhangleiIOSProject
//
//  Created by Allone on 16/8/9.
//  Copyright © 2016年 zhanglei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LocationData : NSObject

+ (LocationData *) getInstance;

- (void)saveConfigData;

@property NSString *appName;
@property NSString *dataString;

@end
