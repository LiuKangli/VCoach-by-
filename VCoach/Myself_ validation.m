//
//  Myself_ validation.m
//  VCoach
//
//  Created by Moon on 16/1/11.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "Myself_ validation.h"
#import "VTeacher.pch"
@interface Myself__validation ()
{
int  FinalYzm;
}
@end

@implementation Myself__validation
-(void)viewWillAppear:(BOOL)animated{
    backViewColor_gray;
   // hiddenTabbar(YES);
    hiddenTabbar(YES)

}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self views];
    // Do any additional setup after loading the view.
}

-(void)views{
    
      
    UILabel *lable = [[UILabel alloc]init];
    lable.font = [UIFont systemFontOfSize:13];
    lable.text = @"这项操作需要验证手机号，请接受并输入验证码";
    NSDictionary *dic = @{NSFontAttributeName:lable.font};
    CGSize size = [lable.text sizeWithAttributes:dic];
    lable.frame = CGRectMake((SCREEN_WIDTH-size.width)/2, 200, size.width, size.height);
    [self.view addSubview:lable];
    
    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(40, lable.frame.origin.y+lable.frame.size.height+15, SCREEN_WIDTH-80, 40)];
    view1.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view1];
    
    UIImageView *phone = [[UIImageView alloc]initWithFrame:CGRectMake(15, 15, 20, 20)];
    phone.image = [UIImage imageNamed:@"num+"];
    [view1 addSubview:phone];
    _phoneNumber = [[UITextField alloc]initWithFrame:CGRectMake(phone.frame.origin.x+phone.frame.size.width+15,15, view1.frame.size.width-phone.frame.size.width-45, 20)];
    _phoneNumber.placeholder = @"请输入您的手机号";
    [view1 addSubview:_phoneNumber];
    
    UIView *view2 = [[UIView alloc]initWithFrame:CGRectMake(40, view1.frame.origin.y+view1.frame.size.height+15, view1.frame.size.width/1.7, 40)];
    view2.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view2];
    
    UIImageView *phone1 =[[UIImageView alloc]initWithFrame:CGRectMake(15, 15, 20, 20)];
    phone1.image = [UIImage imageNamed:@"num+"];
    [view2 addSubview:phone1];
    _yzm = [[UITextField alloc]initWithFrame:CGRectMake(phone.frame.origin.x+phone.frame.size.width+15, 15, view2.frame.size.width-phone.frame.size.width-45, 20)];
    _yzm.placeholder = @"请输入验证码";
    [view2 addSubview:_yzm];
    
    
    
    UIButton *Verification = [UIButton buttonWithType:UIButtonTypeCustom];
    Verification.frame = CGRectMake(view2.frame.origin.x+view2.frame.size.width+15, view1.frame.origin.y+view1.frame.size.height+15, view1.frame.size.width-(view2.frame.size.width+15), 40);
    [Verification setTitle:@"获取验证码" forState:UIControlStateNormal];
    Verification.backgroundColor = [UIColor colorWithRed:0.663f green:0.482f blue:0.345f alpha:1.00f];
    Verification.titleLabel.font = [UIFont systemFontOfSize:14];
    [Verification addTarget:self action:@selector(getAr) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:Verification];
    
    
    UILabel *textRead = [[UILabel alloc]init];
    textRead.text = @"我已阅读并同意《免责声明》";
   // textRead.backgroundColor = [UIColor blackColor];
    NSDictionary *dicc = @{NSFontAttributeName:textRead.font};
    CGSize textSize = [textRead.text sizeWithAttributes:dicc];
    textRead.frame = CGRectMake(50
                                , SCREEN_HEIGHT-100, textSize.width, textSize.height);
    textRead.textColor = [UIColor blackColor];
    textRead.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:textRead];
    
    UIButton *down = [UIButton buttonWithType:UIButtonTypeCustom];
    [down setTitle:@"确认提交" forState:UIControlStateNormal];
    down.backgroundColor = [UIColor colorWithRed:0.663f green:0.482f blue:0.345f alpha:1.00f];
    down.frame = CGRectMake(view1.frame.origin.x, textRead.frame.origin.y+textRead.frame.size.height+10, view1.frame.size.width, view1.frame.size.height);
    [down addTarget:self action:@selector(submit) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:down];
    
}
-(void)yzm:(NSString *)ser{
    NSLog(@"###%@",ser);
    FinalYzm = [ser intValue];
}
-(void)getAr{
    NSLog(@"%@",_yzm.text);
   //获取验证码
    if ([self isMobileNumber:_phoneNumber.text]== 0) {
        UIAlertView *top = [[UIAlertView alloc]initWithTitle:@"提示" message:@"请输入正确的手机号码" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [top show];
    }else{
        //数据请求
        NSString *FinalUrl = [MainUrl stringByAppendingString:@"index.php/api/get/message_number"];
       // NSLog(@"URL=%@",FinalUrl);
        NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:_phoneNumber.text,@"user_phone", nil];
        
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
    NSString*wlzt=[[NSUserDefaults standardUserDefaults]stringForKey:@"WLZT"];
    if ([wlzt isEqualToString:@"no_net"]) {
        UIAlertView *ba = [[UIAlertView alloc]initWithTitle:@"蜂窝移动数据已关闭" message:@"启用蜂窝移动数据或无线局域网来访问数据" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
        [ba show];
    }else{
    //提交
    int YzmText = [_yzm.text intValue];
    if (YzmText != FinalYzm) {
        UIAlertView *top = [[UIAlertView alloc]initWithTitle:@"提示" message:@"验证码输入有误" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [top show];
    }else{
     
        NSString *finaUrl = [MainUrl stringByAppendingString:@"index.php/api/post/user_login"];
        NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:_phoneNumber.text,@"user_phone", nil];
        
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
        [manager POST:finaUrl parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSMutableDictionary *data = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
            if ([[data objectForKey:@"message"]isEqualToString:@"success"]) {
                NSMutableDictionary *userId = [data objectForKey:@"results"];
//                [self.delegate postUserId:[userId objectForKey:@"user_id"]];
                // 缓存
                [[NSUserDefaults standardUserDefaults]setObject:[userId objectForKey:@"user_id"] forKey:@"userID"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                [self.navigationController popToRootViewControllerAnimated:YES];
            }else{
                NSLog(@"登录失败");
            }
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"%@",error);
        }];
        
        
    }
    }
    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
