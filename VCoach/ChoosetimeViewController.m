
//
//  ChoosetimeViewController.m
//  VCoach
//
//  Created by apple on 15/5/22.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ChoosetimeViewController.h"
#import "PayresultViewController.h"
#import "cell.h"
#import "VTeacher.pch"
#import "JSONKit.h"

@interface ChoosetimeViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UITextFieldDelegate>{

    NSMutableArray *buyarray;
    NSString *schedule_id;
    NSMutableArray *TodayArray;
    NSMutableArray *TomorrowArray;
    NSMutableArray *TheDayAfterTomorrowArray;
    NSMutableArray *ThreeDaysArray;

    NSArray *timeArray;
    
    UILabel *lable;
    
    
    
    NSString *time_zone;//预约时段
   // NSString *Fschedule_id;//日程id
//    NSString *buy_sum;//购买数量
//    NSString *address_id;//地址id
//    NSString *coacher_id;//教练id
//    NSString *class_id;//课程id
    NSString *user_id;//用户id
    NSString *orderNumber;//订单号
}

@end

@implementation ChoosetimeViewController

-(void)viewWillAppear:(BOOL)animated{
    NSThread *thred = [[NSThread  alloc]initWithTarget:self selector:@selector(today) object:nil];
    [thred start];
    [self ayOutss];
}
- (void)viewDidLoad {
     [super viewDidLoad];
    _InGoNext.enabled = NO;
    
    [self layOutViews];
     //[self getTeacherTime:[self getData:0]];
    
    NSLog(@"教练ID = %@  %@",_JliD,_DindanShu);
    _colle.delegate = self;
    _colle.dataSource = self;
    _colle.scrollEnabled = NO;
    
    [_colle registerNib:[UINib nibWithNibName:@"cell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
    _colle.backgroundColor = [UIColor whiteColor];
    
    timeArray = [NSArray arrayWithObjects:@"10:00",@"11:00",@"12:00",@"13:00",@"14:00",@"15:00",@"16:00",@"17:00",@"18:00",@"19:00",@"20:00",@"21:00", nil];
    
    
   
    [self.realback addTarget:self action:@selector(popView) forControlEvents:UIControlEventTouchDown];

    [self.qianbaoButton addTarget:self action:@selector(walletpay) forControlEvents:UIControlEventTouchDown];
    [self.ZFB addTarget:self action:@selector(ZFBpay) forControlEvents:UIControlEventTouchDown];
    [self.tijiao addTarget:self action:@selector(Tijiao) forControlEvents:UIControlEventTouchDown];
    
//    self.payview.layer.cornerRadius = 10;
//    [[self.payview layer] setBorderWidth:1];
//    [[self.payview layer] setBorderColor:[UIColor whiteColor].CGColor];
    //今天
    [_Today addTarget:self action:@selector(today) forControlEvents:UIControlEventTouchDown];
  //明天
    [_Tomorrow addTarget:self action:@selector(tommorrow) forControlEvents:UIControlEventTouchDown];
    //后天
    [_houTian addTarget:self action:@selector(TheDayAfterTomorrow) forControlEvents:UIControlEventTouchDown];
    //大后天
    [_FinaDay addTarget:self action:@selector(FinaDays) forControlEvents:UIControlEventTouchDown];

    //输入密码框
    [_InGoNext addTarget:self action:@selector(payMoney) forControlEvents:UIControlEventTouchDown];
    _IntextFiled.delegate = self;
    [_IntextFiled addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)data:(NSMutableDictionary*)arr{
    buyarray = [arr objectForKey:@"schedule_status"];
    schedule_id = [arr objectForKey:@"schedule_id"];
    
}
-(void)today{
    NSString*wlzt=[[NSUserDefaults standardUserDefaults]stringForKey:@"WLZT"];
    if ([wlzt isEqualToString:@"no_net"]) {
        UIAlertView *ba = [[UIAlertView alloc]initWithTitle:@"蜂窝移动数据已关闭" message:@"启用蜂窝移动数据或无线局域网来访问数据" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
        [ba show];
    }else{
    [self getTeacherTime:[self getData:0]];
    [_Today setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [_Tomorrow setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_houTian setTitleColor: [UIColor blackColor] forState:UIControlStateNormal];
    [_FinaDay setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _Today.enabled = NO;
    _Tomorrow.enabled = YES;
    _houTian.enabled = YES;
    _FinaDay.enabled = YES;
    }
}
-(void)tommorrow{
    NSString*wlzt=[[NSUserDefaults standardUserDefaults]stringForKey:@"WLZT"];
    if ([wlzt isEqualToString:@"no_net"]) {
        UIAlertView *ba = [[UIAlertView alloc]initWithTitle:@"蜂窝移动数据已关闭" message:@"启用蜂窝移动数据或无线局域网来访问数据" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
        [ba show];
    }else{
     [self getTeacherTime:[self getData:1]];
    [_Today setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_Tomorrow setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [_houTian setTitleColor: [UIColor blackColor] forState:UIControlStateNormal];
    [_FinaDay setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _Today.enabled = YES;
    _Tomorrow.enabled = NO;
    _houTian.enabled = YES;
    _FinaDay.enabled = YES;
    }
}
-(void)TheDayAfterTomorrow{
    NSString*wlzt=[[NSUserDefaults standardUserDefaults]stringForKey:@"WLZT"];
    if ([wlzt isEqualToString:@"no_net"]) {
        UIAlertView *ba = [[UIAlertView alloc]initWithTitle:@"蜂窝移动数据已关闭" message:@"启用蜂窝移动数据或无线局域网来访问数据" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
        [ba show];
    }else{
     [self getTeacherTime:[self getData:2]];
    [_Today setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_Tomorrow setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_houTian setTitleColor: [UIColor redColor] forState:UIControlStateNormal];
    [_FinaDay setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _Today.enabled = YES;
    _Tomorrow.enabled = YES;
    _houTian.enabled = NO;
    _FinaDay.enabled = YES;
    }
}
-(void)FinaDays{
    NSString*wlzt=[[NSUserDefaults standardUserDefaults]stringForKey:@"WLZT"];
    if ([wlzt isEqualToString:@"no_net"]) {
        UIAlertView *ba = [[UIAlertView alloc]initWithTitle:@"蜂窝移动数据已关闭" message:@"启用蜂窝移动数据或无线局域网来访问数据" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
        [ba show];
    }else{
    [self getTeacherTime:[self getData:3]];
    [_Today setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_Tomorrow setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_houTian setTitleColor: [UIColor blackColor] forState:UIControlStateNormal];
    [_FinaDay setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    _Today.enabled = YES;
    _Tomorrow.enabled = YES;
    _houTian.enabled = YES;
    _FinaDay.enabled = NO;
    }
}
-(NSString*)getData:(NSInteger)day{
   
    
    NSInteger dis = day; //前后的天数
    
    NSDate*nowDate = [NSDate date];
    NSDate* theDate;
    NSTimeInterval oneDay;
    if(dis!=0)
    {
         oneDay = 24*60*60*1;  //1天的长度
        
        theDate = [nowDate initWithTimeIntervalSinceNow: oneDay*dis ];
        //or
        theDate = [nowDate initWithTimeIntervalSinceNow: oneDay*dis ];
    }
    else
    {
        theDate = nowDate;
    }
    
    theDate = [nowDate initWithTimeIntervalSinceNow:oneDay*dis];

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *ser = [dateFormatter stringFromDate:theDate];
    NSLog(@"%@",ser);
   
    return ser;
}
-(void)getTeacherTime:(NSString *)time{
    [SVProgressHUD show];
        NSString *finaUrl = [MainUrl stringByAppendingString:teacherTime];
        NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:_JliD,@"coacher_id",time,@"book_date", nil];
    
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
        [manager POST:finaUrl parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSMutableDictionary *data = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
            if ([[data objectForKey:@"message"]isEqualToString:@"success"]) {
                NSMutableDictionary *we = [data objectForKey:@"results"];
                [self data:we];
                [_colle reloadData];
                
            }else{
    
                NSLog(@"教练可预约时间获取失败");
            }
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            //NSLog(@"%@",error);
        }];

}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return  CGSizeMake((SCREEN_WIDTH-(6*PW))/4, 54*PH);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 1;
}
//纵向间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return buyarray.count;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
     static NSString *ide = @"cell";
    cell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ide forIndexPath:indexPath];
    
    [cell set:0];
    
   cell. lable.text = [timeArray objectAtIndex:indexPath.row];
   cell. lable.textAlignment = NSTextAlignmentCenter;
   
   cell. lable.textColor = [UIColor whiteColor];
   cell. lable.tag = [[buyarray objectAtIndex:indexPath.row] integerValue];
    
    if (cell.lable.tag == 1 || cell.lable.tag == 2) {
        cell.lable.backgroundColor= [UIColor whiteColor];
        cell.lable.textColor = [UIColor blackColor];
        cell.selected = NO;

    }else{
       cell.lable.backgroundColor = [UIColor clearColor];
        
        cell.selected = YES;

    }
   // cell.frame =CGRectMake(0, 0, 93*PW, 54*PH);
   // cell.lable.frame = CGRectMake(0, 0, 93*PW, 54*PH);
    cell.lable.textAlignment = NSTextAlignmentCenter;
    cell.lable.font = [UIFont systemFontOfSize:17*PW];
    [SVProgressHUD dismiss];
    
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%@",[buyarray objectAtIndex:indexPath.row]);
    if ([[buyarray objectAtIndex:indexPath.row]isEqualToString:@"1"]||[[buyarray objectAtIndex:indexPath.row]isEqualToString:@"2"]) {
        
    }else{
        cell *cc = (cell*)[collectionView cellForItemAtIndexPath:indexPath];
        [cc set:1];
        NSLog(@"%@",cc.lable.text);
        int time =(int)indexPath.row+10;
        time_zone =[NSString stringWithFormat:@"%d",time]; NSLog(@"时间为 %@",time_zone);
    }
}
//-(void)updateCollectionViewCellStatus:(cell *)myCollectionCell selected:(BOOL)selected
//{
//    myCollectionCell.backgroundColor = selected?[UIColor brownColor]:[UIColor colorWithRed:1.000f green:0.678f blue:0.518f alpha:1.00f];
//
//
//}
//提交
-(void)Tijiao{
    NSString*wlzt=[[NSUserDefaults standardUserDefaults]stringForKey:@"WLZT"];
    if ([wlzt isEqualToString:@"no_net"]) {
        UIAlertView *ba = [[UIAlertView alloc]initWithTitle:@"蜂窝移动数据已关闭" message:@"启用蜂窝移动数据或无线局域网来访问数据" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
        [ba show];
    }else{
    [self unPayyet];
    // 先写入未付款订单
    if (time_zone.length == 0) {
     //字段有误
    }else{
    
    _inputPasswordView.hidden = YES;
    user_id = [[NSUserDefaults standardUserDefaults]objectForKey:@"userID"];
    NSLog(@"%@    %@    %@   %@   %@  %@  %@",_JliD,_DindanShu,_dizhiID,user_id,_clsaaID,schedule_id,time_zone);
    
    if (time_zone.length == 0) {
        UIAlertView *ale = [[UIAlertView alloc]initWithTitle:@"提示" message:@"好像忘了点什么~~~" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [ale show];
    }else{
        _payView.hidden = NO;
      }
    }
  }
}
-(void)walletpay{
    _InMoney.text = _price;
    _inputPasswordView.hidden = NO;
    [_IntextFiled becomeFirstResponder];
    
    
    
}


-(void)popView{
    
    [self.navigationController popViewControllerAnimated:YES];
}


//支付宝支付

-(void)ZFBpay{
    
  NSLog(@" 教练ID=%@ 订单数为=%@ 地址ID为=%@ 用户ID为=%@课程ID为=%@ 行程ID%@预约时间%@",_JliD,_DindanShu,_dizhiID,user_id,_clsaaID,schedule_id,time_zone);
   NSString *jiage = _price;
    NSString *alipayPartner = partnerr;
    NSString *alipaySeller = sellerr;
    NSString *alipayPrivateKey = privateKeyy;
    
    
    if ([alipayPartner length] == 0||[alipayPrivateKey length] == 0||[alipaySeller length] == 0) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"缺少partner或者seller或者私钥。" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
        return;
    }
    //生成订单信息及签名
    Order *order = [[Order alloc]init];
    order.partner = alipayPartner;
    order.seller = alipaySeller;
    order.tradeNO = orderNumber;//订单ID
    NSLog(@"&&&&&&&& %@",order.tradeNO);
    order.productName = @"课程";//商品标题
    order.productDescription = @"qwer";//商品描述
    order.amount = [NSString stringWithFormat:@"%@",jiage]; //商品价格
//  order.notifyURL =  @"http://www.baidu.com"; //回调URL
   
    order.service = @"mobile.securitypay.pay";
    order.paymentType = @"1";
    order.inputCharset = @"utf-8";
    order.itBPay = @"30m";
    order.showUrl = @"m.alipay.com";
  
    //应用注册scheme,在Info.plist定义URL types
    NSString *appScheme = @"myAlipay";

    //将商品信息拼接成字符串
    NSString *orderSpec = [order description];
    NSLog(@"orderSpec = %@",orderSpec);
    
    //获取私钥并将商户信息签名,外部商户可以根据情况存放私钥和签名,只需要遵循RSA签名规范,并将签名字符串base64编码和UrlEncode
    id<DataSigner> signer = CreateRSADataSigner(alipayPrivateKey);
    NSString *signedString = [signer signString:orderSpec];
    //将签名成功字符串格式化为订单字符串,请严格按照该格式
    NSString *orderString = nil;
    if (signedString != nil) {
        orderString = [NSString stringWithFormat:@"%@&sign=\"%@\"&sign_type=\"%@\"",
                       orderSpec, signedString, @"RSA"];
        
        [[AlipaySDK defaultService] payOrder:orderString fromScheme:appScheme callback:^(NSDictionary *resultDic) {
            NSLog(@"reslut == %@",resultDic);
        }];
    }

}

- (void) textFieldDidChange:(id) sender
{
    _filed = (UITextField*)sender;
    _filed.delegate = self;
    switch (_filed.text.length) {
        case 0:
            _view11.hidden = YES;
            _view22.hidden = YES;
            _view33.hidden = YES;
            _view44.hidden = YES;
            _view55.hidden = YES;
            _view66.hidden = YES;
            break;
        case 1:
            _view11.hidden = NO;
            _view22.hidden = YES;
            _view33.hidden = YES;
            _view44.hidden = YES;
            _view55.hidden = YES;
            _view66.hidden = YES;
            break;
        case 2:
            _view11.hidden = NO;
            _view22.hidden = NO;
            _view33.hidden = YES;
            _view44.hidden = YES;
            _view55.hidden = YES;
            _view66.hidden = YES;
            break;
        case 3:
            _view11.hidden = NO;
            _view22.hidden = NO;
            _view33.hidden = NO;
            _view44.hidden = YES;
            _view55.hidden = YES;
            _view66.hidden = YES;
            break;
        case 4:
            _view11.hidden = NO;
            _view22.hidden = NO;
            _view33.hidden = NO;
            _view44.hidden = NO;
            _view55.hidden = YES;
            _view66.hidden = YES;
            break;
        case 5:
            _view11.hidden = NO;
            _view22.hidden = NO;
            _view33.hidden = NO;
            _view44.hidden = NO;
            _view55.hidden = NO;
            _view66.hidden = YES;
            break;
        case 6:
            _view11.hidden = NO;
            _view22.hidden = NO;
            _view33.hidden = NO;
            _view44.hidden = NO;
            _view55.hidden = NO;
            _view66.hidden = NO;
            break;
        default:
            break;
    }
    
    if (_filed.text.length == 6) {
        NSLog(@"%@",_filed.text);
        _InGoNext.enabled = YES;
    }
    
}
-(void)ayOutss{
    _view1.layer.borderWidth = 1;
     _view2.layer.borderWidth = 1;
     _view3.layer.borderWidth = 1;
     _view4.layer.borderWidth = 1;
     _view5.layer.borderWidth = 1;
     _view6.layer.borderWidth = 1;
    _view1.layer.borderColor = [[UIColor lightGrayColor]CGColor];
     _view2.layer.borderColor = [[UIColor lightGrayColor]CGColor];
     _view3.layer.borderColor = [[UIColor lightGrayColor]CGColor];
     _view4.layer.borderColor = [[UIColor lightGrayColor]CGColor];
     _view5.layer.borderColor = [[UIColor lightGrayColor]CGColor];
     _view6.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    
    _view11.layer.masksToBounds = YES;
    _view22.layer.masksToBounds = YES;
    _view33.layer.masksToBounds = YES;
    _view44.layer.masksToBounds = YES;
    _view55.layer.masksToBounds = YES;
    _view66.layer.masksToBounds = YES;
    _view11.layer.cornerRadius = _view11.frame.size.width/2;
     _view22.layer.cornerRadius = _view22.frame.size.width/2;
     _view33.layer.cornerRadius = _view33.frame.size.width/2;
     _view44.layer.cornerRadius = _view44.frame.size.width/2;
     _view55.layer.cornerRadius = _view55.frame.size.width/2;
     _view66.layer.cornerRadius = _view66.frame.size.width/2;
    
    _view11.hidden = YES;
    _view22.hidden = YES;
    _view33.hidden = YES;
    _view44.hidden = YES;
    _view55.hidden = YES;
    _view66.hidden = YES;
}
//钱包付款 密码检查
-(void)payMoney{
    NSString *finaUrl = [MainUrl stringByAppendingString:CHECKMI];
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[[NSUserDefaults standardUserDefaults]objectForKey:@"userID"],@"user_id",_filed.text,@"password", nil];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    [manager POST:finaUrl parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSMutableDictionary *data = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
        if ([[data objectForKey:@"message"]isEqualToString:@"success"]) {
         //[self unPayyet];
            [self fuLuan];
        
        }else{
            UIAlertView *lae = [[UIAlertView alloc]initWithTitle:@"提示" message:@"密码有误" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [lae show];
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];

}
//余额付款
-(void)fuLuan{
   
    NSString *finaUrl = [MainUrl stringByAppendingString:@"index.php/api/put/pay_with_remaining_balance"];
   
    NSString*se = @"[";
    NSString *sw = [se stringByAppendingString:orderNumber];
    NSString *fin = [sw stringByAppendingString:@"]"];
   NSLog(@"11234  %@",fin);
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[[NSUserDefaults standardUserDefaults]objectForKey:@"userID"],@"user_id",fin,@"order_id_json_array_str", nil];
    NSLog(@"%@",dic);
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    [manager POST:finaUrl parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSMutableDictionary *data = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
        if ([[data objectForKey:@"message"]isEqualToString:@"success"]) {
            PayresultViewController *Buysuccess = [[PayresultViewController alloc]initWithNibName:@"PayresultViewController" bundle:nil];
            Buysuccess.orderName = orderNumber;
            Buysuccess.payresultLable1 = @"支付成功";
            Buysuccess.lable11 = @"教练会尽快跟你联系~";
            Buysuccess.hidden = NO;
            [self.navigationController pushViewController:Buysuccess animated:YES];
        }else{
            PayresultViewController *Buynosuccess = [[PayresultViewController alloc]initWithNibName:@"PayresultViewController" bundle:nil];
           Buynosuccess.payresultLable1 = @"支付失败";
            Buynosuccess.lable11 = @"请稍后再试";
            Buynosuccess.hidden = YES;
            [self.navigationController pushViewController:Buynosuccess animated:YES];             NSLog(@"%@",[data objectForKey:@"message"]);
            NSLog(@"提交订单失败");
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
    
}
//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    _payView.hidden = YES;
//    
//    NSLog(@"%@    %@    %@   %@   %@  %@  %@",_JliD,_DindanShu,_dizhiID,user_id,_clsaaID,schedule_id,time_zone);
//    if (time_zone.length == 0) {
//        
//    }else{
//        //写入未付款名单
//        
//    }
//    [_IntextFiled resignFirstResponder];
//    _inputPasswordView.hidden = YES;
//    
//}
-(void)returnOrderNumber:(NSArray*)num{
    orderNumber = [num objectAtIndex:0];
    NSLog(@"订单号：%@",orderNumber);

   
}
//写入未付款订单
-(void)unPayyet{
    NSString *finaUrl = [MainUrl stringByAppendingString:unPay];
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[[NSUserDefaults standardUserDefaults] objectForKey:@"userID"],@"user_id",_clsaaID,@"class_id",_JliD,@"coacher_id",_dizhiID,@"address_id",_DindanShu,@"buy_sum",schedule_id,@"schedule_id",time_zone,@"time_zone", nil];
    NSLog(@"%@",dic);
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    [manager POST:finaUrl parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSMutableDictionary *data = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
        if ([[data objectForKey:@"message"]isEqualToString:@"success"]) {
            [self returnOrderNumber:[data objectForKey:@"results"]];
           
        }else{
            NSLog(@"写入未付款订单失败");
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
    
    
}
-(void)layOutViews{
    [_Today setTitle:@"今天" forState:UIControlStateNormal];
    [_Tomorrow setTitle:@"明天" forState:UIControlStateNormal];
    [_houTian setTitle:@"后天" forState:UIControlStateNormal];
    [_FinaDay setTitle:[self getData:3] forState:UIControlStateNormal];
    _Today.titleLabel.textAlignment = NSTextAlignmentCenter;
    _Tomorrow.titleLabel.textAlignment = NSTextAlignmentCenter;
    _houTian.titleLabel.textAlignment = NSTextAlignmentCenter;
    _FinaDay.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    _Today.titleLabel.font = [UIFont systemFontOfSize:15];
    _Tomorrow.titleLabel.font = [UIFont systemFontOfSize:15];
    _houTian.titleLabel.font = [UIFont systemFontOfSize:15];
    _FinaDay.titleLabel.font = [UIFont systemFontOfSize:15];
    
    [_Today setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [_Tomorrow setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_houTian setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_FinaDay setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    _DView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 64);
    _DVimage.frame = CGRectMake(0, 0, SCREEN_WIDTH, 64);
    _DVTitle.frame = CGRectMake((SCREEN_WIDTH-68)/2, _BackBtn.frame.origin.y-3, 68,34);
    _DVTitle.font = [UIFont systemFontOfSize:17];
    //_BackBtn.frame= CGRectMake(14, 27, 17, 27);
    
    _llable.frame = CGRectMake(11*PW, 74*PH, 118*PW, 21*PH);
    _llable.font = [UIFont systemFontOfSize:14*PW];
    _daysTopView.frame = CGRectMake(0, 112*PH, SCREEN_WIDTH, 46*PH);
    _daysTopLine.frame = CGRectMake(0, 44*PH, SCREEN_WIDTH, 1);
    _Today.frame = CGRectMake(0, 4*PH, 93*PW, 40*PH);
    _Today.titleLabel.font = [UIFont systemFontOfSize:15*PW];
    _Tomorrow.frame = CGRectMake(95*PW, 4*PH, 93*PW, 40*PH);
    _Tomorrow.titleLabel.font = [UIFont systemFontOfSize:15*PW];
    
    _houTian.frame = CGRectMake(189*PW, 4*PH, 93*PW, 40*PH);
    _houTian.titleLabel.font = [UIFont systemFontOfSize:15*PW];
    
    _FinaDay.frame = CGRectMake(283*PW, 4*PH, 93*PW, 40*PH);
    _FinaDay.titleLabel.font = [UIFont systemFontOfSize:15*PW];
    
    _colle.frame = CGRectMake(0, 159*PH, SCREEN_WIDTH, 197*PH);
    
    _TiL1.frame = CGRectMake(55*PW, 374*PH, 51*PW, 21*PH);
    _TiL1.font = [UIFont systemFontOfSize:14*PW];
    _TiV1.frame = CGRectMake(23*PW, 375*PH, 18*PW, 18*PW);
    
    _TiV2.frame = CGRectMake(23*PW, 401*PH, 18*PW, 18*PW);
    _TiL2.frame = CGRectMake(55*PW, 401*PH, 56*PW, 21*PH);
    _TiL2.font = [UIFont systemFontOfSize:14*PW];
    
    _tijiao.frame = CGRectMake(88*PW, 452*PH, 219*PW, 35*PH);
    _tijiao.titleLabel.font = [UIFont systemFontOfSize:17*PW];
//    _tijiao.backgroundColor = [UIColor redColor];
    
    _payView.frame = CGRectMake(69*PW, 281*PH, 240*PW, 111*PH);
    _qianbaoImage.frame = CGRectMake(44*PW, 22*PH, 29*PW, 25*PH);
    _qianbaoButton.frame = CGRectMake(81*PW, 20*PH, 107*PW, 30*PH);
    _qianbaoButton.titleLabel.font = [UIFont systemFontOfSize:13*PW];
    _line.frame = CGRectMake(0, 55*PH, 240*PW, 2*PH);
    
    _ZFB.frame = CGRectMake(81*PW, 63*PH, 107*PW, 30*PH);
    _ZFB.titleLabel.font = [UIFont systemFontOfSize:13*PW];
    _ZFBImage.frame = CGRectMake(44*PW, 65*PH, 25*PW, 25*PH);
    
    _inputPasswordView.frame = CGRectMake(-4*PW, -58*PH, 249*PW, 197*PH);
    _Inlable.frame = CGRectMake(51*PW, 5*PH, 146*PW, 31*PH);
    _Inlable.font = [UIFont systemFontOfSize:14*PW];
    
    _Inline.frame = CGRectMake(0, 41*PH, 249*PW, 1);
    _InMonLable.frame = CGRectMake(96*PW, 50*PH, 56*PW, 30*PH);
    _InMonLable.font = [UIFont systemFontOfSize:17*PW];
    
    _InMoney.frame = CGRectMake(81*PW, 76*PH, 87*PW, 23*PH);
    _InMoney.font = [UIFont systemFontOfSize:14*PW];
    
    _view1.frame = CGRectMake(5*PW,99*PH, 33*PW, 33*PW);
    _IntextFiled.frame = CGRectMake(12*PW, 10*PH, 5*PW, 16*PH);
    _view11.frame = CGRectMake(6*PW, 7*PH, 20*PW, 20*PW);
    _view2.frame = CGRectMake(46*PW, 99*PH, 33*PW, 33*PW);
    _view22.frame = CGRectMake(6*PW, 7*PH, 20*PW, 20*PW);
    
    _view3.frame = CGRectMake(87*PW, 99*PH, 33*PW, 33*PW);
    _view33.frame = CGRectMake(6*PW, 7*PH, 20*PW, 20*PW);
    
    _view4.frame = CGRectMake(126*PW, 99*PH, 33*PW, 33*PW);
    _view44.frame = CGRectMake(6*PW, 7*PH, 20*PW, 20*PW);
    
    _view5.frame = CGRectMake(167*PW, 99*PH, 33*PW, 33*PW);
    _view55.frame = CGRectMake(6*PW, 7*PH, 20*PW, 20*PW);
    
    _view6.frame = CGRectMake(208*PW, 99*PH, 33*PW, 33*PW);
    _view66.frame = CGRectMake(6*PW, 7*PH, 20*PW, 20*PW);
    
    _InGoNext.frame = CGRectMake(58*PW, 140*PH, 132*PW, 38*PH);
    _InImage.frame = CGRectMake(10*PW, 5*PH, 33*PW, 33*PW);
    
    
 }
-(void)viewDidAppear:(BOOL)animated{
    [SVProgressHUD dismiss];
}
@end
