//
//  PayresultViewController.m
//  VCoach
//
//  Created by apple on 15/5/13.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "PayresultViewController.h"
#import "VTeacher.pch"
@interface PayresultViewController ()

@end

@implementation PayresultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.BackBtn addTarget:self action:@selector(popView) forControlEvents:UIControlEventTouchDown];
    NSLog(@"%@",_orderName);
    
    _orderNamePassword.text = _orderName;
    _payresultLable.text = _payresultLable1;
    _lable1.text = _lable11;
    if (_hidden == YES) {
        _orderView.hidden = YES;
    }else{
        _orderView.hidden = NO;
    //用户上传推送
    [self postTuisong];
    }
}
-(void)postTuisong{
    NSString *fina = [MainUrl stringByAppendingString:Tui];
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[[NSUserDefaults standardUserDefaults] objectForKey:@"userID"],@"user_id",@"1",@"device_type",@"0",@"user_type",[[NSUserDefaults standardUserDefaults] objectForKey:@"channe"],@"channel_id", nil];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    [manager POST:fina parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *data = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
        NSLog(@"%@",data);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)popView{
    
    int index = (int)[[self.navigationController viewControllers]indexOfObject:self];
    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:(index-5)] animated:YES];

    
}

-(void)viewWillAppear:(BOOL)animated{
    
    self.tabBarController.tabBar.hidden = YES;
    
    
    _backView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 64);
    _backViewImage.frame = CGRectMake(0, 0, SCREEN_WIDTH, 64);
    
    _backLable.frame = CGRectMake((SCREEN_WIDTH-68)/2, _BackBtn.frame.origin.y-3, 68,34);
    _backLable.font = [UIFont systemFontOfSize:17];
    
    _resultImage.frame = CGRectMake(170*PW, 73*PH, 35*PW, 35*PW);
    _payresultLable.frame = CGRectMake(153*PW, 116*PH, 68*PW, 21*PH);
    _payresultLable.font = [UIFont systemFontOfSize:15*PW];
    
    _lable1.frame = CGRectMake(111*PW, 158*PH, 153*PW, 21*PH);
    _lable1.font = [UIFont systemFontOfSize:15*PW];
    
    _orderView.frame = CGRectMake(0, 199*PH, SCREEN_WIDTH, 111*PH);
    _orderNameLable.frame = CGRectMake(83*PW, 15*PH, 68*PW, 21*PH);
    _orderNameLable.font = [UIFont systemFontOfSize:15*PW];
    _orderNamePassword.frame = CGRectMake(159*PW, 15*PH, 86*PW, 21*PH);
    _orderNamePassword.font = [UIFont systemFontOfSize:15*PW];
    
}
@end
