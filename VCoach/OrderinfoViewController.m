//
//  OrderinfoViewController.m
//  VCoach
//
//  Created by apple on 15/5/14.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "OrderinfoViewController.h"
#import "RepluyViewController.h"
#import "PostClass.h"
#import "Constants.h"
#import "VTeacher.pch"
#import "PayresultViewController.h"
@interface OrderinfoViewController ()<UITextFieldDelegate>{

    NSString *pwviewstatus;
    NSDictionary *teacherData;
    NSString *coacherID;
}

@end

@implementation OrderinfoViewController
-(void)viewWillAppear:(BOOL)animated{
    
    hiddenTabbar(YES)
    _replyBtn.hidden = YES;
    _buyIt.hidden = YES;
    NSLog(@"哈哈%@",_order_status);
    [self Porder_status:_order_status];
    
}
-(void)Porder_status:(NSString*)Kc{
    int k = [Kc intValue];
    switch (k) {
        case 0:
            _view4.hidden = YES;
            _replyview.hidden = YES;
            _payview.hidden = NO;
           
            break;
        case 1:
            _view4.hidden = NO;
            _replyview.hidden = YES;
            _payview.hidden = YES;
            _yishangke.hidden = YES;
            _yishangkeLable.hidden = YES;
            break;
        case 2:
            _view4.hidden = NO;
            _replyview.hidden = YES;
            _payview.hidden = YES;
            _yishangke.hidden = NO;
            _yishangkeLable.hidden = NO;
            _waitShangke.hidden = YES;
            break;
        case 3:
            _view4.hidden = YES;
            _payview.hidden = YES;
            _replyBtn.hidden = NO;
            _delorder.hidden = NO;
            _cancalorder.hidden = YES;
            break;
        case 4:
            _replyBtn.hidden = YES;
            _buyIt.hidden = YES;
            _view4.hidden = YES;
            
            break;
        default:
            break;
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self viewsLayouts];
    NSString*wlzt=[[NSUserDefaults standardUserDefaults]stringForKey:@"WLZT"];
    if ([wlzt isEqualToString:@"no_net"]) {
        UIAlertView *ba = [[UIAlertView alloc]initWithTitle:@"蜂窝移动数据已关闭" message:@"启用蜂窝移动数据或无线局域网来访问数据" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
        [ba show];
    }else{
    [self getTeacherData];
    }
    pwviewstatus = @"0";
    [self.realback addTarget:self action:@selector(popView) forControlEvents:UIControlEventTouchDown];
    //评价
    [self.replyBtn addTarget:self action:@selector(goreply) forControlEvents:UIControlEventTouchDown];
    //[self.seepw addTarget:self action:@selector(getpassword) forControlEvents:UIControlEventTouchDown];
    //删除
    [self.delorder addTarget:self action:@selector(del) forControlEvents:UIControlEventTouchDown];
    //付款
    [_buyIt addTarget:self action:@selector(buybuy) forControlEvents:UIControlEventTouchDown];
    //  取消
    [self.cancalorder addTarget:self action:@selector(del) forControlEvents:UIControlEventTouchDown];
 //已上课
     [self.yishangke addTarget:self action:@selector(YSK) forControlEvents:UIControlEventTouchDown];
     [self.payBtn addTarget:self action:@selector(buybuy) forControlEvents:UIControlEventTouchDown];
    //[self choosestatus:[classstatus.order_status intValue]];
    self.classname.text = _Cname;
    self.classtitle.text = _Ctitle;
    self.classprice.text = _Cprice;
    [self.classimg sd_setImageWithURL:[NSURL URLWithString:_Cimage]];
    
    
    //输入密码框
    [_queding addTarget:self action:@selector(payMoney) forControlEvents:UIControlEventTouchDown];
    _intextFiled.delegate = self;
    [_intextFiled addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [_qiaobaoButton addTarget:self action:@selector(payinbalance) forControlEvents:UIControlEventTouchDown];
    [_ZFB addTarget:self action:@selector(zfbPay) forControlEvents:UIControlEventTouchDown];
    _payView.hidden = YES;
//    _payView.layer.borderWidth = 1;
//    _payView.layer.borderColor = [[UIColor lightGrayColor]CGColor];
   
}
//确认已上课
-(void)YSK{
    NSString *fina = [MainUrl stringByAppendingString:@"index.php/api/put/user_class_confirm"];
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:_orderID,@"order_id",[[NSUserDefaults standardUserDefaults] objectForKey:@"userID"],@"user_id", nil];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    [manager POST:fina parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSMutableDictionary *data = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
        if ([[data objectForKey:@"message"]isEqualToString:@"success"]) {
            [self.navigationController popViewControllerAnimated:YES];
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
 
}
#pragma-mark 删除订单
- (void)del{
    NSString *fina = [MainUrl stringByAppendingString:@"index.php/api/del/user_order_record"];
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:_orderID,@"order_id", nil];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    [manager POST:fina parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSMutableDictionary *data = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
        if ([[data objectForKey:@"message"]isEqualToString:@"success"]) {
             [self.navigationController popViewControllerAnimated:YES];
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
    
}
#pragma-mark 付款
-(void)buybuy{
    _payView.hidden = NO;
}
- (void) textFieldDidChange:(id) sender
{
    _filed = (UITextField*)sender;
    _filed.delegate = self;
    switch (_filed.text.length) {
        case 0:
            _SV11.hidden = YES;
            _SV22.hidden = YES;
            _SV33.hidden = YES;
           _SV44.hidden = YES;
            _SV55.hidden = YES;
            _SV66.hidden = YES;
            break;
        case 1:
            _SV11.hidden = NO;
            _SV22.hidden = YES;
            _SV33.hidden = YES;
            _SV44.hidden = YES;
            _SV55.hidden = YES;
            _SV66.hidden = YES;
            break;
        case 2:
            _SV11.hidden = NO;
            _SV22.hidden = NO;
            _SV33.hidden = YES;
            _SV44.hidden = YES;
            _SV55.hidden = YES;
            _SV66.hidden = YES;
            break;
        case 3:
            _SV11.hidden = NO;
            _SV22.hidden = NO;
            _SV33.hidden = NO;
            _SV44.hidden = YES;
            _SV55.hidden = YES;
            _SV66.hidden = YES;
            break;
        case 4:
            _SV11.hidden = NO;
            _SV22.hidden = NO;
            _SV33.hidden = NO;
           _SV44.hidden = NO;
            _SV55.hidden = YES;
            _SV66.hidden = YES;
            break;
        case 5:
            _SV11.hidden = NO;
            _SV22.hidden = NO;
            _SV33.hidden = NO;
            _SV44.hidden = NO;
            _SV55.hidden = NO;
            _SV66.hidden = YES;
            break;
        case 6:
            _SV11.hidden = NO;
            _SV22.hidden = NO;
            _SV33.hidden = NO;
            _SV44.hidden = NO;
            _SV55.hidden = NO;
            _SV66.hidden = NO;
            break;
        default:
            break;
    }
    
    if (_filed.text.length == 6) {
        NSLog(@"%@",_filed.text);
        _queding.enabled = YES;
        
    }
    
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
    NSString *sw = [se stringByAppendingString:_orderID];
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
            Buysuccess.orderName = _orderID;
            [self.navigationController pushViewController:Buysuccess animated:YES];
        }else{
            UIAlertView *uiale = [[UIAlertView alloc]initWithTitle:@"提示" message:@"余额不足" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [uiale show];
            NSLog(@"%@",[data objectForKey:@"message"]);
            NSLog(@"提交订单失败");
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
    
}
//支付包支付
-(void)zfbPay{
    NSString *jiage = _classprice.text;
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
    order.tradeNO = _orderID;//订单ID
    NSLog(@"&&&&&&&& %@",order.tradeNO);
    order.productName = _classname.text;//商品标题
    //order.productDescription = @"qwer";//商品描述
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
-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)returnTData:(NSDictionary*)diic{
    teacherData = diic;
    NSString *headUrl = [teacherData objectForKey:@"head_pic"];
    if ([[headUrl substringToIndex:4]isEqualToString:@"http"]) {
        [_coachimg sd_setImageWithURL:[NSURL URLWithString:headUrl]];
    }else{
        NSString *finaurl = [ImageUrl stringByAppendingString:headUrl];
        [_coachimg sd_setImageWithURL:[NSURL URLWithString:finaurl]];
    }
    _coachname.text = [teacherData objectForKey:@"coacher_name"];
    NSString *se = [teacherData objectForKey:@"user_sex"];
    if ([se intValue] == 0) {
        _sex.text = @"男";
    }else{
          _sex.text =@"女";
    }
    _coachrook.text = [teacherData objectForKey:@"user_speciality"];
    _work_experience.text = [teacherData objectForKey:@"user_work_experience"];
    _trans_sum.text = [[teacherData objectForKey:@"trans_sum"]stringByAppendingString:@"单"];
    
    _coachimg.layer.masksToBounds = YES;
    _coachimg.layer.cornerRadius = _coachimg.frame.size.width/2;
    
    NSDictionary *nameDic = @{NSFontAttributeName:_coachname.font};
    CGSize namesize = [_coachname.text sizeWithAttributes:nameDic];
    _coachname.frame = CGRectMake(96*PW, 40*PH, namesize.width, namesize.height);
    _sex.frame = CGRectMake(_coachname.frame.origin.x+_coachname.frame.size.width+5, _coachname.frame.origin.y, 17*PW, _coachname.frame.size.height);
    _work_experience.numberOfLines = 3;
    
    [SVProgressHUD dismiss];
}
-(void)getTeacherData{
    [SVProgressHUD show];
    NSString *finaUrl = [MainUrl stringByAppendingString:GetTeacherDetail];
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:_TeacherId,@"coacher_id", nil];
   // NSLog(@"%@",_TeacherId);
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    [manager POST:finaUrl parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSMutableDictionary *data = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
        if ([[data objectForKey:@"message"]isEqualToString:@"success"]) {
            NSDictionary *dicc = [data objectForKey:@"results"];
            NSLog(@"嘻嘻%@",dicc);
            [self returnTData:dicc];
        }else if ([[data objectForKey:@"message"]isEqualToString:@"no_result"]){
            //没有教师详情 待定
        }
        else{
            
            NSLog(@"教练详情获取失败%@",data);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma-mark 评价
- (void)goreply{
    RepluyViewController *view = [[RepluyViewController alloc]init];
    view.orderID = _orderID;
    [self.navigationController pushViewController:view animated:YES];
}
#pragma-mark 余额支付
-(void)payinbalance{
    _inMoney.text = [_Cprice stringByAppendingString:@"元"];

    _inputPassworkView.hidden = NO;
    [_intextFiled becomeFirstResponder];
}

-(void)popView{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)viewsLayouts{
    _backView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 64);
    _backImage.frame = CGRectMake(0, 0, SCREEN_WIDTH, 64);
    //_BackBtn.frame = CGRectMake(8*PW, 35*PH, 17*PW, 21*PH);
    _backTitle.frame = CGRectMake((SCREEN_WIDTH-68)/2, _BackBtn.frame.origin.y-3, 68, 34);
    _backTitle.font = [UIFont systemFontOfSize:17];
   
    _View1.frame = CGRectMake(8*PW, 80*PH, 359*PW, 28*PH);
    _view1Image.frame = CGRectMake(8*PW, 2*PH, 20*PW, 24*PH);
    _view1Lable.frame = CGRectMake(34*PW, 4*PH, 68*PW, 21*PH);
    
    _view2.frame = CGRectMake(8*PW, 110*PH, 359*PW, 151*PH);
    _coachimg.frame = CGRectMake(9*PW, 34*PH, 78*PW, 78*PW);
    _coachname.frame = CGRectMake(96*PW, 40*PH, 47*PW, 21*PH);
    _coachname.font = [UIFont systemFontOfSize:16*PW];
    _sex.frame = CGRectMake(151*PW, 40*PH, 17*PW, 21*PH);
    _sex.font = [UIFont systemFontOfSize:16*PW];
    _sexImage.frame = CGRectMake(172*PW, 45*PH, 16*PW, 12*PH);
    _dingdanImage.frame = CGRectMake(291*PW, 17*PH, 12*PW, 15*PH);
    _trans_sum.frame = CGRectMake(310*PW, 14*PH, 37*PW, 21*PH);
    _trans_sum.font = [UIFont systemFontOfSize:13*PW];
    _jibie.frame = CGRectMake(95*PW, 76*PH, 68*PW, 21*PH);
    _jibie.font = [UIFont systemFontOfSize:13*PW];
    _coachrook.frame = CGRectMake(155*PW, 76*PH, 185*PW, 21*PH);
    _coachrook.font = [UIFont systemFontOfSize:13*PW];
    _jingyan.frame = CGRectMake(95*PW, 110*PH, 68*PW, 21*PH);
    _jingyan.font = [UIFont systemFontOfSize:13*PW];
    _work_experience.frame = CGRectMake(154*PW, 109*PH, 195*PW, 23*PH);
    _work_experience.font = [UIFont systemFontOfSize:13*PW];
    
    
    _view3.frame = CGRectMake(8*PW, 264*PH, 359*PW, 126*PH);
    _classimg.frame = CGRectMake(7*PW, 19*PH, 88*PW, 88*PW);
    _classname.frame = CGRectMake(103*PW, 15*PH, 186*PW, 21*PH);
    _classname.font = [UIFont systemFontOfSize:14*PW];
    _classtitle.frame = CGRectMake(103*PW, 40*PH, 182*PW, 37*PH);
    _classtitle.font = [UIFont systemFontOfSize:14*PW];
    
    _view3yuan.frame = CGRectMake(103*PW, 85*PH, 17*PW, 21*PH);
    _view3yuan.font = [UIFont systemFontOfSize:14*PW];
    
    _classprice.frame = CGRectMake(119*PW, 85*PH, 46*PW, 21*PH);
    _classprice.font = [UIFont systemFontOfSize:14*PW];
    _view3yuanhou.frame = CGRectMake(157*PW, 85*PH, 17*PW, 21*PH);
    _view3yuanhou.font = [UIFont systemFontOfSize:14*PW];
    
   
    _payview.frame= CGRectMake(8*PW, 398*PH, 359*PW, 49*PH);
    _replyview.frame= CGRectMake(8*PW, 398*PH, 359*PW, 49*PH);
    _payBtn.frame = CGRectMake(255*PW, 11*PH, 48*PW, 30*PH);
    _cancalorder.frame = CGRectMake(311*PW, 11*PH, 48*PW, 30*PH);
    
    _replyBtn.frame = CGRectMake(255*PW, 10*PH, 48*PW, 30*PH);
    _delorder.frame = CGRectMake(311*PW, 11*PH, 48*PW, 30*PH);
    _view4.frame = CGRectMake(8*PW, 398*PH, 359*PW, 49*PH);
    _yishangke.frame = CGRectMake(301*PW, 11*PH, 58*PW, 30*PH);
    _yishangkeLable.frame = CGRectMake(8*PW, 7*PH, 181*PW, 35*PH);
    _yishangkeLable.font = [UIFont systemFontOfSize:14*PW];
    _yishangkeLable.font = [UIFont systemFontOfSize:14*PW];
    _waitShangke.frame = _yishangkeLable.frame;
    _waitShangke.font = [UIFont systemFontOfSize:14*PW];
    
    
    _payView.frame = CGRectMake(69*PW, 281*PH, 240*PW, 111*PH);
    _QianbaoImage.frame = CGRectMake(44*PW, 22*PH, 29*PW, 25*PH);
    _qiaobaoButton.frame = CGRectMake(81*PW, 20*PH, 107*PW, 30*PH);
    _qiaobaoButton.titleLabel.font = [UIFont systemFontOfSize:13*PW];
    _Line.frame = CGRectMake(0, 55*PH, 240*PW, 2*PH);
    
    _ZFB.frame = CGRectMake(81*PW, 63*PH, 107*PW, 30*PH);
    _ZFB.titleLabel.font = [UIFont systemFontOfSize:13*PW];
    _ZFBImage.frame = CGRectMake(44*PW, 65*PH, 25*PW, 25*PH);
    
    _inputPassworkView.frame = CGRectMake(-4*PW, -58*PH, 249*PW, 197*PH);
    _Inlable.frame = CGRectMake(51*PW, 5*PH, 146*PW, 31*PH);
    _Inlable.font = [UIFont systemFontOfSize:14*PW];
    
    _Inline.frame = CGRectMake(0, 41*PH, 249*PW, 1);
    _inmonLable.frame = CGRectMake(96*PW, 50*PH, 56*PW, 30*PH);
    _inmonLable.font = [UIFont systemFontOfSize:17*PW];
    
    _inMoney.frame = CGRectMake(81*PW, 76*PH, 87*PW, 23*PH);
    _inMoney.font = [UIFont systemFontOfSize:14*PW];
    
    _SView1.frame = CGRectMake(5*PW,99*PH, 33*PW, 33*PW);
    _intextFiled.frame = CGRectMake(12*PW, 10*PH, 5*PW, 16*PH);
    _SV11.frame = CGRectMake(6*PW, 7*PH, 20*PW, 20*PW);
    _SV11.layer.cornerRadius = _SV11.frame.size.width/2;
    _SV11.hidden = YES;
    
    _SView2.frame = CGRectMake(46*PW, 99*PH, 33*PW, 33*PW);
    _SV22.frame = CGRectMake(6*PW, 7*PH, 20*PW, 20*PW);
    _SV22.layer.cornerRadius = _SV11.frame.size.width/2;
    _SV22.hidden = YES;
    
    _SView3.frame = CGRectMake(87*PW, 99*PH, 33*PW, 33*PW);
    _SV33.frame = CGRectMake(6*PW, 7*PH, 20*PW, 20*PW);
    _SV33.layer.cornerRadius = _SV11.frame.size.width/2;
    _SV33.hidden = YES;
    
    _SView4.frame = CGRectMake(126*PW, 99*PH, 33*PW, 33*PW);
    _SV44.frame = CGRectMake(6*PW, 7*PH, 20*PW, 20*PW);
    _SV44.layer.cornerRadius = _SV11.frame.size.width/2;
    _SV44.hidden = YES;
    
    _SView5.frame = CGRectMake(167*PW, 99*PH, 33*PW, 33*PW);
    _SV55.frame = CGRectMake(6*PW, 7*PH, 20*PW, 20*PW);
    _SV55.layer.cornerRadius = _SV11.frame.size.width/2;
    _SV55.hidden = YES;
    
    _SView6.frame = CGRectMake(208*PW, 99*PH, 33*PW, 33*PW);
    _SV66.frame = CGRectMake(6*PW, 7*PH, 20*PW, 20*PW);
    _SV66.layer.cornerRadius = _SV11.frame.size.width/2;
    _SV66.hidden = YES;
    
    _SView1.layer.borderWidth = 1;
    _SView2.layer.borderWidth = 1;
    _SView3.layer.borderWidth = 1;
    _SView4.layer.borderWidth = 1;
    _SView5.layer.borderWidth = 1;
    _SView6.layer.borderWidth = 1;
    _SView1.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    _SView2.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    _SView3.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    _SView4.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    _SView5.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    _SView6.layer.borderColor = [[UIColor lightGrayColor]CGColor];

    
    _queding.frame = CGRectMake(58*PW, 140*PH, 132*PW, 38*PH);
    _inImage.frame = CGRectMake(10*PW, 5*PH, 33*PW, 33*PW);
    
}
@end
