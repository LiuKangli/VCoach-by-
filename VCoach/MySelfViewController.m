//
//  MySelfViewController.m
//  VCoach
//
//  Created by apple on 15/4/27.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "MySelfViewController.h"
#import "MoreViewController.h"
#import "wabViewController.h"
#import "LoginViewController.h"
#import "MyorderViewController.h"
#import "ChooseadressViewController.h"
#import "IdinfoViewController.h"
#import "PostClass.h"
#import "Constants.h"

#import "VTeacher.pch"
#import "Myself_ validation.h"
@interface MySelfViewController ()

@end

@implementation MySelfViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated{
    //self.view.backgroundColor = [UIColor colorWithRed:0.886f green:0.886f blue:0.886f alpha:1.00f];
    backViewColor_gray;
    hiddenTabbar(NO)
    if ([[NSUserDefaults standardUserDefaults]objectForKey:@"userID"]==nil) {
        _userView.hidden = YES;
        _qianmingview.hidden = YES;
        _loginView.hidden = NO;
        [_gologin addTarget:self action:@selector(golog) forControlEvents:UIControlEventTouchDown];
        
    }else{
        _loginView.hidden= YES;
        _userView.hidden = NO;
        _qianmingview.hidden = NO;
       
         NSThread *thired = [[NSThread alloc]initWithTarget:self selector:@selector(firet) object:nil];
    [thired start];
        
    }

    self.navigationController.navigationBar.hidden = YES;
   
}
-(void)firet{
    NSString*wlzt=[[NSUserDefaults standardUserDefaults]stringForKey:@"WLZT"];
    if ([wlzt isEqualToString:@"no_net"]) {
        UIAlertView *ba = [[UIAlertView alloc]initWithTitle:@"蜂窝移动数据已关闭" message:@"启用蜂窝移动数据或无线局域网来访问数据" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
        [ba show];
    }else{
     [self getUserDataa];
    }
}
//用户资料
-(void)dataForUser:(NSMutableDictionary*)data{
    NSLog(@"%@",data);
    _userData = data;
    _userName.text = [_userData objectForKey:@"user_nickname"];
    _userMoney.text = [_userData objectForKey:@"user_money"];
    NSString *sexNum = [_userData objectForKey:@"user_sex"];
    if ([sexNum isEqualToString:@"1"]) {
      _userSex.text = @"女";
    }else if ([sexNum isEqualToString:@"0"]){
        _userSex.text = @"男";
    }
    NSString *headImageUrl = [_userData objectForKey:@"user_head_pic"];
    if ([[headImageUrl substringToIndex:4]isEqualToString:@"http"]) {
        [_userHeadImage sd_setImageWithURL:[NSURL URLWithString:headImageUrl]];
    }else{
       [_userHeadImage sd_setImageWithURL:[NSURL URLWithString:[ImageUrl stringByAppendingString: headImageUrl]]];
    }

    _usersign.text = [_userData objectForKey:@"user_sign"];
    NSLog(@"%@",_usersign.text);
    _userName.font = [UIFont systemFontOfSize:14*PW];
    NSDictionary *namedic = @{NSFontAttributeName:_userName.font};
    CGSize nameSize = [_userName.text sizeWithAttributes:namedic];
    _userName.frame = CGRectMake(128*PW, 14*PH, nameSize.width, 21*PH);
    
    
    _userSex.frame = CGRectMake(_userName.frame.origin.x+_userName.frame.size.width+5, _userName.frame.origin.y, 30*PW, 21*PH);
    
    _usersign.font = [UIFont systemFontOfSize:14*PW];
    _userMoney.font = [UIFont systemFontOfSize:14*PW];
    NSDictionary *dic = @{NSFontAttributeName:_userMoney.font};
    CGSize moneySize = [_userMoney.text sizeWithAttributes:dic];
    _userMoney.frame = CGRectMake(205*PW, 45*PH,moneySize.width, moneySize.height);
//    _userMoney.backgroundColor = [UIColor redColor];
//    _userYuan.backgroundColor = [UIColor greenColor];
    _userYuan.frame = CGRectMake(_userMoney.frame.origin.x+_userMoney.frame.size.width, _userMoney.frame.origin.y, 15*PW, _userMoney.frame.size.height);
    
    [SVProgressHUD dismiss];
}
-(void)getUserDataa{
    [SVProgressHUD show];
    NSString *finaUrl = [MainUrl stringByAppendingString:getUserData];
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[[NSUserDefaults standardUserDefaults] objectForKey:@"userID"],@"user_id",nil];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    [manager POST:finaUrl parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSMutableDictionary *data = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
        if ([[data objectForKey:@"message"]isEqualToString:@"success"]) {
            NSMutableDictionary *userData = [data objectForKey:@"results"];
            [[NSUserDefaults standardUserDefaults]setObject:userData forKey:@"userData"];
            [self dataForUser:userData];
        }else{
            NSLog(@"用户资料获取失败");
            [SVProgressHUD dismiss];
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _backView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 64);
    _backImage.frame = CGRectMake(0, 0, SCREEN_WIDTH, 64);
    [self viewsLay];
   // self.navigationController.navigationBar.hidden = YES;
    [_goorder addTarget:self action:@selector(dingdan) forControlEvents:UIControlEventTouchDown];
    [_goadress addTarget:self action:@selector(adress) forControlEvents:UIControlEventTouchDown];

    _goadress.layer.masksToBounds = YES;
    _goadress.layer.cornerRadius = 4.0;
    
    _goorder.layer.masksToBounds = YES;
    _goorder.layer.cornerRadius = 4.0;
   

    
    UITapGestureRecognizer *more = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(moreHa)];
    [_moreView addGestureRecognizer:more];

    UITapGestureRecognizer *user = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(userDa)];
    [_userView addGestureRecognizer:user];
    
    _moreView.layer.masksToBounds = YES;
    _moreView.layer.cornerRadius = 4.0;

    UITapGestureRecognizer *ligin = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(golog)  ];
    [_loginButton addGestureRecognizer:ligin];
    
    _userHeadImage.layer.masksToBounds = YES;
    _userHeadImage.layer.cornerRadius = _userHeadImage.frame.size.width/2;
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)userDa{
    
    //用户
    IdinfoViewController *user = [[IdinfoViewController alloc]initWithNibName:@"IdinfoViewController" bundle:nil];
    user.title = @"我的账户";
    user.data = _userData;
    [self.navigationController pushViewController:user animated:YES];
}
-(void)moreHa{
    //更多
    MoreViewController *more = [[MoreViewController alloc]initWithNibName:@"MoreViewController" bundle:nil];
    [self.navigationController pushViewController:more animated:YES];
}
- (void)getuserinfo{
    


}
//订单
-(void)dingdan{
    if ([[NSUserDefaults standardUserDefaults]objectForKey:@"userID"]==nil) {
        
    }else{
    
    MyorderViewController *myOrder = [[MyorderViewController alloc]initWithNibName:@"MyorderViewController" bundle:nil];
    [self.navigationController pushViewController:myOrder animated:YES];
    }
}
- (void)adress{
    //地址管理
    if ([[NSUserDefaults standardUserDefaults]objectForKey:@"userID"]==nil) {
        
    }else{

    ChooseadressViewController *add = [[ChooseadressViewController alloc]initWithNibName:@"ChooseadressViewController" bundle:nil];
    [self.navigationController pushViewController:add animated:YES];
    }
}

