//
//  wabViewController.m
//  VCoach
//
//  Created by apple on 15/5/7.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "wabViewController.h"
#import "VTeacher.pch"
@interface wabViewController ()


@end

@implementation wabViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _webview.backgroundColor = [UIColor clearColor];
    for ( UIView *sub in [_webview subviews]) {
        if ([sub isKindOfClass:[UIScrollView class]]) {
            ((UIScrollView*)sub).bounces = NO;
            for (UIView *scrollerView in sub.subviews) {
                if ([scrollerView isKindOfClass:[UIImageView class]]) {
                    scrollerView.hidden = YES;
                }
            }
        }
    }
    [self loadWebPageWithString:_url];
    
    [self.BackBtn addTarget:self action:@selector(popView) forControlEvents:UIControlEventTouchDown];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadWebPageWithString:(NSString*)urlString
{
    NSURL *url =[NSURL URLWithString:urlString];
    NSURLRequest *request =[NSURLRequest requestWithURL:url];
    [self.webview loadRequest:request];
}

-(void)popView{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)viewWillAppear:(BOOL)animated{
    
    self.tabBarController.tabBar.hidden = YES;
    _backTitle.text = _topTitle;
    _backTitle.textColor = [UIColor whiteColor];
    _backImage.frame = CGRectMake(0, 0, SCREEN_WIDTH, 64);
    _backView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 64);
    _backTitle.frame = CGRectMake((SCREEN_WIDTH-68)/2, _BackBtn.frame.origin.y-3, 68, 34);
    _webview.frame = CGRectMake(0, 65*PH, SCREEN_WIDTH, 602*PH);
}
@end
