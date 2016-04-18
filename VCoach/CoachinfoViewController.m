//
//  CoachinfoViewController.m
//  VCoach
//
//  Created by apple on 15/4/28.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "CoachinfoViewController.h"
#import "PostBuyViewController.h"
#import "AttestationViewController.h"
#import "LoginViewController.h"
#import "PostClass.h"
#import "Coachinfostatus.h"
#import "CoachinfoViewCell.h"
#import "Constants.h"
#import "VTeacher.pch"
#import "PostBuyViewController.h"
@interface CoachinfoViewController ()<UITableViewDelegate,UITableViewDataSource>{
    
    NSMutableArray *_statuss;
    NSMutableDictionary *fina;
    NSString *jiage;
    NSString *mingzi;
    NSString *bianHao;//classID
    
}

@end

@implementation CoachinfoViewController
-(void)viewWillAppear:(BOOL)animated{
    
    self.tabBarController.tabBar.hidden = YES;
    NSThread *thired = [[NSThread alloc]initWithTarget:self selector:@selector(getData) object:nil];
    [thired start];
    
    _backView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 64);
    _backImage.frame = CGRectMake(0, 0, SCREEN_WIDTH, 64);
     _backLable.frame = CGRectMake((SCREEN_WIDTH-68)/2, _BackBtn.frame.origin.y-3, 68, 34);
    _backLable.font = [UIFont systemFontOfSize:17];
    //_BackBtn.frame = CGRectMake(16*PW, 29*PH, 17*PW, 27*PH);
    
  
    _scrollerView.frame = CGRectMake(0, 68*PH, SCREEN_WIDTH, 615*PH);
    //NSLog(@"hh%f %f",_scrollerView.frame.size.width,_tableView.frame.size.width);
    _view1.frame = CGRectMake(8*PW, 15*PH, 359*PW, 176*PH);
    _titleImage.frame = CGRectMake(8*PW, 12*PH, 18*PW, 22*PH);
    _titleTop.frame = CGRectMake(29*PW, 8*PH, 79*PW, 30*PH);
    _titleTop.font = [UIFont systemFontOfSize:14*PW];
    _line.frame = CGRectMake(-8*PW, 48*PH, 367*PW, 1);
    
     _sexImage.frame = CGRectMake(101*PW, 55*PH, 13*PW, 12*PH);
   
    _name.frame = CGRectMake(_sexImage.frame.origin.x+_sexImage.frame.size.width+5, 49*PH, 64*PW, 24*PH);
    _name.font = [UIFont systemFontOfSize:14*PW];
    _name.textAlignment = NSTextAlignmentLeft;
   
    _headImage.frame = CGRectMake(8*PW, 66*PH, 85*PW, 85*PH);
    _headImage.layer.masksToBounds = YES;
    _headImage.layer.cornerRadius = _headImage.frame.size.width/2;
   
    _sex.frame = CGRectMake(_name.frame.origin.x+_name.frame.size.width, 49*PH, 21*PW, 22*PH);
    _sex.font = [UIFont systemFontOfSize:14*PW];
    _diquImage.frame = CGRectMake(101*PW, 81*PH, 13*PW, 12*PH);
    _arera.frame = CGRectMake(122*PW, 78*PH, 64*PW, 18*PH);
    _arera.font = [UIFont systemFontOfSize:14*PW];
    _jibie.frame = CGRectMake(101*PW, 104*PH, 64*PW, 24*PH);
    _jibie.font = [UIFont systemFontOfSize:14*PW];
    
    _jibieF.frame = CGRectMake(173*PW, 104*PH, 117*PW, 24*PH);
    _jibieF.font = [UIFont systemFontOfSize:14*PW];
    _jingyan.frame = CGRectMake(101*PW, 127*PH, 64*PW, 24*PH);
    _jingyan.font = [UIFont systemFontOfSize:14*PW];
    _jingyanF.frame = CGRectMake(173*PW, 127*PH, 117*PW, 24*PH);
    _jingyanF.font = [UIFont systemFontOfSize:14*PW];
    
    _jibieF.font = [UIFont systemFontOfSize:14*PW];
    _dingdanImage.frame = CGRectMake(307*PW, 55*PH, 8*PW, 12*PH);
    _danNum.frame = CGRectMake(321*PW, 49*PH, 30*PW, 22*PH);
    _danNum.font = [UIFont systemFontOfSize:13*PW];
    
    _view2.frame = CGRectMake(8*PW,207*PH, 359*PW, 54*PH);
    _renZheng.frame = CGRectMake(8*PW, 15*PH, 64*PW, 24*PH);
    _renZheng.font = [UIFont systemFontOfSize:14*PW];
    
    _rightImage.frame = CGRectMake(342*PW, 20*PH, 9*PW, 15*PH);
    
      _tableView.frame = CGRectMake(0,204*PH, SCREEN_WIDTH, 319*PH);
    _gobuy.frame = CGRectMake(266*PW, _tableView.frame.origin.y+_tableView.frame.size.height*PH, 85*PW, 39*PH);
     
}
- (void)viewDidLoad {
   
    [super viewDidLoad];
   
    [self viewFrame];
    [self.realback addTarget:self action:@selector(popView) forControlEvents:UIControlEventTouchDown];
    //[self.GobuyBtn addTarget:self action:@selector(Gobuy) forControlEvents:UIControlEventTouchDown];
    
    UITapGestureRecognizer *View2Touch = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(v2Touch)];
    [_view2 addGestureRecognizer:View2Touch];
    
   
    _statuss = [NSMutableArray array];
   
}
-(void)viewFrame{
    

    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _scrollerView.bounces = NO;
    
    _view1.layer.masksToBounds = YES;
    _view1.layer.cornerRadius = 2.0;
   
    
    _headImage.layer.masksToBounds = YES;
    _headImage.layer.cornerRadius = _headImage.frame.size.width/2;
    _view2.layer.masksToBounds = YES;
    _view2.layer.cornerRadius = 2.0;
    _tableView.scrollEnabled = NO;
    _scrollerView.scrollEnabled = YES;
    _scrollerView.contentSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT);
    _tableView.backgroundColor = [UIColor colorWithRed:0.937f green:0.937f blue:0.957f alpha:1.00f];
    
}
-(void)data:(NSMutableDictionary*)dd{
    NSString *headImageUrl = [[dd objectForKey:@"coacher_detail"]objectForKey:@"head_pic"];
    if ([[headImageUrl substringToIndex:4]isEqualToString:@"http"]) {
       [_headImage sd_setImageWithURL:[NSURL URLWithString:headImageUrl]];
    }else{
        [_headImage sd_setImageWithURL:[NSURL URLWithString:[ImageUrl stringByAppendingString:headImageUrl]]];
    }
    _name.text = [[dd objectForKey:@"coacher_detail"]objectForKey:@"coacher_name"];
    NSString *sexNum = [[dd objectForKey:@"coacher_detail"]objectForKey:@"user_sex"];
    if ([sexNum intValue]==1) {
        _sex.text = @"女";
    }else{
        _sex.text = @"男";
    }
    
    _jibieF.text = [[dd objectForKey:@"coacher_detail"]objectForKey:@"user_level"];
    _jingyanF.text = [[dd objectForKey:@"coacher_detail"]objectForKey:@"user_work_experience"];
    _danNum.text = [[[dd objectForKey:@"coacher_detail"]objectForKey:@"trans_sum"]stringByAppendingString:@"单"];
    _arera.text = [[dd objectForKey:@"coacher_detail"]objectForKey:@"area"];
    
   
    _statuss = [dd objectForKey:@"coachers_class"];
    
    [_tableView reloadData];
    _tableView.frame = CGRectMake(0, 264*PH, SCREEN_WIDTH, 100*_statuss.count*PH);
     _buttonF.frame = CGRectMake(266*PW, 50*PH, 85*PW, 39*PH);
    
    NSDictionary *danDic = @{NSFontAttributeName:_danNum.font};
    CGSize danSize = [_danNum.text sizeWithAttributes:danDic];
    _danNum.frame = CGRectMake(_view1.frame.size.width-danSize.width-8,  49*PH, danSize.width, 22*PH);
    _dingdanImage.frame = CGRectMake(_danNum.frame.origin.x-_dingdanImage.frame.size.width, 55*PH,8*PW, 12*PH);
    
    _gobuy.frame = CGRectMake(266*PW, _tableView.frame.origin.y+_tableView.frame.size.height+(20*PH), 85*PW, 39*PH);
    _scrollerView.contentSize = CGSizeMake(SCREEN_WIDTH, _view1.frame.size.height+_view2.frame.size.height+_tableView.frame.size.height+_gobuy.frame.size.height+(100*PH));
   // _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
   [SVProgressHUD dismiss];
}
-(void)getData{
    [SVProgressHUD show];
    NSString *finaUrl = [MainUrl stringByAppendingString:teacherDetail];
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:_tID,@"coacher_id", nil];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"html/text"];
    [manager POST:finaUrl parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSMutableDictionary *data = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
        if ([[data objectForKey:@"message"]isEqualToString:@"success"]) {
            fina = [data objectForKey:@"results"];
            [self  data:fina];
            
        }else{
            NSLog(@"教练详情获取失败");
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)Gobuy{

    if ([loginstatus intValue] == 1) {
        PostBuyViewController *view = [[PostBuyViewController alloc]init];
        [self.navigationController pushViewController:view animated:YES];
    }else{
        LoginViewController *view = [[LoginViewController alloc]init];
        [self.navigationController pushViewController:view animated:YES];
    }
    

}

-(void)popView{

    [self.navigationController popViewControllerAnimated:YES];
}

#pragma tableviewDatasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_statuss count];
}

