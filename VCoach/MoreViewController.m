//
//  MoreViewController.m
//  VCoach
//
//  Created by apple on 15/5/7.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "MoreViewController.h"
#import "wabViewController.h"
#import "TestViewController.h"
#import "About_ViewController.h"
#import "VTeacher.pch"
@interface MoreViewController ()

@end

@implementation MoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self viewsLayouts];
    [self.realback addTarget:self action:@selector(popView) forControlEvents:UIControlEventTouchDown];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)gonew:(id)sender {
}

- (IBAction)gozhaoping:(id)sender {
    wabViewController *view = [[wabViewController alloc]init];
    view.url = @"http://www.baidu.com/";
    view.topTitle = @"招聘教练";
    [self.navigationController pushViewController:view animated:YES];
}

- (IBAction)gofuwu:(id)sender {
    wabViewController *view = [[wabViewController alloc]init];
    view.url = @"http://cn.bing.com/";
    view.topTitle = @"服务范围";
    [self.navigationController pushViewController:view animated:YES];
}

- (IBAction)aboutus:(id)sender {
    About_ViewController *view = [[About_ViewController alloc]init];
    [self.navigationController pushViewController:view animated:YES];
}

-(void)popView{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)viewWillAppear:(BOOL)animated{
    
    self.tabBarController.tabBar.hidden = YES;
    
}


- (IBAction)exit:(id)sender {

    [[NSUserDefaults standardUserDefaults ]removeObjectForKey:@"topData"];
    [[NSUserDefaults standardUserDefaults ]removeObjectForKey:@"cityName"];
    [[NSUserDefaults standardUserDefaults ]removeObjectForKey:@"tableViewData"];
    [[NSUserDefaults standardUserDefaults ]removeObjectForKey:@"userID"];
    [[NSUserDefaults standardUserDefaults ]removeObjectForKey:@"userData"];
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"channe"];
    [self.navigationController popToRootViewControllerAnimated:YES];
}
-(void)viewsLayouts{
    _backView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 64);
    _backImage.frame = CGRectMake(0, 0, SCREEN_WIDTH, 64);
    _backLable.frame = CGRectMake((SCREEN_WIDTH-68)/2, _BackBtn.frame.origin.y-3, 68, 34);
    _backLable.font = [UIFont systemFontOfSize:17];
    
    //_BackBtn.frame = CGRectMake(8*PW, 35*PH, 17*PW, 21*PH);
    
    _button1.frame = CGRectMake(0, 72*PH, SCREEN_WIDTH, 50*PH);
    _xiaoxi.frame = CGRectMake(27*PW, 14*PH, 68*PW, 21*PH);
    _xiaoxi.font = [UIFont systemFontOfSize:15*PW];
    _xiaoxiImage.frame =CGRectMake(346*PW, 18*PH, 10*PW, 12*PH);
    
    _button2.frame = CGRectMake(0, 123*PH, SCREEN_WIDTH, 50*PH);
    _zhaoping.frame = CGRectMake(27*PW, 14*PH, 68*PW, 21*PH);
     _zhaoping.font = [UIFont systemFontOfSize:15*PW];
    _zhaopingImage.frame = CGRectMake(346*PW, 18*PH, 10*PW, 12*PH);
    
    _button3.frame = CGRectMake(0, 174*PH, SCREEN_WIDTH, 50*PH);
    _fuwu.frame = CGRectMake(27*PW, 14*PH, 68*PW, 21*PH);
     _fuwu.font = [UIFont systemFontOfSize:15*PW];
    _fuwuImage.frame = CGRectMake(346*PW, 18*PH, 10*PW, 12*PH);
    
    _button4.frame = CGRectMake(0, 225*PH, SCREEN_WIDTH, 50*PH);
    _guanyu.frame = CGRectMake(27*PW, 14*PH, 68*PW, 21*PH);
     _guanyu.font = [UIFont systemFontOfSize:15*PW];
    _guanyuImage.frame = CGRectMake(346*PW, 18*PH,10*PW, 12*PH);
    
    _button5.frame = CGRectMake(3, 412*PH, SCREEN_WIDTH-6, 50*PH);
    //_exitLable.frame = CGRectMake(141*PW, 14*PH, 93*PW, 36*PH);
    _button5.backgroundColor =[UIColor colorWithRed:0.494f green:0.271f blue:0.141f alpha:1.00f];
    [_button5 setTitle:@"退出登录" forState:UIControlStateNormal];
    [_button5 setTintColor:[UIColor whiteColor]];
    
    _x1.frame = CGRectMake(9*PW, 19*PH, 10*PW, 12*PH);
   _x2.frame = CGRectMake(9*PW, 19*PH, 10*PW, 12*PH);
    _x3.frame = CGRectMake(9*PW, 19*PH, 10*PW, 12*PH);
    _x4.frame = CGRectMake(9*PW, 19*PH, 10*PW, 12*PH);
    
//    _exitLable.font = [UIFont systemFontOfSize:20*PW];
//    _exitLable.textColor = [UIColor whiteColor];
    _button5.layer.masksToBounds = YES;
    _button5.layer.cornerRadius = 4.0f;
    
    
}
@end
