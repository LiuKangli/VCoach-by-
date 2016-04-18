//
//  ThirdViewController.m
//  VCoach
//
//  Created by Moon on 16/1/8.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ThirdViewController.h"
#import "VTeacher.pch"
#import "Myself_ validation.h"
#import "My-self-user-cell1.h"
#import "My-self-user-cell2.h"
#import "My-self-user-cell3.h"
#import "IdinfoViewController.h"
#import "MyorderViewController.h"
#import "MoreViewController.h"
#import "ChooseadressViewController.h"
@interface ThirdViewController ()<UITableViewDataSource,UITableViewDelegate>{
    UIView *backView;
    NSString *headUrl;
}

@end

@implementation ThirdViewController
-(void)viewWillAppear:(BOOL)animated{
    //self.view.backgroundColor = [UIColor colorWithRed:0.886f green:0.886f blue:0.886f alpha:1.00f];
    backViewColor_gray;
    hiddenTabbar(NO)
    NSThread *thired = [[NSThread alloc]initWithTarget:self selector:@selector(firet) object:nil];
    [thired start];
}
-(void)firet{
    if ([[NSUserDefaults standardUserDefaults]objectForKey:@"userID"]==nil) {
        backView.hidden = NO;
        
        _userTableView.hidden = YES;
    }else{
        
        [self getUserDataa];
        backView.hidden = YES;
    }

}
- (void)viewDidLoad {
    [super viewDidLoad];
[self creatView];
}
//未登录时 登录按钮
-(void)creatView{
    
    backView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, 185)];
    backView.backgroundColor = backViewColor_gray;
    backView.hidden = NO;
    [self.view addSubview:backView];

    
    _topLable = [[UILabel alloc]init];
    _topLable.text = @"您还没有登陆-";
    _topLable.font = [UIFont systemFontOfSize:13];
    NSDictionary *dic =@{NSFontAttributeName:_topLable.font};
    CGSize size = [_topLable.text sizeWithAttributes:dic];
    _topLable.frame = CGRectMake((SCREEN_WIDTH-size.width)/2, 90, size.width, 30);
   // _topLable.backgroundColor = [UIColor redColor];
    [backView addSubview:_topLable];
    
    _loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _loginButton.frame = CGRectMake((SCREEN_WIDTH-size.width)/2, _topLable.frame
                                     .origin.y+_topLable.frame.size.height+10, size.width, 30);
    [_loginButton setTitle:@"点我登陆吧" forState:UIControlStateNormal];
   _loginButton.backgroundColor = [UIColor colorWithRed:0.718f green:0.557f blue:0.447f alpha:1.00f] ;
    _loginButton.titleLabel.font = [UIFont systemFontOfSize:13];
    _loginButton.layer.masksToBounds = YES;
    _loginButton.layer.cornerRadius = 4.0;
    [_loginButton addTarget:self action:@selector(goLogin) forControlEvents:UIControlEventTouchDown];
    [backView addSubview:_loginButton];
    
}
-(void)cretTableView{
    _userTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, 430) style:UITableViewStylePlain];
    _userTableView.scrollEnabled = NO;
    self.automaticallyAdjustsScrollViewInsets = false;
    [self.view addSubview:_userTableView];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, _userTableView.frame.origin.y+_userTableView.frame.size.height, 50, 50);
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(qingchu) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:button];

}
-(void)qingchu{
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"userID"];
    backView.hidden = NO;
    _userTableView.hidden = YES;
}
-(void)goLogin{
    Myself__validation *login = [[Myself__validation alloc]init];
  
    [self.navigationController pushViewController:login animated:YES];
}
//用户资料
-(void)dataForUser:(NSMutableDictionary*)data{
    NSLog(@"%@",data);
    _userData = data;
    [self cretTableView];
    _userTableView.dataSource = self;
    _userTableView.delegate = self;
}
-(void)getUserDataa{
        NSString *finaUrl = [MainUrl stringByAppendingString:getUserData];
        NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[[NSUserDefaults standardUserDefaults] objectForKey:@"userID"],@"user_id",nil];
        
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
        [manager POST:finaUrl parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSMutableDictionary *data = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
            if ([[data objectForKey:@"message"]isEqualToString:@"success"]) {
                NSMutableDictionary *userData = [data objectForKey:@"results"];
                [self dataForUser:userData];
            }else{
                NSLog(@"用户资料获取失败");
            }
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"%@",error);
        }];
    
}
#pragma tableView-delegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger num;
    if (section == 0) {
        num = 1;
    }else if(section == 1){
        num = 1;
    }else{
        num = 3;
    }
    return num;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cell1 = @"cell1";
    static NSString *cell2 = @"cell2";
    static NSString *cell3 = @"cell3";
    My_self_user_cell1 *c1 = [tableView dequeueReusableCellWithIdentifier:cell1];
    My_self_user_cell2 *c2 = [tableView dequeueReusableCellWithIdentifier:cell2];
    My_self_user_cell3 *c3 = [tableView dequeueReusableCellWithIdentifier:cell3];
    if (indexPath.section == 0) {
        if (c1 == nil) {
            c1 = [[My_self_user_cell1 alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cell1];
            c1.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        NSString *headImageUrl = [_userData objectForKey:@"user_head_pic"];
        if ([[headImageUrl substringToIndex:4]isEqualToString:@"http"]) {
            headUrl = headImageUrl;
            c1.headImage.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:headUrl]]];
        }else{
             headUrl =[ImageUrl stringByAppendingString:headImageUrl];
            c1.headImage.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:headUrl]]];
        }
        
       // c1.headImage.image = [UIImage imageNamed:@""];
        NSString *sexNum = [_userData objectForKey:@"user_sex"];
        if ([sexNum isEqualToString:@"1"]) {
            c1.sex.text = @"男";
        }else if ([sexNum isEqualToString:@"2"]){
            c1.sex.text = @"女";
        }
        c1.name.text =[_userData objectForKey:@"user_nickname"];
        c1.money.text = [_userData objectForKey:@"user_money"];
        
        return c1;
    }else if (indexPath.section == 1){
        if (c2 == nil) {
            c2 = [[My_self_user_cell2 alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cell2];
            c2.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        c2.mingyan.text = [_userData objectForKey:@"user_sign"];
        c2.mingyan.font = [UIFont systemFontOfSize:14];
        CGSize size = CGSizeMake(330*PW, 1000*PH);
        c2.mingyan.numberOfLines = 0;
         c2.mingyan.font = [UIFont systemFontOfSize:18.0*PW];
        CGSize  labSize = [ c2.mingyan.text sizeWithFont: c2.mingyan.font constrainedToSize:size lineBreakMode:NSLineBreakByCharWrapping];
       // Bao0_cell.textt.frame = CGRectMake(23*PW, Bao0_cell.touxiang.frame.size.height+20*PH, 345*PW, labSize.height);

        return c2;
    }else{
        if (c3 == nil) {
            c3 = [[My_self_user_cell3 alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cell3];
            c3.selectionStyle = UITableViewCellSelectionStyleNone;
            switch (indexPath.row) {
                case 0:
                    c3.name.text = @"我的订单";
                    c3.image.image = [UIImage imageNamed:@"tuijianstar@2x.png"];
                    break;
                case 1:
                    c3.name.text = @"地址管理";
                    c3.image.image = [UIImage imageNamed:@"tuijianstar@2x.png"];
                    break;
                case 2:
                    c3.name.text = @"更多";
                    c3.image.image = [UIImage imageNamed:@"tuijianstar@2x.png"];
                    break;
                    
                default:
                    break;
            }
        }
        return c3;
    }
    return nil;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat hight;
    if (indexPath.section == 0) {
        hight = 80;
    }else if (indexPath.section == 1){
        hight = 80;
    }else{
        hight = 60;
    }
    return hight;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    CGFloat hight;
    if (section == 2) {
        hight = 15;
    }else{
        hight = 5;
    }
    return hight;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        //用户
        IdinfoViewController *user = [[IdinfoViewController alloc]initWithNibName:@"IdinfoViewController" bundle:nil];
        user.title = @"我的账户";
        user.data = _userData;
        [self.navigationController pushViewController:user animated:YES];
    }else if (indexPath.section == 1){
        //座右铭
    }else if (indexPath.section == 2) {
        if (indexPath.row == 0) {
            //订单
            MyorderViewController *myOrder = [[MyorderViewController alloc]initWithNibName:@"MyorderViewController" bundle:nil];
            [self.navigationController pushViewController:myOrder animated:YES];
        }else if (indexPath.row == 1){
            //地址管理
            ChooseadressViewController *add = [[ChooseadressViewController alloc]initWithNibName:@"ChooseadressViewController" bundle:nil];
            [self.navigationController pushViewController:add animated:YES];
        }else{
            //更多
            MoreViewController *more = [[MoreViewController alloc]initWithNibName:@"MoreViewController" bundle:nil];
            [self.navigationController pushViewController:more animated:YES];
        }
    }
}
-(void)didReceiveMemoryWarning {
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
