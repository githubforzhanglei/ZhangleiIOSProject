//
//  UpdateBaseView.m
//  ZhangleiIOSProject
//
//  Created by ZhangLei on 2017/2/9.
//  Copyright © 2017年 zhanglei. All rights reserved.
//

#import "UpdateBaseView.h"
#import "Masonry.h"

@interface UpdateBaseView() {
    UIView *viewA;
    UIView *viewB;
    UIView *viewC;
    
    CGFloat viewAWidth;
}

@end

@implementation UpdateBaseView

- (id)init {
    if (self = [super init]) {
        [self initContentViews];
    }
    return self;
}

- (void)initContentViews {
    viewAWidth = 100;
    viewA = [[UIView alloc] init];
    viewB = [[UIView alloc] init];
    viewC = [[UIView alloc] init];
    
    [viewA setBackgroundColor:[UIColor redColor]];
    [viewB setBackgroundColor:[UIColor grayColor]];
    [viewC setBackgroundColor:[UIColor greenColor]];
    
    [self addSubview:viewA];
    [self addSubview:viewB];
    [self addSubview:viewC];
    
    [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self
                                                                            action:@selector(didNeedChange)]];
    [self setUserInteractionEnabled:true];

}

- (void)updateConstraints {
    [super updateConstraints];
    UIView *superView = self;
    CGSize superSize = super.frame.size;
    CGFloat superViewHeight = superSize.height;
    //    CGFloat superViewWidth = superSize.width;
    [viewA mas_updateConstraints:^(MASConstraintMaker *make) {
        //        make.top.equalTo(@10); // 相对于父View 10
        //        make.top.equalTo(superView.mas_top).offset(10); // subview.top = superView.top + 10;
        //        make.top.equalTo(superView.mas_top).multipliedBy(1).offset(10); // subview.top = superView.top + 10;
        //        make.height.mas_equalTo(superViewHeight);
        make.top.equalTo(superView.mas_top).multipliedBy(1).offset(10); // subview.top = superView.top + 10;
        make.left.equalTo(superView.mas_left).multipliedBy(1).offset(10);
        make.height.mas_equalTo(superViewHeight);
        make.width.mas_equalTo(viewAWidth);
    }];
    
    [viewB mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(superView.mas_top).multipliedBy(1).offset(10); // subview.top = superView.top + 10;
        make.right.equalTo(superView.mas_right).multipliedBy(1).offset(10);
        
        make.left.equalTo(viewA.mas_right).multipliedBy(1).offset(10);
        make.height.mas_equalTo(superViewHeight / 2);
    }];
    
    [viewC mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(superView.mas_bottom).multipliedBy(1).offset(10); // subview.top = superView.top + 10;
        make.right.equalTo(superView.mas_right).multipliedBy(1).offset(10);
        
        make.left.equalTo(viewA.mas_right).multipliedBy(1).offset(10);
        make.top.equalTo(viewB.mas_bottom).multipliedBy(1).offset(10);
    }];
}

- (void)didNeedChange {
    static int i = 0;
    if (i == 0) {
        i = 1;
        viewAWidth = 100;
    } else {
        i = 0;
        viewAWidth = 200;
    }
    
    // 告诉约束需要更新
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
    
    [UIView animateWithDuration:0.4 animations:^{
        [self layoutIfNeeded];
    } completion:^(BOOL finished) {
        [self didNeedChange];
    }];
}

#pragma constraints
// 这个是必须的
+ (BOOL)requiresConstraintBasedLayout {
    return YES;
}

@end
