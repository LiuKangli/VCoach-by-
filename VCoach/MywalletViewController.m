//
//  MywalletViewController.m
//  VCoach
//
//  Created by apple on 15/5/21.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "MywalletViewController.h"
#import "PasswordViewController.h"
#import "LoginViewController.h"
#import "VTeacher.pch"
@interface MywalletViewController ()

@end

@implementation MywalletViewController
-(void)viewWillAppear:(BOOL)animated{
    
    hiddenTabbar(YES)
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self viewsLays];
    [self.realBack addTarget:self action:@selector(popViewv) forControlEvents:UIControlEventTouchDown];
    [self.changepassword addTarget:self action:@selector(gochange) forControlEvents:UIControlEventTouchDown];
    _getML.text = [[[[NSUserDefaults standardUserDefaults]objectForKey:@"userData"]objectForKey:@"user_money"]stringByAppendingString:@"元"];
//    NSLog(@"%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"userData"]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)gochange{
//    extern NSString *loginorpw;
//    loginorpw = @"1";
    PasswordViewController *view = [[PasswordViewController alloc]initWithNibName:@"PasswordViewController" bundle:nil];
   
    [self.navigationController pushViewController:view animated:YES];
}

-(void)popViewv{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)viewsLays{
    _backView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 64);
    _backImage.frame = CGRectMake(0, 0, SCREEN_WIDTH, 64);
    _backTitle.frame = CGRectMake((SCREEN_WIDTH-68)/2, _BackBtn.frame.origin.y-3, 68, 34);
    
    _getinBtn.frame = CGRectMake(0, 69*PH, SCREEN_WIDTH, 57*PH);
    _getImageLeft.frame = CGRectMake(8*PW, 24*PH, 10*PW, 10*PW);
    _getImageRight.frame = CGRectMake(357*PW, 24*PH, 10*PW, 10*PW);
    _getML.frame = CGRectMake(26*PW, 18*PH, 70*PW, 21*PH);
    _getML.font = [UIFont systemFontOfSize:14*PW];
    
    _getMM.frame = CGRectMake(99*PW, 18*PH, 115*PW, 21*PH);
    _getMM.font = [UIFont systemFontOfSize:14*PW];
    
    _getLable.frame = CGRectMake(303*PW, 18*PH, 34*PW, 21*PH);
    _getLable.font = [UIFont systemFontOfSize:14*PW];
    
    _changepassword.frame = CGRectMake(0, 134*PH, SCREEN_WIDTH, 57*PH);
    _changeRightImage.frame = CGRectMake(357*PW, 24*PH, 10*PW, 10*PW);
    _changeImage.frame = CGRectMake(8*PW, 24*PH, 10*PW, 10*PW);
    _changeLable.frame = CGRectMake(26*PW, 21*PH, 102*PW, 21*PH);
    _changeLable.font = [UIFont systemFontOfSize:14*PW];
    
    _changexing.frame = CGRectMake(316*PW, 22*PH, 19*PW, 21*PH);
    _changexing.font = [UIFont systemFontOfSize:14*PW];
    
    
}

@end
