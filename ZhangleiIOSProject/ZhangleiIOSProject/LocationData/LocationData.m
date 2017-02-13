//
//  LocationData.m
//  ZhangleiIOSProject
//
//  Created by Allone on 16/8/9.
//  Copyright © 2016年 zhanglei. All rights reserved.
//

#import "LocationData.h"
#import "NSData+AES256Encrypt.h"

NSString *const AppLocationDataFileName = @"AppLocationDataFileName";

NSString *const AppNameKey = @"AppNameKey";
NSString *const EncryptDataKey = @"EncryptDataKey";

NSString *const AESKey = @"AESKey";

static LocationData *locationDataInstance = nil;

@interface LocationData(){
    NSString *_fileName;
}

@end

@implementation LocationData

@synthesize appName;
@synthesize dataString;

+ (LocationData *)getInstance {
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        locationDataInstance = [[self alloc] init];
    });
    return locationDataInstance;
}

- (id)init {
    if (self = [super init]) {
        appName = nil;
    }
    return self;
}

- (id)initWithFileName:(NSString *)fileName{
    if (self = [super init]) {
        _fileName = fileName;
        [self loadUserConfigSaveData];
    }
    return self;
}

- (void)saveConfigData {
    [self writeUserConfigPlist:_fileName];
}

-(void) loadUserConfigSaveData {
//    NSString *dataPath = NSTemporaryDirectory();
//    dataPath = [NSString stringWithFormat:@"%@%@", dataPath, _fileName];
    NSString *dataPath = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    dataPath = [NSString stringWithFormat:@"%@/%@", dataPath, _fileName];
    
    NSDictionary *dictionary = [[NSDictionary alloc] initWithContentsOfFile:dataPath];
    
    appName = [dictionary objectForKey:AppNameKey];
    if (appName == nil || [appName isEqualToString:@""]) {
        appName = @"default_appName";
    }
    
    //载入 解密后的数据
    NSData* encryptData = [dictionary objectForKey:EncryptDataKey];
    if (encryptData != nil) {
        NSData *decryptData = [encryptData AES256DecryptWithKey:AESKey];
        dataString = [[NSString alloc] initWithData:decryptData encoding:NSASCIIStringEncoding];
    }
}

-(void) writeUserConfigPlist:(NSString *) plistFile{
//    NSString *dataPath = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) objectAtIndex:0];
//    dataPath = [NSString stringWithFormat:@"%@/%@", dataPath, _fileName];
//    NSDictionary *dictPlist = [[NSDictionary alloc] initWithContentsOfFile:dataPath];
    NSMutableDictionary *dictPlist = [[NSMutableDictionary alloc ] init];
    
    [dictPlist setObject:appName forKey:AppNameKey];
    
    // 写入 加密后的数据
    if (dataString != nil) {
        NSData* oriData = [dataString dataUsingEncoding:NSUTF8StringEncoding];
        NSData* encryptData = [oriData AES256EncryptWithKey:AESKey];
        [dictPlist setObject:encryptData forKey:EncryptDataKey];
    }
    
    NSString *plistPath = NSTemporaryDirectory();
    plistPath = [NSString stringWithFormat:@"%@%@", plistPath, plistFile];
    
    if(![dictPlist writeToFile:plistPath atomically:YES]){
        NSLog(@"write user config file failed.");
    }
}


@end
