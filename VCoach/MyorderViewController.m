//
//  MyorderViewController.m
//  VCoach
//
//  Created by apple on 15/5/14.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "MyorderViewController.h"
#import "DejalActivityView.h"
#import "orderstatus.h"
#import "orderViewCell.h"
#import "PostClass.h"
#import "Constants.h"
#import "SDImageCache.h"
#import "OrderinfoViewController.h"
#import "VTeacher.pch"
@interface MyorderViewController ()<UITableViewDataSource,UITableViewDelegate>{
    
    NSMutableArray *_statuss;
    
    NSMutableArray *results;
    
    NSArray *results1;
    
    NSMutableArray *arrayCount;
}

@end

@implementation MyorderViewController
-(void)viewWillAppear:(BOOL)animated{
    hiddenTabbar(YES)
    self.navigationController.navigationBar.hidden = YES;
    self.allBtn.enabled = NO;
    self.nopayBtn.enabled = YES;
    self.noreplyBtn.enabled = YES;
    self.nouseBtn.enabled = YES;
    self.noYet.enabled = YES;
    NSString*wlzt=[[NSUserDefaults standardUserDefaults]stringForKey:@"WLZT"];
    if ([wlzt isEqualToString:@"no_net"]) {
        UIAlertView *ba = [[UIAlertView alloc]initWithTitle:@"蜂窝移动数据已关闭" message:@"启用蜂窝移动数据或无线局域网来访问数据" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
        [ba show];
    }else{
    NSThread *getD = [[NSThread alloc]initWithTarget:self selector:@selector(getOrderData) object:nil];
    [getD start];
       
    }
}
-(void)getOrderData{
    [self getdata];
    [self.allBtn setTitleColor:[UIColor brownColor] forState:UIControlStateNormal];
    [self.nopayBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.nouseBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.noreplyBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.noYet setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    self.allBtn.enabled = NO;
    self.nopayBtn.enabled = YES;
    self.noreplyBtn.enabled = YES;
    self.nouseBtn.enabled = YES;
    self.noYet.enabled = YES;
    [self animation:0];
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self viewsLayout];
    _tableview.delegate = self;
    _tableview.dataSource = self;
  
//self.title = @"我的订单";
    
    _statuss = [NSMutableArray array];
    arrayCount = [NSMutableArray array];
    [self.realback addTarget:self action:@selector(popView) forControlEvents:UIControlEventTouchDown];
//    全部
    [self.allBtn addTarget:self action:@selector(goall) forControlEvents:UIControlEventTouchDown];
    
    //待付款
    [self.nopayBtn addTarget:self action:@selector(gonopay) forControlEvents:UIControlEventTouchDown];
    
//待使用
    [self.nouseBtn addTarget:self action:@selector(gonouse) forControlEvents:UIControlEventTouchDown];
//    待评价
    [self.noreplyBtn addTarget:self action:@selector(gonoreply) forControlEvents:UIControlEventTouchDown];
    
// 待确认
    [self.noYet addTarget:self action:@selector(goNoYet) forControlEvents:UIControlEventTouchDown];
}
//筛选出对应id的课程
-(void)initdata{
    for (int i = 0; i<results.count; i++) {
        [arrayCount addObject:[results objectAtIndex:i]];
    }
    if ([arrayCount count] == 0) {
        self.notext.hidden = NO;
        self.notext.text = @"您还没有订单哦~";
        self.tableview.hidden = YES;
    }else{
        self.tableview.hidden = NO;
        self.notext.hidden = YES;
        
    }

}
- (void)initdata:(int)i
{

    for (int j = 0; j<results.count; j++) {
        if ([[[results objectAtIndex:j]objectForKey:@"order_status"] intValue]==i) {
            [arrayCount addObject:[results objectAtIndex:j]];
        }
    }
    NSLog(@"筛选%@",arrayCount);
    if ([arrayCount count] == 0) {
        self.notext.hidden = NO;
        self.notext.text = @"您还没有订单哦~";
        self.tableview.hidden = YES;
    }else{
        self.tableview.hidden = NO;
        self.notext.hidden = YES;

    }
//    [self.tableview reloadData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma tableviewDatasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
  
    return arrayCount.count;
}

//cell的数据源
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
       orderViewCell *Cell = [tableView dequeueReusableCellWithIdentifier:@"orderViewCell"];
    if (Cell == nil) {
        Cell = [[[NSBundle mainBundle]loadNibNamed:@"orderViewCell" owner:self options:nil]lastObject];
        
        Cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    if (arrayCount.count == 0) {
        _tableview.hidden = YES;
    }else{
        Cell.price.text = [[arrayCount objectAtIndex:indexPath.row]objectForKey:@"price"];
        Cell.classtitle.text = [[arrayCount objectAtIndex:indexPath.row]objectForKey:@"title"];
        NSString *url = [[arrayCount objectAtIndex:indexPath.row]objectForKey:@"ad_image_url"];
        if ([[url substringToIndex:4]isEqualToString:@"http"]) {
            
        }else{
            url = [ImageUrl stringByAppendingString:url];
        }
        [ Cell.classimg sd_setImageWithURL:[NSURL URLWithString:url]];
        
        Cell.jianjie.text = [[arrayCount objectAtIndex:indexPath.row]objectForKey:@"simple_introduce"];
    }
    Cell.statusimg.backgroundColor = [UIColor redColor];
    [SVProgressHUD dismiss];
    return Cell;
}


#pragma mark TableView Delegate Methods
//获取cell的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 116;
}
//cell跳转页面
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
  
    NSLog(@"哈哈%d",indexPath.row);
    OrderinfoViewController *aview = [[OrderinfoViewController alloc]init];
    NSString *url = [[arrayCount objectAtIndex:indexPath.row]objectForKey:@"ad_image_url"];
    if ([[url substringToIndex:4]isEqualToString:@"http"]) {
        
    }else{
        url = [ImageUrl stringByAppendingString:url];
    }
    aview.Cname =[[arrayCount objectAtIndex:indexPath.row]objectForKey:@"title"];
    aview.Cprice =[[arrayCount objectAtIndex:indexPath.row]objectForKey:@"price"];
    aview.Ctitle = [[arrayCount objectAtIndex:indexPath.row]objectForKey:@"simple_introduce"];
    aview.Cimage = url;
    aview.TeacherId = [[arrayCount objectAtIndex:indexPath.row]objectForKey:@"coacher_id"];
    aview.order_status = [[arrayCount objectAtIndex:indexPath.row]objectForKey:@"order_status"];
    //订单id
    aview.orderID = [[arrayCount objectAtIndex:indexPath.row]objectForKey:@"order_id"];
    
    [self.navigationController pushViewController:aview animated:YES];
}

