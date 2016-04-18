//
//  ChooseadressViewController.m
//  VCoach
//
//  Created by apple on 15/5/7.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ChooseadressViewController.h"
#import "choosecoachViewController.h"
#import "AddaddressViewController.h"
#import "Addressstatus.h"
#import "AddressViewCell.h"
#import "PostClass.h"
#import "Constants.h"
#import "VTeacher.pch"
#import "choosecoachViewController.h"
#import "ChoosetimeViewController.h"
@interface ChooseadressViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    
    NSMutableArray *_statuss;
    NSString *address_id;
    
    NSString *provinceIDD;
    NSString *cityIDD;
    NSString *areaIDD;
    NSString *provinceNamee;
    NSString *cityNamee;
    NSString *areaNamee;
    
}

@end
static int i = 1;
@implementation ChooseadressViewController
-(void)viewWillAppear:(BOOL)animated{
    
    self.tabBarController.tabBar.hidden = YES;
    NSThread *thre = [[NSThread alloc]initWithTarget:self selector:@selector(geetData) object:nil];
    [thre start];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self viewsLayouts];
    
    _delect.hidden = YES;
    _gonext.hidden = NO;
    
    UITapGestureRecognizer *backViewTouch = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(backVie)];
    [_backView addGestureRecognizer:backViewTouch];
    
    [self.realBack addTarget:self action:@selector(popViewv) forControlEvents:UIControlEventTouchDown];
    [self.bianji addTarget:self action:@selector(bian) forControlEvents:UIControlEventTouchDown];
    [self.gonext addTarget:self action:@selector(gochoosecoach) forControlEvents:UIControlEventTouchDown];
    
    [self.delect addTarget:self action:@selector(delectAdress) forControlEvents:UIControlEventTouchDown];
    [self.addaddress addTarget:self action:@selector(goaddaddress) forControlEvents:UIControlEventTouchDown];
//    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"AddressViewCell" owner:self options:nil];
   // UIView* view = [nib objectAtIndex:0];
    
//    self.tableview.frame = CGRectMake(self.tableview.frame.origin.x, 105, SCREEN_WIDTH, view.frame.size.height * 5);
    _tableview.delegate = self;
    _tableview.dataSource = self;
    _statuss = [NSMutableArray array];
  
   // [self getData: [[NSUserDefaults standardUserDefaults]objectForKey:@"userID"]];
   
  

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


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//添加新地址
-(void)backVie{
    [self goaddaddress];
}
- (void)goaddaddress{

    AddaddressViewController *view = [[AddaddressViewController alloc]initWithNibName:@"AddaddressViewController" bundle:nil];
    [self.navigationController pushViewController:view animated:YES];


}

-(void)gochoosecoach{

    if ([_whereGo isEqualToString:@"A"]) {
        choosecoachViewController *AView = [[choosecoachViewController alloc]initWithNibName:@"choosecoachViewController" bundle:nil];
        AView.kCid = _KID;
        AView.dIngdS = _buy_num;
        AView.adressId = address_id;
        AView.jAge = _jiage;
    NSLog(@"A 课程ID%@ 订单数%@ 地址ID%@ 价格%@",_KID,_buy_num,address_id,_jiage);
        [self.navigationController pushViewController:AView animated:YES];
    }else if ([_whereGo isEqualToString:@"B"]){
        ChoosetimeViewController *BView = [[ChoosetimeViewController alloc  ]initWithNibName:@"ChoosetimeViewController" bundle:nil];
        BView.JliD = _JlId;
        BView.DindanShu = _buy_num;
        BView.dizhiID = address_id;
        BView.clsaaID = _KID;
        BView.price = _jiage;
        NSLog(@"B 课程ID%@ 订单数%@ 地址ID%@ 教练ID %@ 价格 %@",_KID,_buy_num,address_id,_JlId,_jiage);
        [self.navigationController pushViewController:BView animated:YES];
    }
    

}
-(void)popViewv{
    
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma tableviewDatasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_statuss count];
}

//cell的数据源
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    AddressViewCell *Cell = [tableView dequeueReusableCellWithIdentifier:@"AddressViewCell"];
    if (Cell == nil) {
        Cell = [[[NSBundle mainBundle]loadNibNamed:@"AddressViewCell" owner:self options:nil]lastObject];
    }
    [Cell ser:1];
    if (indexPath.row == 0) {
        Cell.morenimg.hidden = NO;
    }else{
        Cell.morenimg.hidden = YES;
    }
    Cell.username.text = [[_statuss objectAtIndex:indexPath.row]objectForKey:@"recieve_name"];
    Cell.phone.text = [[_statuss objectAtIndex:indexPath.row]objectForKey:@"recieve_phone"];
    NSString *arr1 =[[_statuss objectAtIndex:indexPath.row]objectForKey:@"recieve_province"];
    NSString *arr2 =[[_statuss objectAtIndex:indexPath.row]objectForKey:@"recieve_city"];
     NSString *arr3 =[[_statuss objectAtIndex:indexPath.row]objectForKey:@"recieve_area"];
     NSString *arr4 =[[_statuss objectAtIndex:indexPath.row]objectForKey:@"recieve_detail_address"];
    NSString *arr5 = [NSString stringWithFormat:@"%@%@%@%@",arr1,arr2,arr3,arr4];
    Cell.address.text = arr5;
    
     [SVProgressHUD dismiss];
    return Cell;
   
}


