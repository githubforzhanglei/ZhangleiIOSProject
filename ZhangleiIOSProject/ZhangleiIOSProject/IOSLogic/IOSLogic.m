//
//  IOSLogic.m
//  ZhangleiIOSProject
//
//  Created by ZhangLei on 2017/2/9.
//  Copyright © 2017年 zhanglei. All rights reserved.
//

#import "IOSLogic.h"
#import "ViewController.h"
#import "MasonryViewController.h"
#import "JSPatchViewController.h"
#import "JSONModelViewController.h"
#import "RuntimeViewController.h"
#import "SDWebImageViewController.h"
#import "InternalFuncViewController.h"
#import "URLSessionViewController.h"
#import "AttributedLabelViewController.h"

static IOSLogic *iOSLogicInstance = nil;

@implementation IOSLogic

@synthesize mWindow;

+ (IOSLogic *)getInstance{
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        iOSLogicInstance = [[self alloc] init];
    });
    return iOSLogicInstance;
}

- (id)init {
    if (self = [super init]) {
        self.mWindow = nil;
    }
    return self;
}

#pragma mark UIManager
- (Boolean)         gotoLoginViewController {
    if(self.mWindow == nil)
        return NO;
    
//    if (![mWindow.rootViewController isKindOfClass:[LoginViewController class]]) {
//        LoginViewController * viewController = [[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil];
//        mWindow.rootViewController = viewController;
//    }
//    return YES;

    if (![mWindow.rootViewController isKindOfClass:[ViewController class]]) {
        ViewController * viewController = [[ViewController alloc] init];
        mWindow.rootViewController = viewController;
    }
    
    return YES;
}

- (Boolean) gotoMasonryViewController {
    if(self.mWindow == nil)
        return NO;
    
    if (![mWindow.rootViewController isKindOfClass:[MasonryViewController class]]) {
        MasonryViewController * viewController = [[MasonryViewController alloc] init];
        mWindow.rootViewController = viewController;
    }
    
    return YES;
}

- (Boolean) gotoJSPatchViewController {
    if(self.mWindow == nil)
        return NO;
    
    if (![mWindow.rootViewController isKindOfClass:[JSPatchViewController class]]) {
        JSPatchViewController * viewController = [[JSPatchViewController alloc] init];
        mWindow.rootViewController = viewController;
    }
    
    return YES;
}

- (Boolean) gotoJSONModelViewController {
    if(self.mWindow == nil)
        return NO;
    
    if (![mWindow.rootViewController isKindOfClass:[JSONModelViewController class]]) {
        JSONModelViewController * viewController = [[JSONModelViewController alloc] init];
        mWindow.rootViewController = viewController;
    }
    return YES;
}

- (Boolean) gotoRuntimeViewController {
    if (self.mWindow == nil) {
        return NO;
    }
    
    if (![mWindow.rootViewController isKindOfClass:[RuntimeViewController class]]) {
        RuntimeViewController * viewController = [[RuntimeViewController alloc] init];
        mWindow.rootViewController = viewController;
    }
    return YES;
}

- (Boolean) gotoSDWebImageViewController {
    if (self.mWindow == nil) {
        return NO;
    }
    
    if (![mWindow.rootViewController isKindOfClass:[SDWebImageViewController class]]) {
        SDWebImageViewController * viewController = [[SDWebImageViewController alloc] init];
        mWindow.rootViewController = viewController;
    }
    return YES;
}

- (Boolean) gotoInternalFuncViewController {
    if (self.mWindow == nil) {
        return NO;
    }
    
    if (![mWindow.rootViewController isKindOfClass:[InternalFuncViewController class]]) {
        InternalFuncViewController * viewController = [[InternalFuncViewController alloc] init];
        mWindow.rootViewController = viewController;
    }
    return YES;
}

- (Boolean) gotoURLSessionViewController {
    if (self.mWindow == nil) {
        return NO;
    }
    
    if (![mWindow.rootViewController isKindOfClass:[URLSessionViewController class]]) {
        URLSessionViewController * viewController = [[URLSessionViewController alloc] init];
        mWindow.rootViewController = viewController;
    }
    return YES;
}

- (Boolean) gotoAttributedLabelViewController {
    if (self.mWindow == nil) {
        return NO;
    }
    
    if (![mWindow.rootViewController isKindOfClass:[AttributedLabelViewController class]]) {
        AttributedLabelViewController * viewController = [[AttributedLabelViewController alloc] init];
        mWindow.rootViewController = viewController;
    }
    return YES;
}

@end
