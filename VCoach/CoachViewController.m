//
//  CoachViewController.m
//  VCoach
//
//  Created by apple on 15/4/27.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "CoachViewController.h"
#import "CoachinfoViewController.h"

#import "CoachViewCell.h"
#import "PostClass.h"
#import "DejalActivityView.h"
#import "Constants.h"
#import "Second.h"
#import "Second-TeacherDetail.h"
#import "VTeacher.pch"




@interface CoachViewController ()<UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate>{
    
    NSMutableArray *_statuss;
    
}

@end

@implementation CoachViewController

//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        // Custom initialization
//    }
//    return self;
//}
-(void)viewWillAppear:(BOOL)animated{
    [self viewsLayout];
   // self.navigationController.navigationBar.hidden = YES;
    self.tabBarController.tabBar.hidden = NO;
    NSString*wlzt=[[NSUserDefaults standardUserDefaults]stringForKey:@"WLZT"];
    if ([wlzt isEqualToString:@"no_net"]) {
        UIAlertView *ba = [[UIAlertView alloc]initWithTitle:@"蜂窝移动数据已关闭" message:@"启用蜂窝移动数据或无线局域网来访问数据" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
        [ba show];
    }else{
    [self getData];
    }
}
- (void)viewDidLoad
{
    [super viewDidLoad];
   
   
    
      _seachtext.delegate = self;
    self.navigationController.navigationBar.hidden = YES;
    _tableview.scrollEnabled = NO;
    _scrollview.bounces = NO;
    _tableview.delegate = self;
    _tableview.dataSource = self;
    [self.seachBtn addTarget:self action:@selector(goseach) forControlEvents:UIControlEventTouchDown];
    
    _statuss = [NSMutableArray array];
 
    //半圆角
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.topView.bounds byRoundingCorners:UIRectCornerTopLeft|UIRectCornerTopRight cornerRadii:CGSizeMake(5, 5)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];
    maskLayer.frame = self.topView.bounds;
    maskLayer.path = maskPath.CGPath;
    self.topView.layer.mask = maskLayer;
    
    _tableview.hidden = NO;
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma tableviewDatasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_statuss count];
    
}

//cell的数据源
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    Second *Cell = [tableView dequeueReusableCellWithIdentifier:@"Second"];
    
    if (Cell == nil) {
        Cell = [[[NSBundle mainBundle]loadNibNamed:@"Second" owner:self options:nil]lastObject];

    }
  
    UIImageView *headImage = [[UIImageView alloc]initWithFrame:CGRectMake(8*PW, 36*PH, 80*PW, 80*PW)];
    [Cell addSubview:headImage];
   
    NSString *imageUrl = [[_statuss objectAtIndex:indexPath.row]objectForKey:@"head_pic"];
    if ([[imageUrl substringToIndex:4]isEqualToString:@"http"]) {
        [headImage sd_setImageWithURL:[NSURL URLWithString:imageUrl]];
    }else{
         [headImage sd_setImageWithURL:[NSURL URLWithString:[ImageUrl stringByAppendingString:imageUrl]]];
    }
   
    
    Cell.name.text = [[_statuss objectAtIndex:indexPath.row]objectForKey:@"coacher_name"];
    
    NSString *sexNum = [[_statuss objectAtIndex:indexPath.row]objectForKey:@"user_sex"];
    if ([sexNum isEqualToString:@"2"]||[sexNum isEqualToString:@"1"]) {
       Cell.sex.text = @"女";
    }else{
       Cell.sex.text = @"男";
    }
    
    Cell.dingdan.text = [[[_statuss objectAtIndex:indexPath.row]objectForKey:@"trans_sum"]stringByAppendingString:@"单"];
    Cell.tcText.text = [[_statuss objectAtIndex:indexPath.row]objectForKey:@"user_speciality"];
    Cell.jyText = [[_statuss objectAtIndex:indexPath.row]objectForKey:@"user_work_experience"];
    Cell.areraText.text = [[_statuss objectAtIndex:indexPath.row]objectForKey:@"area"];
  
   
    Cell.backgroundColor = [UIColor redColor];
    Cell.backView.frame = CGRectMake(0, 1, 365*PW, 131*PH);
   
    Cell.backView.layer.masksToBounds = YES;
    Cell.backView.layer.cornerRadius = 4.0;
    
   
    headImage.layer.masksToBounds = YES;
    headImage.layer.cornerRadius = headImage.frame.size.width/2.0f;
    
    Cell.backgroundColor = [UIColor colorWithRed:0.961f green:0.961f blue:0.961f alpha:1.00f];
   
    [SVProgressHUD dismiss];
    return Cell;
}