- (void)golog{
//    Myself__validation *login = [[Myself__validation alloc]init];
    LoginViewController *log = [[LoginViewController alloc]initWithNibName:@"LoginViewController" bundle:nil];
    [self.navigationController pushViewController:log animated:YES];
}

-(void)viewsLay{
    _userView.frame = CGRectMake(0, 74*PH, SCREEN_WIDTH, 78*PH);
    _userView.backgroundColor = [UIColor whiteColor];
    _userName.frame = CGRectMake(128*PW, 14*PH, 86*PW, 21*PH);
    _userName.font = [UIFont systemFontOfSize:14*PW];
    
    
    _userHeadImage.frame = CGRectMake(44*PW, 12*PH, 60*PW, 60*PH);
    
    _userMoneyImage.frame = CGRectMake(128*PW, 46*PH, 14*PW, 15*PH);
    _userLable.frame = CGRectMake(144*PW, 43*PH, 70*PW, 21*PH);
    _userLable.font = [UIFont systemFontOfSize:13*PW];
    
    _userYuan.frame = CGRectMake(249*PW, 43*PH, 21*PW, 21*PH);
    _userYuan.font = [UIFont systemFontOfSize:13*PW];
    
    _userMoney.frame = CGRectMake(205*PW, 43*PH, 36*PW, 21*PH);
    _userMoney.font = [UIFont systemFontOfSize:14*PW];
    _usersign.frame = CGRectMake(44*PW, 4*PH, 293*PW, 77*PH);
    
    _userRightImage.frame = CGRectMake(342*PW, 26*PH, 8*PW, 15*PH);
    _userSex.frame = CGRectMake(208*PW, 14*PH, 30*PW, 21*PH);
    _userSex.font = [UIFont systemFontOfSize:14*PW];

    _qianmingview.frame = CGRectMake(0, _userView.frame.origin.y+_userView.frame.size.height+(10*PH), SCREEN_WIDTH, 78*PH);
    _qianminagImage.frame = CGRectMake(340*PW, 31*PH, 8*PW, 15*PH);
    _usersign.frame = CGRectMake(44*PW, 4*PH, 324*PW, 77*PH);
    
    _loginView.frame = CGRectMake(0, 64, SCREEN_WIDTH, 180*PH);
    _loginLable.frame = CGRectMake(131*PW, 40*PH, 113*PW, 21*PH);
    _loginLable.font = [UIFont systemFontOfSize:15*PW];
    
    _gologin.frame = CGRectMake(122*PW, 87*PH, 130*PW, 36*PH);
    
      //_qianmingview.backgroundColor = [UIColor greenColor];
    
    _goorder.frame = CGRectMake(8*PW, 259*PH, 360*PW, 65*PH);
//    _goorder.layer.masksToBounds = YES;
//    _goorder.layer.cornerRadius = 4.0;
//    _goorder.backgroundColor = [UIColor redColor];
    _gooderImage.frame = CGRectMake(36*PW, 29*PH, 15*PW, 16*PH);
    _gooderImage1.frame = CGRectMake(332*PW, 26*PH, 8*PW, 15*PH);
    _gooderLable.frame = CGRectMake(59*PW, 26*PH, 68*PW, 21*PH);
    _gooderLable.font = [UIFont systemFontOfSize:15*PW];
    
    _goadress.frame = CGRectMake(8*PW, 332*PH, 360*PW, 65*PH);
    _adressimage.frame = CGRectMake(36*PW, 29*PH, 15*PW, 16*PH);
    _adressImage1.frame = CGRectMake(332*PW, 26*PH, 8*PW, 15*PH);
    _adressLable.frame = CGRectMake(59*PW, 26*PH, 68*PW, 21*PH);
    _adressLable.font = [UIFont systemFontOfSize:15*PW];
    
    _moreView.frame = CGRectMake(8*PW, 405*PH, 360*PW, 65*PH);
    _moreImage.frame = CGRectMake(34*PW, 26*PH, 15*PW, 18*PH);
    _moreImage1.frame = CGRectMake(332*PW, 26*PH, 8*PW, 15*PH);
    _moreLable.frame = CGRectMake(57*PW, 24*PH, 68*PW, 21*PH);
    _moreLable.font = [UIFont systemFontOfSize:15*PW];
    
}
-(void)viewDidAppear:(BOOL)animated{
    [SVProgressHUD dismiss];
}

@end
