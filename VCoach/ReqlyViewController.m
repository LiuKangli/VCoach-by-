//
//  ReqlyViewController.m
//  VCoach
//
//  Created by apple on 15/5/5.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ReqlyViewController.h"
#import "reqlystatus.h"
#import "ReqlyViewCell.h"
#import "DejalActivityView.h"
#import "PostClass.h"
#import "Constants.h"
#import "VTeacher.pch"
@interface ReqlyViewController ()<UITableViewDataSource,UITableViewDelegate>{

    NSMutableArray *_statuss;
    NSString *finaNa;
}

@end

@implementation ReqlyViewController
-(void)viewWillAppear:(BOOL)animated{
    
   hiddenTabbar(YES)
    NSString*wlzt=[[NSUserDefaults standardUserDefaults]stringForKey:@"WLZT"];
    if ([wlzt isEqualToString:@"no_net"]) {
        UIAlertView *ba = [[UIAlertView alloc]initWithTitle:@"蜂窝移动数据已关闭" message:@"启用蜂窝移动数据或无线局域网来访问数据" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
        [ba show];
    }else{
    NSThread *thred = [[NSThread alloc]initWithTarget:self selector:@selector(initdata:) object:_classID];
    [thred start];
    _statuss = [NSMutableArray array];
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self viewsLayouts];
    _tableview.delegate =self;
    _tableview.dataSource = self;
    _tableview.bounces = NO;
    _tableview.backgroundColor = [UIColor colorWithRed:0.902f green:0.902f blue:0.902f alpha:1.00f];
    
//    [self.BackBtn addTarget:self action:@selector(popView) forControlEvents:UIControlEventTouchDown];
    //[DejalBezelActivityView activityViewForView:self.view];
    
   
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)returnData:(NSMutableArray *)arr{
    _statuss = arr;
    NSLog(@"%@",_statuss);
    [self.tableview reloadData];
    _tableview.hidden = NO;
    
}
- (void)initdata:(NSString *)class
{
    [SVProgressHUD show];
    _tableview.hidden = YES;
    NSLog(@"classId = %@",class);
    NSString *finaurl = [MainUrl stringByAppendingString:ReqlyList];
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:class,@"class_id", nil];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    [manager POST:finaurl parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSMutableDictionary *data =[ NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
        if ([[data objectForKey:@"message"]isEqualToString:@"success"]) {
            NSMutableArray *finaData = [data objectForKey:@"results"];
            [self returnData:finaData];
            NSLog(@"ok");
        }else{
            NSLog(@"评论列表获取失败");
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
}
//根据屏幕宽度选择对应的cell xib
//-(NSArray*)getnibViewName:(NSString*)str
//{
//    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
//    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:str owner:self options:nil];
//    NSMutableArray* arr = [NSMutableArray array];
//    for (UIView* view in nib) {
//        if (screenSize.width == view.frame.size.width) {
//            [arr addObject:view];
//        }
//    }
//    return arr;
//}



#pragma tableviewDatasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_statuss count];
}

//cell的数据源
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ReqlyViewCell *Cell = [tableView dequeueReusableCellWithIdentifier:@"ReqlyViewCell"];
    
    if (Cell == nil) {
        Cell = [[[NSBundle mainBundle]loadNibNamed:@"ReqlyViewCell" owner:self options:nil] lastObject];
      
    }
    if ([[[_statuss objectAtIndex:indexPath.row]objectForKey:@"user_nickname"] isKindOfClass:[NSNull class]]) {
         finaNa = @"(";
    }else{
        NSString *name = [[_statuss objectAtIndex:indexPath.row]objectForKey:@"user_nickname"];
        NSInteger length =  name.length;
        
        NSString *nana = [name stringByReplacingCharactersInRange:NSMakeRange(0,length-(0+1)) withString:@"*"];
       finaNa = [nana stringByAppendingString:@"("];
    }
    NSString *phone = [[_statuss objectAtIndex:indexPath.row]objectForKey:@"reply_user_phone"];
    NSString *tel = [phone stringByReplacingCharactersInRange:NSMakeRange(3, 4) withString:@"****"];
    NSString *finatel = [tel stringByAppendingString:@")"];
    
    
    if ([[[_statuss objectAtIndex:indexPath.row]objectForKey:@"reply_point"]isEqualToString:@"1"]) {
        Cell.goodOrBad.image = [UIImage imageNamed:@""];
        Cell.pinjia.text = @"差评";
    }else if ([[[_statuss objectAtIndex:indexPath.row]objectForKey:@"reply_point"]isEqualToString:@"2"]){
        Cell.goodOrBad.image = [UIImage imageNamed:@""];
        Cell.pinjia.text = @"好评";
    }
    
    Cell.namePhone.text = [finaNa stringByAppendingString:finatel];
    
    Cell.time.text = [[_statuss objectAtIndex:indexPath.row]objectForKey:@"reply_time"];
    Cell.title.text = [[_statuss objectAtIndex:indexPath.row]objectForKey:@"reply_text"];
   // Cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSDictionary *DIC = @{NSFontAttributeName:Cell.namePhone.font};
    CGSize size = [Cell.namePhone.text sizeWithAttributes:DIC];
    
    Cell.namePhone.frame = CGRectMake(8*PW, 8*PH, size.width, size.height);
    NSDictionary *titleDic = @{NSFontAttributeName:Cell.pinjia.font};
    CGSize tltleSize = [Cell.title.text sizeWithAttributes:titleDic];
    Cell.title.frame = CGRectMake(8*PW, 36*PH, tltleSize.width, tltleSize.height);
    Cell.title.font = [UIFont systemFontOfSize:16*PW];
    Cell.title.numberOfLines = 0;
    Cell.time.frame = CGRectMake(277*PW, 63*PH, 90*PW, 21*PH);
    Cell.time.font = [UIFont systemFontOfSize:14*PW];
    Cell.pinjia.frame = CGRectMake(334*PW, 8*PH, 33*PW, 21*PH);
   // Cell.backView.hidden = YES;
    Cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [SVProgressHUD dismiss];

      return Cell;
}


#pragma mark TableView Delegate Methods
//获取cell的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  
    return 94*PH;
}


//cell跳转页面
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return;
//}

-(void)viewsLayouts{
    _backView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 64);
    _backImage.frame = CGRectMake(0, 0, SCREEN_WIDTH, 64);
    _backLable.frame = CGRectMake((SCREEN_WIDTH-62)/2, _BackBtn.frame.origin.y-3, 62, 34);
    _tableview.frame = CGRectMake(0, 64, SCREEN_WIDTH, 618*PH);
    
}
-(void)viewDidAppear:(BOOL)animated{
    [SVProgressHUD dismiss];
}
- (IBAction)backButton:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