//cell的数据源
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CoachinfoViewCell *Cell = [tableView dequeueReusableCellWithIdentifier:@"CoachinfoViewCell"];

    if (Cell == nil) {
        Cell = [[[NSBundle mainBundle]loadNibNamed:@"CoachinfoViewCell" owner:self options:nil]lastObject];
    }
    NSString *url = [[_statuss objectAtIndex:indexPath.row]objectForKey:@"ad_image_url"];
    if ([[url substringToIndex:4]isEqualToString:@"http"]) {
        [Cell.classimg sd_setImageWithURL:[NSURL URLWithString:url]];
    }else{
    [Cell.classimg sd_setImageWithURL:[NSURL URLWithString:[MainUrl stringByAppendingString:url]]];
    }
    
    Cell.price.text = [[_statuss objectAtIndex:indexPath.row]objectForKey:@"price"];
    Cell.title.text = [[_statuss objectAtIndex:indexPath.row]objectForKey:@"title"];
    Cell.selectionStyle = UITableViewCellSelectionStyleNone;
   
    Cell.contentView.frame = CGRectMake(8*PW, 2*PH, 359*PW, 90*PH);
    Cell.classimg.frame = CGRectMake(8*PW, 11*PH, 84*PW, 73*PH);
    Cell.price.frame = CGRectMake(243*PW, 39*PH, 28*PW, 21*PH);
    Cell.price.font = [UIFont systemFontOfSize:13*PW];
    Cell.line.frame = CGRectMake(286*PW, 9*PH, 1, 77*PH);
    Cell.selectimg.frame = CGRectMake(312*PW, 38*PH, 19*PW, 19*PW);
    Cell.yuan.frame = CGRectMake(227*PW, 41*PH, 15*PW, 18*PH);
    Cell.title.frame = CGRectMake(96*PW, 34*PH, 128*PW, 27*PH);
    Cell.title.font = [UIFont systemFontOfSize:13*PW];
    Cell.yuan.font = [UIFont systemFontOfSize:13*PW];
    [Cell ser:1];
   return Cell;
}