#pragma mark TableView Delegate Methods
//获取cell的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 160*PH;
}

 
//cell跳转页面
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    CoachinfoViewController *view = [[CoachinfoViewController alloc]initWithNibName:@"CoachinfoViewController" bundle:nil];
    view.tID = [[_statuss objectAtIndex:indexPath.row]objectForKey:@"coacher_id"];

    [self.navigationController pushViewController:view
                                         animated:YES];
}

-(void)getData{
    [SVProgressHUD show];
    if ([[NSUserDefaults standardUserDefaults]objectForKey:@"tableViewData"]==nil) {
        NSString *finaUrl = [MainUrl stringByAppendingString:teacherList];
        NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[[NSUserDefaults standardUserDefaults] objectForKey:@"cityName"],@"city_name", nil];
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"html/text"];
        [manager POST:finaUrl parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSMutableDictionary *data = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
            if ([[data objectForKey:@"message"]isEqualToString:@"success"]) {
                _statuss = [data objectForKey:@"results"];
                [[NSUserDefaults standardUserDefaults]setObject:[data objectForKey:@"results"] forKey:@"tableViewData"];
                
                _tableview.frame = CGRectMake(0, _topView.frame.size.height+_topView.frame.origin.y+10, SCREEN_WIDTH, 153*PH*_statuss.count+30);
                _scrollview.contentSize = CGSizeMake(SCREEN_WIDTH, _topView.frame.size.height+_tableview.frame.size.height+60);
                [_tableview reloadData];
            }else{
                NSLog(@"教练列表获取失败");
            }
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"%@",error);
        }];
 
    }else{
        _statuss = [[NSUserDefaults standardUserDefaults]objectForKey:@"tableViewData"];
        _tableview.frame = CGRectMake(0, _topView.frame.size.height+_topView.frame.origin.y+10, SCREEN_WIDTH, 160*PH*_statuss.count+35*PH);
        _scrollview.contentSize = CGSizeMake(SCREEN_WIDTH, _topView.frame.size.height+_tableview.frame.size.height+60);
        [_tableview reloadData];
        
    }
   }
//搜索结果
-(void)goseach{
  //  NSLog(@"%lu",_seachtext.text.length);
    if (_seachtext.text.length == 0) {
        _tableview.hidden = NO;
        [self getData];
    }else{
        _statuss = [NSMutableArray array];
        NSString *finaUrl = [MainUrl stringByAppendingString:searchTeacherList];
        NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:_seachtext.text,@"search_word", nil];
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"html/text"];
        [manager POST:finaUrl parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSMutableDictionary *data = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
            if ([[data objectForKey:@"message"]isEqualToString:@"success"]) {
                _statuss = [data objectForKey:@"results"];
                [_tableview reloadData];
            }else if ([[data objectForKey:@"message"]isEqualToString:@"no_result"]){
                _tableview.hidden = YES;
            }else{
                NSLog(@"搜索失败");
            }
            
            
            NSLog(@"%@",data);
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"%@",error);
        }];
  
    }
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_seachtext resignFirstResponder];
}
-(void)viewsLayout{
    _backView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 64);
    _backButton.frame = CGRectMake(330*PW, 29*PH, 24*PW, 23*PH);
    _backImage.frame = CGRectMake(0, 0, SCREEN_WIDTH, 64);
    _backText.frame = CGRectMake(16*PW, 26*PH, 291*PW, 29*PH);
    
    _scrollview.frame = CGRectMake(0, _backView.frame.origin.y+_backView.frame.size.height+5, SCREEN_WIDTH, 611*PH);
    _topView.frame = CGRectMake(4, 5, SCREEN_WIDTH-8, 32*PH);
    _topLable.frame = CGRectMake(37*PW, 6*PH, 68*PW, 21*PH);
    _topImage.frame = CGRectMake(8*PW, 4*PH, 21*PW, 24*PH);
    _tableview.frame = CGRectMake(0, 44*PH, SCREEN_WIDTH, 535*PH);
   
   
}
-(void)viewDidAppear:(BOOL)animated{
    [SVProgressHUD dismiss];
}
@end
