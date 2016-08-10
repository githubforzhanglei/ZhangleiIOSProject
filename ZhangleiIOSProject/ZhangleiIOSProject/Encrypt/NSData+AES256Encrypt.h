//
//  NSData+AES256Encrypt.h
//  ZhangleiIOSProject
//
//  Created by Allone on 16/8/9.
//  Copyright © 2016年 zhanglei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (AES256Encrypt)

- (NSData *)AES256EncryptWithKey:(NSString *)key;   //加密
- (NSData *)AES256DecryptWithKey:(NSString *)key;   //解密

@end