#pragma mark TableView Delegate Methods
//获取cell的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 75*PH;
}


//cell跳转页面
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    address_id = [[_statuss objectAtIndex:indexPath.row]objectForKey:@"address_id"];
    if ([_typeAd isEqualToString:@"W"]) {
        //_gonext.hidden = YES;
    }else{
        if (_delect.hidden == NO) {
            
        }else{
            AddaddressViewController *view = [[AddaddressViewController alloc]initWithNibName:@"AddaddressViewController" bundle:nil];
            view.provinceDM = [[_statuss objectAtIndex:indexPath.row]objectForKey:@"province_id"];
            view.cityDM = [[_statuss objectAtIndex:indexPath.row]objectForKey:@"city_id"];
            view.areraDM = [[_statuss objectAtIndex:indexPath.row]objectForKey:@"area_id"];
            view.provinceN = [[_statuss objectAtIndex:indexPath.row]objectForKey:@"recieve_province"];
            if ([[[_statuss objectAtIndex:indexPath.row]objectForKey:@"recieve_city"] isKindOfClass:[NSNull class]]) {
                view.cityN = @"";
            }else{
                view.cityN = [[_statuss objectAtIndex:indexPath.row]objectForKey:@"recieve_city"];
            }
            view.areaN = [[_statuss objectAtIndex:indexPath.row]objectForKey:@"recieve_area"];
            view.jieN = [[_statuss objectAtIndex:indexPath.row]objectForKey:@"recieve_detail_address"];
            view.phoneN = [[_statuss objectAtIndex:indexPath.row]objectForKey:@"recieve_phone"];
            view.peopleN = [[_statuss objectAtIndex:indexPath.row]objectForKey:@"recieve_name"];
            view.adrssID = [[_statuss objectAtIndex:indexPath.row]objectForKey:@"address_id"];
            
            [self.navigationController pushViewController:view animated:YES];
        }
        
    }
    
   // return;
}

-(void)geetData{
    [SVProgressHUD show];
    NSString *finaurl = [MainUrl stringByAppendingString:userAddress];
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys: [[NSUserDefaults standardUserDefaults]objectForKey:@"userID"],@"user_id", nil];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    [manager POST:finaurl parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSMutableDictionary *data = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
        if ([[data objectForKey:@"message"]isEqualToString:@"success"]) {
            _statuss = [data objectForKey:@"results"];
            _tableview.frame = CGRectMake(0, 106*PH, SCREEN_WIDTH, _statuss.count*75*PH);
            [_tableview reloadData];
        }else{
            NSLog(@"用户地址获取失败");
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
}
-(void)bian{
    ++i;
    if (i%2 == 0) {
        _delect.hidden = NO;
        _gonext.hidden = YES;
    }else{
        _delect.hidden = YES;
        _gonext.hidden = NO;
    }
    
}
-(void)delectAdress{
    NSString *finaurl = [MainUrl stringByAppendingString:delectAd];
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[[NSUserDefaults standardUserDefaults] objectForKey:@"userID"],@"user_id",address_id,@"address_id", nil];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    [manager POST:finaurl parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSMutableDictionary *data = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
        if ([[data objectForKey:@"message"]isEqualToString:@"success"]) {
            UIAlertView *ale = [[UIAlertView alloc]initWithTitle:@"提示" message:@"删除成功" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [ale show];
            [self geetData];
            _delect.hidden = YES;
            _gonext.hidden = NO;
        }else{
            NSLog(@"删除上门地址失败");
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];

}

-(void)viewsLayouts{
    _topView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 64);
    _topImage.frame = CGRectMake(0, 0, SCREEN_WIDTH, 64);  _BackBtn.frame = CGRectMake(16, 30, 14, 27);
    _topLable.frame = CGRectMake((SCREEN_WIDTH-68)/2, _BackBtn.frame.origin.y-3, 68, 34);
    _topLable.font = [UIFont systemFontOfSize:17];
    
  
    
    _bianji.frame = CGRectMake(SCREEN_WIDTH-60, _BackBtn.frame.origin.y-3, 50, 34);
    
    _bianji.titleLabel.font = [UIFont systemFontOfSize:17];
   
    _view1.frame = CGRectMake(0, 73*PH, SCREEN_WIDTH, 32*PH);
    _view1Lable.frame = CGRectMake(14*PW, 5*PH, 68*PW, 21*PH);
    _view1Lable.font = [UIFont systemFontOfSize:14*PW];
    _addaddress.frame = CGRectMake(306*PW, 1, 60*PW, 30*PH);
    _addaddress.titleLabel.font = [UIFont systemFontOfSize:14*PW];
    _tableview.frame = CGRectMake(0, _view1.frame.origin.y+_view1.frame.size.height, SCREEN_WIDTH, 391*PH);
    _delect.frame = CGRectMake(273*PW, 559*PH, 80*PW, 30*PH);
    _gonext.frame= CGRectMake(273*PW, 559*PH, 80*PW, 30*PH);
    
    
}
-(void)viewDidAppear:(BOOL)animated{
    [SVProgressHUD dismiss];
}
@end
