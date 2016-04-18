//
//  PostBuyViewController.m
//  VCoach
//
//  Created by apple on 15/4/29.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "PostBuyViewController.h"
#import "ChooseadressViewController.h"
#import "Constants.h"
#import "MywalletViewController.h"
#import "VTeacher.pch"
@interface PostBuyViewController (){

   

}

@end
static int i;
@implementation PostBuyViewController
-(void)viewWillAppear:(BOOL)animated{
    
   hiddenTabbar(YES)
    
}
- (void)viewDidLoad {
    [self viewsLayout];
    [super viewDidLoad];
    
    i = 1;
    [self.realBack addTarget:self action:@selector(popView) forControlEvents:UIControlEventTouchDown];
    [self.subtractNum addTarget:self action:@selector(subtract) forControlEvents:UIControlEventTouchDown];
    
    [self.addNum addTarget:self action:@selector(add) forControlEvents:UIControlEventTouchDown];
    
    [self.gowallet addTarget:self action:@selector(wallet) forControlEvents:UIControlEventTouchDown];
    
    
 [self.postBtn addTarget:self action:@selector(postBBuy) forControlEvents:UIControlEventTouchDown];
    self.classname.text = _className;
    self.classprice.text = [NSString stringWithFormat:@"%@元",_jiage];
    self.moneyNum.text = [NSString stringWithFormat:@"%@元",_jiage];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)add{
    i++;
    NSString *number = [NSString stringWithFormat:@"%d",i];
    self.number.text = number;

    self.moneyNum.text = [NSString stringWithFormat:@"%.2d元",[_classprice.text intValue] * i];
}
- (void)subtract{
    if (i>0) {
       
        if (i == 1) {
          
        }else{
            i--;
            NSString *number = [NSString stringWithFormat:@"%d",i];
            self.number.text = number;
            
            self.moneyNum.text = [NSString stringWithFormat:@"%.2d元",[_moneyNum.text intValue] - [_classprice.text intValue] ];
        }
    }else
    {
        i = 1;
       
        self.moneyNum.text = [NSString stringWithFormat:@"%@",_classprice];

    }
}

- (void)wallet{
    if ([[NSUserDefaults standardUserDefaults]objectForKey:@"userID"]==nil) {
        UIAlertView *top = [[UIAlertView alloc]initWithTitle:@"提示" message:@"您还没有登录呦~" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [top show];
    }else{
    MywalletViewController *view = [[MywalletViewController alloc]init];
    [self.navigationController pushViewController:view animated:YES];

    }
}
-(void)goaddress{

//    extern NSString *buy_sum;
//    buy_sum = [NSString stringWithFormat:@"%d",i];
    
    ChooseadressViewController *view = [[ChooseadressViewController alloc]initWithNibName:@"ChooseadressViewController" bundle:nil];
    [self.navigationController pushViewController:view animated:YES];
}
-(void)popView{
    
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)postBBuy{
    if ([[NSUserDefaults standardUserDefaults]objectForKey:@"userID"]==nil) {
        UIAlertView *top = [[UIAlertView alloc]initWithTitle:@"提示" message:@"您还没有登录呦~" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [top show];
    }else{
        ChooseadressViewController *choseAddress = [[ChooseadressViewController alloc]initWithNibName:@"ChooseadressViewController" bundle:nil];
        choseAddress.KID = _KCID;//课程ID
        choseAddress.whereGo = _where;
        choseAddress.JlId = _jLiD;//教练ID
        choseAddress.typeAd = _addressType;
        choseAddress.buy_num = [NSString stringWithFormat:@"%d",i];//订单数
        choseAddress.jiage = _moneyNum.text;
        NSLog(@"订单数为 %d  教练ID %@  课程ID %@",i,_jLiD,_KCID);
        [self.navigationController pushViewController:choseAddress animated:YES];
    }
}
-(void)viewsLayout{
    _backView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 64);
    _backImage.frame = CGRectMake(0, 0, SCREEN_WIDTH, 64);
    
    //_BackBtn.frame = CGRectMake(14, 27, 17*PW, 27*PH);
    
    _backLable.frame = CGRectMake(_BackBtn.frame.size.width+_BackBtn.frame.origin.x+2, _BackBtn.frame.origin.y-3, 68, 34);
    _backLable.font = [UIFont systemFontOfSize:15];
    
    _gowallet.frame = CGRectMake(SCREEN_WIDTH-100, _BackBtn.frame.origin.y-3, 90, 34);
    _gowallet.titleLabel.font = [UIFont systemFontOfSize:15];
    _view1.frame = CGRectMake(0, 73*PH, 376*PW, 65*PH);
   
  
    _classname.frame = CGRectMake(19*PW, 22*PH, 164*PW, 21*PH);
    _classname.font = [UIFont systemFontOfSize:15*PW];
    _classprice.frame = CGRectMake(280*PW, 25*PH, 80*PW, 21*PH);
_classprice.font = [UIFont systemFontOfSize:15*PW];
    
    _view2.frame = CGRectMake(0, 139*PH, SCREEN_WIDTH, 65*PH);
    _view2Left.frame = CGRectMake(20, 22, 50, 21);
    _view2Left.font = [UIFont systemFontOfSize:15*PW];
    _subtractNum.frame = CGRectMake(279*PW, 22*PH, 24*PW, 20*PH);
    _subtractNum.titleLabel.font = [UIFont systemFontOfSize:15*PW];
    _number.frame = CGRectMake(306*PW, 22*PH, 28*PW, 21*PH);
    _addNum.frame = CGRectMake(336*PW, 22*PH, 24*PW, 20*PH);
    
    _view3.frame = CGRectMake(0, 205*PH, SCREEN_WIDTH, 65*PH);
    _view3Left.frame = CGRectMake(21*PW, 22*PH, 51*PW, 21*PH);
    _view3Left.font = [UIFont systemFontOfSize:15*PW];
    _moneyNum.frame = CGRectMake(281*PW, 22*PH, 80*PW, 21*PH);
    _moneyNum.font = [UIFont systemFontOfSize:15*PW];
    _postBtn.frame = CGRectMake(24*PW, 314*PH, 326*PW, 40*PH);
    _postBtn.titleLabel.font = [UIFont systemFontOfSize:15*PW];
}
@end
