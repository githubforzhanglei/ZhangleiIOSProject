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

static LocationData *locationData = nil;

@interface LocationData(){
    NSString *_fileName;
}

@end

@implementation LocationData

@synthesize appName;
@synthesize dataString;

+ (LocationData *)getInstance {
    if (locationData == nil) {
        locationData = [[LocationData alloc] initWithFileName:AppLocationDataFileName];
    }
    return locationData;
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
    NSString *dataPath = NSTemporaryDirectory();
    //        NSLog(@"%@", dataPath);
    dataPath = [NSString stringWithFormat:@"%@%@", dataPath, _fileName];
    
    NSDictionary *dictionary = [[NSDictionary alloc] initWithContentsOfFile:dataPath];
    
    appName = [dictionary objectForKey:AppNameKey];
    if (appName == nil || [appName isEqualToString:@""]) {
        appName = @"default_appName";
    }
    
    NSData* encryptData = [dictionary objectForKey:EncryptDataKey];
    if (encryptData != nil) {
        NSData *decryptData = [encryptData AES256DecryptWithKey:AESKey];
        dataString = [[NSString alloc] initWithData:decryptData encoding:NSASCIIStringEncoding];
    }
    
}

-(void) writeUserConfigPlist:(NSString *) plistFile{
    NSMutableDictionary *dictPlist = [[NSMutableDictionary alloc ] init];
    
    [dictPlist setObject:appName forKey:AppNameKey];
    
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
