//
//  LoginViewController.m
//  VCoach
//
//  Created by apple on 15/5/6.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "LoginViewController.h"
#import "TestViewController.h"
#import "PostClass.h"
#import "TestViewController.h"
#import "VTeacher.pch"
@interface LoginViewController (){

//    int i;
//    NSTimer *timer;
//    NSString *message;
    
    
        int  FinalYzm;
}

@end

@implementation LoginViewController

-(void)viewWillAppear:(BOOL)animated{
    
    self.tabBarController.tabBar.hidden = YES;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _backView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 64);
    _backImage.frame = CGRectMake(0, 0, SCREEN_WIDTH, 64);
    _backLable.frame = CGRectMake(37*PW, 40, 68*PW, 21*PH);
    _backLable.font = [UIFont systemFontOfSize:17*PW];
    _BackBtn.frame = CGRectMake(12*PW, 40, 17*PW, 21*PH);
    
    [self viewsLays];
    [self.BackBtn addTarget:self action:@selector(popView) forControlEvents:UIControlEventTouchDown];
    //获取验证码
    [self.postBtn addTarget:self action:@selector(getAr) forControlEvents:UIControlEventTouchDown];
    //登录按钮
    [self.loginBtn addTarget:self action:@selector(submit) forControlEvents:UIControlEventTouchDown];
    self.postBtn.layer.cornerRadius = 5;
    self.loginBtn.layer.cornerRadius = 5;
    
    self.phonetext.layer.cornerRadius = 5;
    self.message_number.layer.cornerRadius = 5;

    self.test.layer.masksToBounds =YES;
    self.test.layer.cornerRadius = 5;
}

-(void)popView{
    
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)yzm:(NSString *)ser{
    NSLog(@"###%@",ser);
    FinalYzm = [ser intValue];
    _message_number.text = ser;
}
-(void)getAr{
    NSLog(@"%@",_message_number.text);
    //获取验证码
    if ([self isMobileNumber:_phonetext.text]== 0) {
        UIAlertView *top = [[UIAlertView alloc]initWithTitle:@"提示" message:@"请输入正确的手机号码" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [top show];
    }else{
        //数据请求
        NSString *FinalUrl = [MainUrl stringByAppendingString:@"index.php/api/get/message_number"];
        // NSLog(@"URL=%@",FinalUrl);
        NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:_phonetext.text,@"user_phone", nil];
        
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
        [manager POST:FinalUrl parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSMutableDictionary *data = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
            if ([[data objectForKey:@"message"]isEqualToString:@"success"]) {
                [self yzm:[data objectForKey:@"results"]];
            }else{
                NSLog(@"失败");
            }
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"%@",error);
        }];
    }
}

-(void)submit{
    //提交
    int YzmText = [_message_number.text intValue];
    if (YzmText != FinalYzm) {
        UIAlertView *top = [[UIAlertView alloc]initWithTitle:@"提示" message:@"验证码输入有误" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [top show];
    }else{
        
        NSString *finaUrl = [MainUrl stringByAppendingString:@"index.php/api/post/user_login"];
        NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:_phonetext.text,@"user_phone", nil];
        
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
        [manager POST:finaUrl parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSMutableDictionary *data = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
            if ([[data objectForKey:@"message"]isEqualToString:@"success"]) {
                NSMutableDictionary *userId = [data objectForKey:@"results"];
                //                [self.delegate postUserId:[userId objectForKey:@"user_id"]];
              
            [self setPassword:[userId objectForKey:@"user_id"]];
                
            }else{
                NSLog(@"登录失败");
            }
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"%@",error);
        }];
        
        
    }
    
    
}

-(void)setPassword:(NSString*)uesrID{
    
    NSString *finaUrl = [MainUrl stringByAppendingString:checkPassword];
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:uesrID,@"user_id", nil];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    [manager POST:finaUrl parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSMutableDictionary*data = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
        if ([[data objectForKey:@"message"]isEqualToString:@"success"]) {
            NSDictionary *dd = [data objectForKey:@"results"];
            if ([[dd objectForKey:@"isset"]intValue] == 1) {
                
                [[NSUserDefaults standardUserDefaults]setObject:uesrID forKey:@"userID"];
                [[NSUserDefaults standardUserDefaults]synchronize];

                [self.navigationController popToRootViewControllerAnimated:YES];
            }else{
                TestViewController *tt = [[TestViewController alloc]initWithNibName:@"TestViewController" bundle:nil];
                tt.uid =uesrID;
                [self.navigationController pushViewController:tt animated:YES];
            }
        }else{
            NSLog(@"检查用户是否设置交易密码失败");
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
    
   
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
-(void)viewsLays{
    _top.frame = CGRectMake(54*PW, 157*PH, 266*PW, 21*PH);
    _top.font = [UIFont systemFontOfSize:12*PW];
    
    _phonetext.frame = CGRectMake(35*PW, 202*PH, 305*PW, 35*PH);
    _message_number.frame = CGRectMake(35*PW, 253*PH, 123*PW, 35*PH);
    _test.frame = CGRectMake(196*PW, 253*PH, 124*PW, 35*PH);
    _test.font = [UIFont systemFontOfSize:15*PW];
    
    _postBtn.frame = CGRectMake(196*PW, 253*PH, 124*PW, 35*PH);
    _postBtn.titleLabel.font = [UIFont systemFontOfSize:15*PW];
    
    _yuedu.frame = CGRectMake(118*PW, 537*PH, 85*PW, 21*PH);
    _mianze.frame = CGRectMake(202*PW, 537*PH, 54*PW, 21*PH);
    
    _yuedu.font = [UIFont systemFontOfSize:12*PW];
    _mianze.font = [UIFont systemFontOfSize:12*PW];
    _loginBtn.frame = CGRectMake(35*PW, 566*PH, 305*PW, 31*PH);
    _loginBtn.titleLabel.font = [UIFont systemFontOfSize:15*PW];
    
    
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_phonetext resignFirstResponder];
    [_message_number resignFirstResponder];
}
@end
