//
//  Myself-Registered.m
//  VCoach
//
//  Created by Moon on 16/1/11.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "Myself-Registered.h"
#import "VTeacher.pch"
#import "Myself-Registered1.h"
@interface Myself_Registered ()

@end

@implementation Myself_Registered
-(void)viewWillAppear:(BOOL)animated{
    backViewColor_gray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self Sview];
    // Do any additional setup after loading the view.
}
-(void)Sview{
    UIImageView *image= [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, 50)];
    image.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:image];
    
    UIView *back = [[UIView alloc]initWithFrame:CGRectMake(15, image.frame.size.height+image.frame.origin.y+15, SCREEN_WIDTH-30, 50)];
    back.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:back];
    
    
    _Phone = [[UITextField alloc]initWithFrame:CGRectMake(25, 5, back.frame.size.width-50, 30)];
    _Phone.placeholder = @"请输入您的手机号码";
    [back addSubview:_Phone];
    
    _Get_verification = [UIButton buttonWithType:UIButtonTypeCustom];
    _Get_verification.frame = CGRectMake(15, back.frame.origin.y+back.frame.size.height+15, back.frame.size.width, 40);
    [_Get_verification setTitle:@"获取验证码" forState:UIControlStateNormal];
    _Get_verification.layer.masksToBounds = YES;
    _Get_verification.layer.cornerRadius = 2.0;
    _Get_verification.backgroundColor = [UIColor grayColor];
    [_Get_verification addTarget:self action:@selector(getVer) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:_Get_verification];
}
-(void)getVer{
    if ([self isMobileNumber:_Phone.text]== 0) {
        UIAlertView *top = [[UIAlertView alloc]initWithTitle:@"提示" message:@"请输入正确的手机号码" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [top show];
    }else{
        //数据请求
        Myself_Registered1 *zhuce = [[Myself_Registered1 alloc]init];
        [self.navigationController pushViewController:zhuce animated:YES];
        
        
    }
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