//去除蒙版
- (void)removeActivity;
{
    // Easily remove the activity view:
   // [DejalBezelActivityView removeViewAnimated:YES];
}


//全部
-(void)goall{
   
   [self removeData];
    [self.allBtn setTitleColor:[UIColor brownColor] forState:UIControlStateNormal];
    [self.nopayBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.nouseBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.noreplyBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.noYet setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    self.allBtn.enabled = NO;
    self.nopayBtn.enabled = YES;
    self.noreplyBtn.enabled = YES;
    self.nouseBtn.enabled = YES;
    self.noYet.enabled = YES;
    [self animation:0];

    [self initdata];
    [self.tableview reloadData];
    //[arrayCount removeAllObjects];
}
//待付款
-(void)gonopay{
    
   [self removeData];
    [self.allBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    
    [self.nopayBtn setTitleColor:[UIColor brownColor] forState:UIControlStateNormal];
    [self.nouseBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.noreplyBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
     [self.noYet setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    self.allBtn.enabled = YES;
    self.nopayBtn.enabled = NO;
    self.noreplyBtn.enabled = YES;
    self.nouseBtn.enabled = YES;
    self.noYet.enabled = YES;
    [self animation:1];
    [self initdata:0];
    [_tableview reloadData];

}
//待上课
-(void)gonouse{
    
   [self removeData];
    [self.allBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.nopayBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.nouseBtn setTitleColor:[UIColor brownColor] forState:UIControlStateNormal];
    [self.noreplyBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
     [self.noYet setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    self.allBtn.enabled = YES;
    self.nopayBtn.enabled = YES;
    self.noreplyBtn.enabled = YES;
    self.nouseBtn.enabled = NO;
    self.noYet.enabled = YES;
    [self animation:2];
    [self initdata:1];
    [_tableview reloadData];
}

//待确认
-(void)goNoYet{
   
    [self removeData];
    [self.allBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.nopayBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.nouseBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.noreplyBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.noYet setTitleColor:[UIColor brownColor] forState:UIControlStateNormal];
    self.allBtn.enabled = YES;
    self.nopayBtn.enabled = YES;
    self.noreplyBtn.enabled = YES;
    self.nouseBtn.enabled = YES;
    self.noYet.enabled = NO;
    [self animation:3];
    [self initdata:2];
    [_tableview reloadData];
}
//    待评价
-(void)gonoreply{
    
    [self removeData];
    [self.allBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.nopayBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.nouseBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.noreplyBtn setTitleColor:[UIColor brownColor] forState:UIControlStateNormal];
     [self.noYet setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    self.allBtn.enabled = YES;
    self.nopayBtn.enabled = YES;
    self.noreplyBtn.enabled = NO;
    self.nouseBtn.enabled = YES;
    self.noYet.enabled = YES;
    [self animation:4];
   [self initdata:3];
    [_tableview reloadData];
}
-(void)removeData{
    arrayCount =   [NSMutableArray array];

}
//线条动画
- (void)animation :(int)i{
    [UIView animateWithDuration:0.2f animations:^{
        self.xianview.center = CGPointMake(SCREEN_WIDTH/5 * i + self.xianview.frame.size.width/2, self.xianview.center.y);
    } completion:^(BOOL finished) {
        
    }];
}
-(NSMutableArray *)returnData:(NSMutableArray*)dic{
    results = dic;
    arrayCount = results;
    [_tableview reloadData];
   
//    if (results == nil) {
//        _notext.text = @"您当前还没有订单哦~";
//        _notext.hidden = NO;
//    }else{
//        _notext.hidden = YES;
//    }
    return results;
}
//获取订单数据
-(void)getdata{
    [SVProgressHUD show];
    NSString *finaUrl = [MainUrl stringByAppendingString:OrderData];
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[[NSUserDefaults standardUserDefaults] objectForKey:@"userID"],@"user_id", nil];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    [manager POST:finaUrl parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSMutableDictionary *data = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
        NSLog(@"%@",data);
        if ([[data objectForKey:@"message"]isEqualToString:@"success"]) {
            NSMutableArray *Fdata = [data objectForKey:@"results"];
            [self returnData:Fdata];
            NSLog(@"^^^%@",Fdata);
        }else{
            NSLog(@"订单数据获取失败");
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
}
-(void)popView{
    
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)viewsLayout{
    _backView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 64);
    _backImage.frame = CGRectMake(0, 0, SCREEN_WIDTH, 64);
   
    //_BackBtn.frame = CGRectMake(8*PW, 35*PH, 17*PW, 21*PH);
    _backTitle.frame = CGRectMake((SCREEN_WIDTH-68)/2, _BackBtn.frame.origin.y-3, 68, 34);
   
    _backTitle.font = [UIFont systemFontOfSize:17];
    _listView.frame = CGRectMake(0, 64, SCREEN_WIDTH, 45*PH);
    
    _allBtn.frame = CGRectMake(0, 3*PH, 75*PW, 40*PH);
    _allBtn.titleLabel.font = [UIFont systemFontOfSize:15*PW];
    _nopayBtn.frame = CGRectMake(75*PW, 3*PH, 75*PW, 40*PH);
    _nopayBtn.titleLabel.font = [UIFont systemFontOfSize:15*PW];
    
    _nouseBtn.frame = CGRectMake(150*PW, 3*PH, 75*PW, 40*PH);
    _nouseBtn.titleLabel.font = [UIFont systemFontOfSize:15*PW];
    
    _noYet.frame = CGRectMake(225*PW, 3*PH, 75*PW, 40*PH);
    _noYet.titleLabel.font = [UIFont systemFontOfSize:15*PW];
    
    _noreplyBtn.frame = CGRectMake(300*PW, 3*PH, 75*PW, 40*PH);
    _noreplyBtn.titleLabel.font = [UIFont systemFontOfSize:15*PW];
    _xianview.frame = CGRectMake(0, 43*PH, 75*PW, 2*PH);
    _notext.frame = CGRectMake(105*PW, 300*PH, 164*PW, 21*PH);
    _tableview.frame = CGRectMake(0, 109*PH, SCREEN_WIDTH, 563*PH);
    
}
@end
