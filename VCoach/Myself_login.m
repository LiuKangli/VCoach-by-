//
//  Myself_login.m
//  VCoach
//
//  Created by Moon on 16/1/11.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "Myself_login.h"
#import "VTeacher.pch"
#import "Myself-Registered.h"
@interface Myself_login ()<UITextFieldDelegate>

@end

@implementation Myself_login
-(void)viewWillAppear:(BOOL)animated{
    self.title = @"登录";
    self.view.backgroundColor = [UIColor colorWithRed:0.886f green:0.886f blue:0.886f alpha:1.00f];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatView];
    // Do any additional setup after loading the view.
}
-(void)creatView{
    UIView *back = [[UIView alloc]initWithFrame:CGRectMake(15, 90,SCREEN_WIDTH-30 , 150)];
    back.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:back];
    
    _userName = [[UITextField alloc]initWithFrame:CGRectMake(20, 20, back.frame.size.width-40, 50)];
    _userName.placeholder = @"请输入手机号码";
    _userName.delegate = self;
    //_userName.tag = 10;
    [back addSubview:_userName];
    
    _passWord = [[UITextField alloc]initWithFrame:CGRectMake(20, _userName.frame.origin.y+_userName.frame.size.height+10, back.frame.size.width-40, 50)];
    _passWord.delegate = self;
    _passWord.placeholder = @"密码";
    _passWord.secureTextEntry = YES;
    //_passWord.tag = 11;
    [back addSubview:_passWord];
    
    _goLogin = [UIButton buttonWithType: UIButtonTypeCustom];
    _goLogin.frame = CGRectMake(15, back.frame.origin.y+back.frame.size.height+10, SCREEN_WIDTH-30, 40);
    _goLogin.layer.masksToBounds = YES;
    _goLogin.layer.cornerRadius = 4.0;
    _goLogin.backgroundColor = [UIColor lightGrayColor];
    [_goLogin setTitle:@"登录" forState:UIControlStateNormal];
    [_goLogin addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:_goLogin];
    
    _registered = [UIButton buttonWithType:UIButtonTypeCustom];
    [_registered setTitle:@"注册账号" forState:UIControlStateNormal];
    [_registered setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    _registered.frame = CGRectMake(15, _goLogin.frame.origin.y+_goLogin.frame.size.height, 80, 30);
    _registered.titleLabel.font = [UIFont systemFontOfSize:14];
    [_registered addTarget:self action:@selector(registere) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:_registered];
    
}
-(void)login{
    if (_passWord.text.length>0&&_userName.text.length>0) {
        
        //登陆
    }else{
        UIAlertView *top = [[UIAlertView alloc]initWithTitle:@"提示" message:@"输入有误" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [top show];
    }
}
//注册
-(void)registere{
    Myself_Registered *registerd = [[Myself_Registered alloc]init];
   registerd.title = @"注册";
    [self.navigationController pushViewController:registerd animated:YES];
    
    
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
