//
//  ViewController.m
//  ZhangleiIOSProject
//
//  Created by Allone on 16/8/8.
//  Copyright © 2016年 zhanglei. All rights reserved.
//

#import "ViewController.h"
#import "LangCaptain.h"
#import "LocationData.h"
#import "DebugUtil.h"
#import <IFTTTJazzHands.h>
#import "SMPageControl.h"
#import "Masonry.h"

@interface ViewController()<UIScrollViewDelegate> {
    UIView *redView;
    UIView *blueView;
    UIView *yellow;
    UIView *green;
    
    Boolean isMasonaryTest;
}
@property UIScrollView *scrollView;
@property UIView *jazzblueView;
@property IFTTTAnimator *jazzAnimator;


@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //    [self getConfigTest];
    //    [self debugTest];
    //
    //    [self jazzHandTest];
    //    [self smPageControlTest];
    
//    [self masonaryTest];
    [self uilabelTest];
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    //先把蓝色方块从父视图上移除
    
    if (isMasonaryTest) {
        
        [redView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view.mas_left).offset(0);//使左边等于self.view的左边，间距为0
            make.top.equalTo(self.view.mas_top).offset(0);//使顶部与self.view的间距为0
            make.width.equalTo(self.view.mas_width).multipliedBy(0.2);//设置宽度为self.view的一半，multipliedBy是倍数的意思，也就是，使宽度等于self.view宽度的0.5倍
            make.height.equalTo(self.view.mas_height).multipliedBy(0.2);//设置高度为self.view高度的一半
            
        }];
        
        //动画更新界面
        [UIView animateWithDuration:1.0f animations:^{
            [self.view layoutIfNeeded];
        }];
    }
}

// config test
- (void)getConfigTest {
    NSString *lang = [[LangCaptain getInstance] getLangByCode:@"LangA"];
    NSString *err = [[LangCaptain getInstance] getErrMessageByCode:@"ERR_Name"];
    NSLog(@"lang is %@", lang);
    NSLog(@"err is %@", err);
    NSLog(@"%@", [[LocationData getInstance] dataString]);
    NSString *appName = [[LocationData getInstance] appName];
    [[LocationData getInstance] setAppName:@"apppppp"];
    [[LocationData getInstance] setDataString:@"aacc"];
    
    [[LocationData getInstance] saveConfigData];
    NSLog(@"%@", appName);
    NSLog(@"%@", [[LocationData getInstance] dataString]);
}

// debug test
- (void)debugTest {
    DebugLog(@"test");
}

// jazzHand test
- (void)jazzHandTest {
    self.jazzAnimator = [[IFTTTAnimator alloc] init];
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    self.scrollView.pagingEnabled=YES;
    self.scrollView.backgroundColor=[UIColor grayColor];
    self.scrollView.contentSize = CGSizeMake(self.view.bounds.size.width * 2,0);
    self.scrollView.delegate = self;
    [self.view addSubview:self.scrollView];
    
    //创建蓝色方块 View
    self.jazzblueView = [[UIView alloc]initWithFrame:CGRectMake(100,200, 20, 20)];
    self.jazzblueView.backgroundColor = [UIColor blueColor];
    [self.scrollView addSubview:self.jazzblueView];
    
    [self setupAnimation];
}

-(void)setupAnimation{
    //创建一个透明度动画
    IFTTTAlphaAnimation *alpha=[IFTTTAlphaAnimation animationWithView:self.jazzblueView];
    //将所有动画添加到 animator 中
    [self.jazzAnimator addAnimation:alpha];
    
    //添加2个帧,在 scrollView 从 0 滚动到 200 时, 淡出我们的 View
    [alpha addKeyframeForTime:0 alpha:1.0];
    [alpha addKeyframeForTime:200 alpha:0.0];
    
    //创建平移动画
    IFTTTTranslationAnimation *tran=[IFTTTTranslationAnimation animationWithView:self.jazzblueView];
    [self.jazzAnimator addAnimation:tran];
    
    //添加2个帧,在 scrollView 从 0 滚动到 200 时, view 沿X轴平移150,沿Y便宜60.
    [tran addKeyframeForTime:0 translation:CGPointMake(0, 0)];
    [tran addKeyframeForTime:200 translation:CGPointMake(150, 60)];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self.jazzAnimator animate:scrollView.contentOffset.x];
}

// sm pagecontrol test
- (void)smPageControlTest {
    SMPageControl *pageControl = [[SMPageControl alloc] init];
    pageControl.numberOfPages = 10;
    pageControl.pageIndicatorImage = [UIImage imageNamed:@"imageC"];
    pageControl.currentPageIndicatorImage = [UIImage imageNamed:@"imageB"];
    [pageControl sizeToFit];
    [self.scrollView addSubview:pageControl];
}

// masonary
- (void)masonaryTest {
    isMasonaryTest = true;
    redView = [[UIView alloc]init];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    
    blueView = [[UIView alloc]init];
    blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:blueView];
    
    yellow = [[UIView alloc]init];
    yellow.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:yellow];
    
    green = [[UIView alloc]init];
    green.backgroundColor = [UIColor greenColor];
    [self.view addSubview:green];
    
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(0);//使左边等于self.view的左边，间距为0
        make.top.equalTo(self.view.mas_top).offset(0);//使顶部与self.view的间距为0
        make.width.equalTo(self.view.mas_width).multipliedBy(0.5);//设置宽度为self.view的一半，multipliedBy是倍数的意思，也就是，使宽度等于self.view宽度的0.5倍
        make.height.equalTo(self.view.mas_height).multipliedBy(0.5);//设置高度为self.view高度的一半
        
    }];
    
    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.and.height.equalTo(redView);//使宽高等于redView
        make.top.equalTo(redView.mas_top);//与redView顶部对齐
        make.left.equalTo(redView.mas_right);//与redView的间距为0
    }];
    
    [yellow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(redView);//与redView左对齐
        make.top.equalTo(redView.mas_bottom);//与redView底部间距为0
        make.width.and.height.equalTo(redView);//与redView宽高相等
    }];
    
    [green mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(yellow.mas_right);//与yellow右边间距为0
        make.top.equalTo(blueView.mas_bottom);//与blueView底部间距为0
        make.width.and.height.equalTo(redView);//与redView等宽高
    }];
    
}

- (void)uilabelTest {
    self.title = @"For iOS 6 & later";
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"36.25678"];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:NSMakeRange(0,2)];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(3,5)];
//    [str addAttribute:NSForegroundColorAttributeName value:[UIColor greenColor] range:NSMakeRange(19,6)];
    [str addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Arial-BoldItalicMT" size:20.0] range:NSMakeRange(0, 2)];
    [str addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue-Bold" size:30.0] range:NSMakeRange(3, 5)];
//    [str addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Courier-BoldOblique" size:30.0] range:NSMakeRange(19, 6)];
    UILabel *attrLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, 350, 30)];
    [self.view addSubview:attrLabel];
    attrLabel.attributedText = str;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
