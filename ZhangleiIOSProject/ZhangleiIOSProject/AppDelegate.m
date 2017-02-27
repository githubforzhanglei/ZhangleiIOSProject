//
//  AppDelegate.m
//  ZhangleiIOSProject
//
//  Created by Allone on 16/8/8.
//  Copyright © 2016年 zhanglei. All rights reserved.
//

#import "AppDelegate.h"
#import "IOSLogic.h"
#import "JPEngine.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    //    [JPEngine startEngine];
    //    NSString *sourcePath = [[NSBundle mainBundle] pathForResource:@"config/Main" ofType:@"js"];
    //    NSString *script = [NSString stringWithContentsOfFile:sourcePath encoding:NSUTF8StringEncoding error:nil];
    //    [JPEngine evaluateScript:script];
    //    sendSynchronousRequest sendAsynchronousRequest
    //    NSURLResponse *response;
    
    [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://192.168.40.29/TestWebService/test.js"]]
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                               NSString *script = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                               [JPEngine evaluateScript:script];
                               
                               NSLog(@"receive data is %@", script);
                               
//                               [[IOSLogic getInstance] gotoJSPatchViewController];
                           }];
    
    //    sleep(3);
    //
    [[IOSLogic getInstance] setMWindow:self.window];
    if(![[IOSLogic getInstance] gotoAttributedLabelViewController]){
        return NO;
    }
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
