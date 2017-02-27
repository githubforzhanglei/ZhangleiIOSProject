//
//  SDWebImageViewController.m
//  ZhangleiIOSProject
//
//  Created by ZhangLei on 2017/2/21.
//  Copyright © 2017年 zhanglei. All rights reserved.
//

#import "SDWebImageViewController.h"
#import "SDWebImageManager.h"
#import "UIImageView+WebCache.h"

@interface SDWebImageViewController () {
    UIImageView *imageView;
}

@end

@implementation SDWebImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor grayColor]];
    [self initImageView];
    [self addTapGesture];
}

- (void)initImageView {
    imageView = [[UIImageView alloc] init];
    [imageView setFrame:CGRectMake(0, 0, 200, 200)];
    [imageView setUserInteractionEnabled:YES];
    //    [imageView setImage:[UIImage imageNamed:@"config/image/help"]];
    [self.view addSubview:imageView];
}

- (void)addTapGesture {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
    [imageView addGestureRecognizer:tap];
}

- (void)tap {
    printf(__func__);
    NSLog(@"taped...");
    [self download];
}

- (void)download {
    NSString *url = @"http://img4.duitang.com/uploads/blog/201310/18/20131018213446_smUw4.thumb.600_0.jpeg";
    
    [imageView sd_setImageWithURL:[NSURL URLWithString:url]
                 placeholderImage:[UIImage imageNamed:@"config/image/help"]
                          options:SDWebImageCacheMemoryOnly | SDWebImageProgressiveDownload
                         progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
                             //                             NSLog(@"progress");
                             NSLog(@"%f",1.0 * receivedSize / expectedSize);
                         }
                        completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                            
                            switch (cacheType) {
                                case SDImageCacheTypeNone:
                                    NSLog(@"直接下载");
                                    break;
                                case SDImageCacheTypeDisk:
                                    NSLog(@"磁盘缓存");
                                    break;
                                case SDImageCacheTypeMemory:
                                    NSLog(@"内存缓存");
                                    break;
                                default:
                                    break;
                            }
                        }];
    
    NSLog(@"%@",[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject]);
    
    void (^block)() = ^(){
        //        [self sd_setImage:placeholder imageData:nil basedOnClassOrViaCustomSetImageBlock:setImageBlock];
    };
    
//    dispatch_main_async_safe(block)
//    if (strcmp(dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL), dispatch_queue_get_label(dispatch_get_main_queue())) == 0) {
//        block();
//    } else {
//        dispatch_async(dispatch_get_main_queue(), block);
//    }
}

-(void)download2 {
    NSString *url = @"http://img4.duitang.com/uploads/blog/201310/18/20131018213446_smUw4.thumb.600_0.jpeg";
    //    [[SDWebImageManager sharedManager] download];
    //    [[[SDWebImageManager sharedManager] downloadimage];
    //
    //
    //     downloadImageWithURL:[NSURL URLWithString:url]
    //                                                    options:0
    //                                                   progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
    //        NSLog(@"%f",1.0 * receivedSize / expectedSize);
    //        
    //    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
    //        
    //        //得到图片
    //        imageView.image = image;
    //    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
