//
//  IOSLogic.h
//  ZhangleiIOSProject
//
//  Created by ZhangLei on 2017/2/9.
//  Copyright © 2017年 zhanglei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IOSLogic : NSObject

#pragma init
+ (IOSLogic *)  getInstance;
- (id)          init;

#pragma mark Parameters
@property UIWindow *mWindow;

#pragma mark UIManager
- (Boolean)         gotoLoginViewController;

- (Boolean)         gotoMasonryViewController;
- (Boolean)         gotoJSPatchViewController;

@end