#pragma mark TableView Delegate Methods
//获取cell的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100*PH;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 5*PH;
}
//cell点击
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    jiage = [[_statuss objectAtIndex:indexPath.row]objectForKey:@"price"];
    mingzi = [[_statuss objectAtIndex:indexPath.row]objectForKey:@"title"];
    bianHao = [[_statuss objectAtIndex:indexPath.row]objectForKey:@"class_id"];
   // NSLog(@"%@",cLassId);
}
-(void)v2Touch{
    AttestationViewController *att = [[AttestationViewController alloc]initWithNibName:@"AttestationViewController" bundle:nil];
    att.cocahID = _tID;
    [self.navigationController pushViewController:att animated:YES];
}



- (IBAction)gobuy:(id)sender {
    if (bianHao.length ==0) {
        UIAlertView *ale = [[UIAlertView alloc]initWithTitle:@"提示" message:@"您还没有选择课程呦~" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [ale show];
    }else{
        PostBuyViewController *buy = [[PostBuyViewController alloc]initWithNibName:@"PostBuyViewController" bundle:nil];
        buy.where = @"B";
        buy.className = mingzi;
        buy.jiage = jiage;
        buy.jLiD = _tID;
        buy.addressType = @"W";
        NSLog(@"%@",bianHao);
        buy.KCID = bianHao;//classID
        [self.navigationController pushViewController:buy animated:YES];
    }
    
}
-(void)viewDidAppear:(BOOL)animated{
    [SVProgressHUD dismiss];
}
@end
