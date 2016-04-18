
//
//  PasswordViewController.m
//  VCoach
//
//  Created by apple on 15/5/22.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "PasswordViewController.h"
#import "TestViewController.h"
#import "VTeacher.pch"
@interface PasswordViewController ()
{
    NSString *verification;
}
@end

@implementation PasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _backView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 64);
    _backView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 64);
    _backTitle.frame = CGRectMake((SCREEN_WIDTH-68)/2, _BackBtn.frame.origin.y-3, 68, 34);
    
    _tip.frame = CGRectMake(17*PW, 72*PH, 141*PW, 21*PH);
    _tip.font = [UIFont systemFontOfSize:14*PW];
    
    _phonetext.frame = CGRectMake(20*PW, 110*PH, 335*PW, 39*PH);
    _phonetext.font = [UIFont systemFontOfSize:14*PW];
    _messagetext.frame = CGRectMake(20*PW, 162*PH, 169*PW, 39*PH);
    _messagetext.font = [UIFont systemFontOfSize:14*PW];
    
    _postmessage.frame = CGRectMake(228*PW, 162*PH, 114*PW, 39*PH);
    _postmessage.titleLabel.font = [UIFont systemFontOfSize:15*PW];
    _nextBtn.frame = CGRectMake(20*PW, 225*PH, 335*PW, 39*PH);
    _nextBtn.titleLabel.font = [UIFont systemFontOfSize:15*PW];
    
    
    [self.realBack addTarget:self action:@selector(popView) forControlEvents:UIControlEventTouchDown];
    [self.nextBtn addTarget:self action:@selector(gonext) forControlEvents:UIControlEventTouchDown];
    self.phonetext.layer.cornerRadius = 5;
    _phonetext.keyboardType = UIKeyboardTypeNumberPad;
    self.messagetext.layer.cornerRadius = 5;
    self.postmessage.layer.masksToBounds = YES;
    self.nextBtn.layer.masksToBounds = YES;
    self.postmessage.layer.cornerRadius = 5;
    self.nextBtn.layer.cornerRadius = 5;
    [self.postmessage addTarget:self action:@selector(getVerification) forControlEvents:UIControlEventTouchDown];
    
    
}
-(void)yzm:(NSString*)FinaYzm{
    _messagetext.text = FinaYzm;
}
//获取验证码
-(void)getVerification{
    if ([self isMobileNumber:_phonetext.text]== 0) {
       //手机号输入有误
    }else{
    
    NSString *finaUrl = [MainUrl stringByAppendingString:@"index.php/api/get/message_number"];
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:_phonetext.text,@"user_phone", nil];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    [manager POST:finaUrl parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSMutableDictionary *data = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
        if ([[data objectForKey:@"message"]isEqualToString:@"success"]) {
            [self yzm:[data objectForKey:@"results"]];
        }else{
            NSLog(@"错误");
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
  }
}
- (void)gonext{
    TestViewController *view =[[TestViewController alloc]init];
    [self.navigationController pushViewController:view  animated:YES];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)isMobileNumber:(NSString *)mobileNum
{
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     12         */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186
     17         */
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189
     22         */
    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:mobileNum] == YES)
        || ([regextestcm evaluateWithObject:mobileNum] == YES)
        || ([regextestct evaluateWithObject:mobileNum] == YES)
        || ([regextestcu evaluateWithObject:mobileNum] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

-(void)popView{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
