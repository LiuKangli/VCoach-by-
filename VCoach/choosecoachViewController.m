//
//  choosecoachViewController.m
//  VCoach
//
//  Created by apple on 15/5/12.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "choosecoachViewController.h"
#import "PayresultViewController.h"
#import "Choosecoachstatus.h"
#import "ChoosecoachViewCell.h"
#import "ChoosetimeViewController.h"
#import "PostClass.h"
#import "Constants.h"
#import "CoachViewCell.h"
#import "VTeacher.pch"
#import "Second.h"
@interface choosecoachViewController (){

    
    NSMutableArray *_statuss;
    NSString *JlianId;
}


@end

@implementation choosecoachViewController
-(void)viewWillAppear:(BOOL)animated{
    
    self.tabBarController.tabBar.hidden = YES;
    NSThread *getdata = [[NSThread alloc]initWithTarget:self selector:@selector(initData) object:nil];
    [getdata start];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"课程ID = %@  地址id = %@",_kCid,_adressId);
    [self viewsLayouts];
    _statuss = [NSMutableArray array];
  
    [self.realback addTarget:self action:@selector(popView) forControlEvents:UIControlEventTouchDown];
    [self.postBtn addTarget:self action:@selector(post) forControlEvents:UIControlEventTouchDown];
    
    _tableview.separatorStyle = UITableViewCellSelectionStyleNone;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    
    Second *Cell = [tableView dequeueReusableCellWithIdentifier:@"Second"];
    
    if (Cell == nil) {
        Cell = [[[NSBundle mainBundle]loadNibNamed:@"Second" owner:self options:nil]lastObject];
        
    }
    UIImageView *headImage = [[UIImageView alloc]initWithFrame:CGRectMake(8*PW, 26*PH, 80*PW, 80*PW)];
     [Cell addSubview:headImage];
    
    Cell.name.text = [[_statuss objectAtIndex:indexPath.row]objectForKey:@"coacher_name"];
    NSString *sexNUm = [[_statuss objectAtIndex:indexPath.row]objectForKey:@"coacher_sex"];
    if ([sexNUm isEqualToString:@"0"]) {
        Cell.sex.text = @"男";
    }else{
        Cell.sex.text = @"女";
    }
    Cell.dingdan.text = [[[_statuss objectAtIndex:indexPath.row]objectForKey:@"order_sum"]stringByAppendingString:@"单"];
    NSString *headurl = [[_statuss objectAtIndex:indexPath.row]objectForKey:@"head_pic"];
    if ([[headurl substringToIndex:4]isEqualToString:@"http"]) {
        [headImage sd_setImageWithURL:[NSURL URLWithString:headurl]];
        
    }else{
         [headImage sd_setImageWithURL:[NSURL URLWithString:[ImageUrl stringByAppendingString:headurl]]];
    }
    headImage.layer.masksToBounds = YES;
    headImage.layer.cornerRadius = headImage.frame.size.width/2;
    Cell.tcText.text = [[_statuss objectAtIndex:indexPath.row]objectForKey:@"coacher_speciality"];
    Cell.jyText.text = [[_statuss objectAtIndex:indexPath.row]objectForKey:@"coacher_experience"];
    Cell.areraText.hidden = YES;
    Cell.areraImage.hidden = YES;
    
    [SVProgressHUD dismiss];
    return Cell;
}


#pragma mark TableView Delegate Methods
//获取cell的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 153*PH;
}


//cell跳转页面
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    JlianId = [[_statuss objectAtIndex:indexPath.row]objectForKey:@"coacher_id"];
    NSLog(@".......%@",JlianId);
    
    return;
}
-(void)initData{
    NSString*wlzt=[[NSUserDefaults standardUserDefaults]stringForKey:@"WLZT"];
    if ([wlzt isEqualToString:@"no_net"]) {
        UIAlertView *ba = [[UIAlertView alloc]initWithTitle:@"蜂窝移动数据已关闭" message:@"启用蜂窝移动数据或无线局域网来访问数据" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
        [ba show];
    }else{
    [SVProgressHUD show];
    NSString *finaurl = [MainUrl stringByAppendingString:teaList];
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:_kCid,@"class_id",_adressId,@"address_id", nil];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    [manager POST:finaurl parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSMutableDictionary *data = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
        if ([[data objectForKey:@"message"]isEqualToString:@"success"]) {
            _statuss = [data objectForKey:@"results"];
            [_tableview reloadData];
             _tableview.frame = CGRectMake(0, 118*PH, SCREEN_WIDTH, _statuss.count*(153*PH));
            if (_tableview.frame.size.height>SCREEN_HEIGHT) {
                _tableview.scrollEnabled = YES;
            }else{
                _tableview.scrollEnabled = NO;
            }
        }else{
            _tableview.hidden = YES;
            _postBtn.enabled = NO;
            NSLog(@"匹配教练失败");
            UIAlertView *ale = [[UIAlertView alloc]initWithTitle:@"提示" message:@"无匹配教练" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [ale show];
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
    }
    
}


//提交订单
- (void)post{
    if (_statuss.count <=0) {
        NSLog(@".....");
    }else{
        
        ChoosetimeViewController *view = [[ChoosetimeViewController alloc]init];
        view.JliD = JlianId;
        view.DindanShu = _dIngdS;
        view.dizhiID = _adressId;
        view.clsaaID = _kCid;
        view.price = _jAge;
        NSLog(@"订单数 %@ 地址ID %@ 课程ID %@ 价格%@",_dIngdS,_adressId,_kCid,_jAge);
        [self.navigationController pushViewController:view animated:YES];
    }
}
-(void)viewsLayouts{
    _backView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 64);
    _backImage.frame = CGRectMake(0, 0, SCREEN_WIDTH, 64);
    
    _backLable.frame = CGRectMake(_BackBtn.frame.origin.x+_BackBtn.frame.size.width+3, _BackBtn.frame.origin.y-3, 68, 34);
   // _BackBtn.frame = CGRectMake(14, 27, 17, 27);
    
    _view1.frame= CGRectMake(0, 71*PH, SCREEN_WIDTH, 33*PH);
    _view1Lable.frame = CGRectMake(16*PW, 6*PH, 119*PW, 21*PH);
    _view1Lable.font = [UIFont systemFontOfSize:15*PW];
    
    _tableview.frame = CGRectMake(0, 118*PH, SCREEN_WIDTH, 270*PH);
    _postBtn.frame = CGRectMake(78*PW, 588*PH, 219*PW, 35*PH);
    
    
}
-(void)viewDidAppear:(BOOL)animated{
    [SVProgressHUD dismiss];
}
@end
