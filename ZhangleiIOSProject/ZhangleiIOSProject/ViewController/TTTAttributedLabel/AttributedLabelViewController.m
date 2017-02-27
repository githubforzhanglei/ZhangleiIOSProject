//
//  AttributedLabelViewController.m
//  ZhangleiIOSProject
//
//  Created by ZhangLei on 2017/2/27.
//  Copyright © 2017年 zhanglei. All rights reserved.
//

#import "AttributedLabelViewController.h"
#import "TTTAttributedLabel.h"

@interface AttributedLabelViewController ()<TTTAttributedLabelDelegate> {
//    TTTAttributedLabel *_label;
}

@property TTTAttributedLabel *label;

@end

@implementation AttributedLabelViewController

@synthesize label;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self initAttributedLabel];
}

- (void)initAttributedLabel {
    
    label = [[TTTAttributedLabel alloc] initWithFrame:CGRectMake(100, 120, 120, 60)];
    
    label.font = [UIFont systemFontOfSize:14];
    label.textColor = [UIColor blackColor];
    label.lineBreakMode = NSLineBreakByCharWrapping;
    label.numberOfLines = 0;
    
    //设置高亮颜色
    label.highlightedTextColor = [UIColor greenColor];
    
    //检测url
    label.enabledTextCheckingTypes = NSTextCheckingTypeLink;
    
    //对齐方式
    label.verticalAlignment = TTTAttributedLabelVerticalAlignmentCenter;
    
    //行间距
    label.lineSpacing = 8;
    
    //设置阴影
    label.shadowColor = [UIColor grayColor];
    
    label.delegate = self; // Delegate
    
    //NO 不显示下划线
    label.linkAttributes = [NSDictionary dictionaryWithObject:[NSNumber numberWithBool:NO] forKey:(NSString *)kCTUnderlineStyleAttributeName];
    
    NSString *text = @"我是可以点击的文本";
    
    [label setText:text afterInheritingLabelAttributesAndConfiguringWithBlock:^ NSMutableAttributedString *(NSMutableAttributedString *mutableAttributedString)
     {
         //设置可点击文字的范围
         NSRange boldRange = [[mutableAttributedString string] rangeOfString:@"点击" options:NSCaseInsensitiveSearch];
         
         //设定可点击文字的的大小
         UIFont *boldSystemFont = [UIFont boldSystemFontOfSize:16];
         
         CTFontRef font = CTFontCreateWithName((__bridge CFStringRef)boldSystemFont.fontName, boldSystemFont.pointSize, NULL);
         
         if (font) {
             //设置可点击文本的大小
             
             [mutableAttributedString addAttribute:(NSString *)kCTFontAttributeName value:(__bridge id)font range:boldRange];
             
             //设置可点击文本的颜色
             [mutableAttributedString addAttribute:(NSString*)kCTForegroundColorAttributeName value:(id)[[UIColor blueColor] CGColor] range:boldRange];
             
             CFRelease(font);
         }
         
         return mutableAttributedString;
     }];
    
    
    
    //正则
    
//    NSRegularExpression *regexp = NameRegularExpression();
    
    
    
//    NSRange linkRange = [regexp rangeOfFirstMatchInString:text options:0 range:NSMakeRange(0, 3)];
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://www.exiucai.com/"]];
    
    
    
    //设置链接的url
    
    [label addLinkToURL:url withRange:NSMakeRange(0, 6)];
    
    [self.view addSubview:label];
}

#pragma mark - TTTAttributedLabelDelegate
- (void)attributedLabel:(TTTAttributedLabel *)label didSelectLinkWithURL:(NSURL *)url
{
    NSLog(@"linkClick");
    [[UIApplication sharedApplication] openURL:url];
}
- (void)attributedLabel:(TTTAttributedLabel *)label didSelectLinkWithAddress:(NSDictionary *)addressComponents
{
    NSLog(@"addressClick");
    NSLog(@"detailAdd:%@,lontitude:%f,latitude:%f",addressComponents[@"detailAdd"],
          [addressComponents[@"lontitude"] floatValue],
          [addressComponents[@"latitude"] floatValue]);
}
- (void)attributedLabel:(TTTAttributedLabel *)label
didSelectLinkWithPhoneNumber:(NSString *)phoneNumber
{
//    NSLog(@"phoneClick");
//    NSString *num = [NSString stringWithFormat:@"tel:%@",phoneNumber];
//    //    NSString *num = [NSString stringWithFormat:@"telprompt://%@",number];
//    //而这个方法则打电话前先弹框  是否打电话 然后打完电话之后回到程序中 网上说这个方法可能不合法 无法通过审核
//    
//    UIApplication *application = [UIApplication sharedApplication];
//    AppDelegate *delegate = (AppDelegate *)application.delegate;
//    UIWindow *window = delegate.window;
//    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil
//                                                                   message:[NSString stringWithFormat:@"是否拨打 %@",phoneNumber]
//                                                            preferredStyle:UIAlertControllerStyleAlert];
//    UIAlertAction *actionCancel = [UIAlertAction actionWithTitle:@"取消"
//                                                           style:UIAlertActionStyleCancel
//                                                         handler:^(UIAlertAction * _Nonnull action) {}];
//    
//    UIAlertAction *actionDone = [UIAlertAction actionWithTitle:@"确定"
//                                                         style:UIAlertActionStyleDefault
//                                                       handler:^(UIAlertAction * _Nonnull action) {
//                                                           [[UIApplication sharedApplication] openURL:[NSURL URLWithString:num]]; //拨号
//                                                       }];
//    [alert addAction:actionCancel];
//    [alert addAction:actionDone];
//    
//    [window.rootViewController presentViewController:alert animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
