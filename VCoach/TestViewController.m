


//
//  TestViewController.m
//  VCoach
//
//  Created by apple on 15/5/22.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "TestViewController.h"

#import "VTeacher.pch"
@interface TestViewController ()<TXTradePasswordViewDelegate>{
    NSString *qian;
    NSString *hou;
}

@end

@implementation TestViewController
-(void)viewWillAppear:(BOOL)animated{

}
- (void)viewDidLoad {
    [super viewDidLoad];
    _backView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 64);
    _backImage.frame = CGRectMake(0, 0, SCREEN_WIDTH, 64);
    _backTitle.frame = CGRectMake((SCREEN_WIDTH-102)/2, _BackBtn.frame.origin.y-3, 102, 34);
    _saveBtn.frame = CGRectMake(54*PW, 397*PH, 266*PW, 39*PH);
    
    [self.saveBtn addTarget:self action:@selector(save) forControlEvents:UIControlEventTouchDown];
    _saveBtn.enabled = NO;
    TXTradePasswordView *TXView = [[TXTradePasswordView alloc]initWithFrame:CGRectMake(0, 100*PH,SCREEN_WIDTH, 200*PH) WithTitle:@"请输入交易密码"];
    TXView.TXTradePasswordDelegate = self;
    if (![TXView.TF becomeFirstResponder])
    {
        //成为第一响应者。弹出键盘
        [TXView.TF becomeFirstResponder];
    }
    
    
    [self.view addSubview:TXView];
    
    

    
    [self.realButton addTarget:self action:@selector(popView) forControlEvents:UIControlEventTouchDown];
   
    
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
}
-(void)TXTradePasswordView:(TXTradePasswordView *)view WithPasswordString:(NSString *)Password
{
    NSLog(@"%@",_uid);
    qian = [Password substringToIndex:6];
    hou = [Password substringFromIndex:6];
    if ([qian intValue] == [hou intValue]) {
        _saveBtn.enabled = YES;
    }else{
        
        UIAlertView *ale = [[UIAlertView alloc]initWithTitle:@"提示" message:@"两次密码输入不一致" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [ale show];
    }
   
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)save{
   
    NSString *finaUrl = [MainUrl stringByAppendingString:@"index.php/api/put/change_payment_password"];
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:_uid,@"user_id",qian,@"password",nil];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    [manager POST:finaUrl parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSMutableDictionary *data = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
        if ([[data objectForKey:@"message"]isEqualToString:@"success"]) {
            [[NSUserDefaults standardUserDefaults]setObject:_uid forKey:@"userID"];
            [self.navigationController popToRootViewControllerAnimated:YES];
        }else{
            UIAlertView *ale = [[UIAlertView alloc]initWithTitle:@"提示" message:@"失败了~再试一次吧" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [ale show];
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
    

}
-(void)popView{
    [self.navigationController popViewControllerAnimated:YES];
//    NSArray * ctrlArray = self.navigationController.viewControllers;
//
//    [self.navigationController popToViewController:[ctrlArray objectAtIndex:2] animated:YES];
}

@end
