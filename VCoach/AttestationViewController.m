//
//  AttestationViewController.m
//  VCoach
//
//  Created by Moon on 16/1/20.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "AttestationViewController.h"
#import "VTeacher.pch"
#import "ReqlyViewCell.h"
@interface AttestationViewController ()<UITableViewDataSource,UITableViewDelegate>{
    NSMutableArray *_status;
    NSString *finaNa;
    NSString *finaPhone;
}

@end

@implementation AttestationViewController
-(void)viewWillAppear:(BOOL)animated{
    [self viewsFrame];
    NSThread *thred = [[NSThread alloc]initWithTarget:self selector:@selector(getData) object:nil];
    [thred start];
}
-(void)viewsFrame{
    
    _view1.layer.masksToBounds = YES;
    _view1.layer.cornerRadius = 2.0;
    
    _view2.layer.masksToBounds = YES;
    _view2.layer.cornerRadius = 2.0;
    
    _view3.layer.masksToBounds = YES;
    _view3.layer.cornerRadius = 2.0;
    
    _headImage.layer.masksToBounds = YES;
    _headImage.layer.cornerRadius = _headImage.frame.size.width/2;
    [self creatView];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.backButton1 addTarget:self action:@selector(popView) forControlEvents:UIControlEventTouchDown];
    // Do any additional setup after loading the view from its nib.
}
-(void)creatView{
    _view0.frame = CGRectMake(0, 0, SCREEN_WIDTH, 64);
    _backImage.frame = CGRectMake(0, 0, SCREEN_WIDTH, 64);
    
    _topTitle.frame = CGRectMake((SCREEN_WIDTH-68)/2, _BackButton.frame.origin.y-3, 68, 34);
    //_BackButton.frame = CGRectMake(16, 32, 17, 27);
    //_backButton1.frame = CGRectMake(8, 8, 71, 48);
    //_backButton1.backgroundColor = [UIColor redColor];
    _view1.frame = CGRectMake(8*PW, 8*PH, 359*PW, 177*PH);
    _name.frame = CGRectMake(126*PW, 72*PH, 81*PW, 30*PH);
    _name.font = [UIFont systemFontOfSize:15*PW];
    
    _time.frame = CGRectMake(199*PW, 72*PH, 81*PW, 30*PH);
    _time.font = [UIFont systemFontOfSize:14*PW];
    _shenggao.frame = CGRectMake(126*PW, 114*PH, 42*PW, 21*PH);
    _shenggao.font = [UIFont systemFontOfSize:15*PW];
    _hight.frame = CGRectMake(165*PW, 115*PH, 54*PW, 21*PH);
    _hight.font = [UIFont systemFontOfSize:15*PW];
    _jiguan.frame = CGRectMake(199*PW, 115*PH, 42*PW, 21*PH);
    _jiguan.font = [UIFont systemFontOfSize:15*PW];
    
    _province.frame = CGRectMake(238*PW, 115*PH, 106*PW, 21*PH);
    _province.font = [UIFont systemFontOfSize:14*PW];
    _headImage.frame = CGRectMake(8*PW, 70*PH, 85*PW, 85*PW);
    _headImage.layer.masksToBounds = YES;
    _headImage.layer.cornerRadius = _headImage.frame.size.width/2;
    _line.frame = CGRectMake(0, 40*PH, 359*PW, 5*PH);
    _titlee.frame = CGRectMake(8*PW, 8*PH, 72*PW, 24*PH);
    _titlee.font = [UIFont systemFontOfSize:17*PW];
    
    _view2.frame = CGRectMake(8*PW, 193*PH, 359*PW, 169*PH);
    _view2Title.frame = CGRectMake(8*PW, 8*PH, 72*PW, 24*PH);
    
    _texts.frame = CGRectMake(8*PW, 35*PH, 343*PW, 49*PH);
   
    
    _tec.frame = CGRectMake(8*PW, 92*PH, 58*PW, 28*PH);
       _techang.frame = CGRectMake(8*PW, 112*PH, 343*PW, 49*PH);
    
    //view2的高度
    _view2.frame = CGRectMake(8*PW, 193*PH, 359*PW, _view2Title.frame.size.height+_texts.frame.size.height+_tec.frame.size.height+_techang.frame.size.height+50*PH);
    
    _view3.frame = CGRectMake(8*PW, _view2.frame.origin.y+_view2.frame.size.height+5, 359*PW, 173*PH);
    _view3Title.frame = CGRectMake(8*PW, 5*PH, 83*PW, 35*PH);
    _view3Title.font = [UIFont systemFontOfSize:17*PW];
    
    _view3Image1.frame = CGRectMake(8*PW, 48*PH, 170*PW, 105*PH);
    _view3Image2.frame = CGRectMake(189*PW, 48*PH, 170*PW, 105*PH);
    _line1.frame = CGRectMake(0, 36*PH, 359*PW, 4*PH);
    
    
    _view4 = [[UIView alloc]initWithFrame:CGRectMake(8*PW,_view3.frame.origin.y+_view3.frame.size.height+5, SCREEN_WIDTH-(18*PW), 390*PH)];
    _view4.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:_view4];
    
    _view4Title = [[UILabel alloc]initWithFrame:CGRectMake(8*PW, 8*PH, 83*PW, 35*PH)];
    _view4Title.text = @"教练风采";
    _view4Title.font = [UIFont systemFontOfSize:17*PW];
    [_view4 addSubview:_view4Title];
    _line2 = [[UIView alloc]initWithFrame:CGRectMake(0, 46*PH, _line1.frame.size.width, 4*PH)];
    _line2.backgroundColor = [UIColor colorWithRed:0.902f green:0.902f blue:0.902f alpha:1.00f];
    [_view4 addSubview:_line2];
    
    
    CGFloat y = _line2.frame.origin.y+_line2.frame.size.height;
    
    
    _ima1 = [[UIImageView alloc]initWithFrame:CGRectMake(5*PW, 10*PW+y, (_view4.frame.size.width-(20*PW))/3, 150*PH)];
    //_ima1.backgroundColor = [UIColor greenColor];
    [_view4 addSubview:_ima1];
    
    _ima2 = [[UIImageView alloc]initWithFrame:CGRectMake(10*PW+(_view4.frame.size.width-(20*PW))/3, 10*PH+y, (_view4.frame.size.width-(20*PW))/3, 150*PH)];
    // _ima2.backgroundColor = [UIColor redColor];
    [_view4 addSubview:_ima2];
    
    _ima3 = [[UIImageView alloc]initWithFrame:CGRectMake(_view4.frame.size.width-(_ima1.frame.size.width+(5*PW)), 10*PH+y, (_view4.frame.size.width-(20*PW))/3, 150*PH)];
    // _ima3.backgroundColor = [UIColor redColor];
    [_view4 addSubview:_ima3];
    
    _ima5 = [[UIImageView alloc]initWithFrame:CGRectMake(5*PW, _ima1.frame.origin.y+_ima1.frame.size.height+(10*PH), _view4.frame.size.width-(10*PW), 150*PH)];
    //_ima5.backgroundColor = [UIColor greenColor];
    [_view4 addSubview:_ima5];
    
    _view44 = [[UIView alloc]initWithFrame:CGRectMake(8*PW, _view4.frame.origin.y+_view4.frame.size.height+(10*PH), _view4.frame.size.width, 40*PH)];
    _view44.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:_view44];
    
    _view44Title = [[UILabel alloc]initWithFrame:CGRectMake(8*PW, 5*PH, 90*PW, 30*PH)];
    _view44Title.text = @"评价";
    _view44Title.font = [UIFont systemFontOfSize:17*PW];
    _view44Title.backgroundColor = [UIColor whiteColor];
    [_view44 addSubview:_view44Title];
    
    _view4TableView = [[UITableView alloc]initWithFrame:CGRectMake(8*PW, _view44.frame.origin.y+_view44.frame.size.height+(5*PH), _view44.frame.size.width, 200*PH)];
    _view4TableView.backgroundColor = [UIColor whiteColor];
    _view4TableView.scrollEnabled = NO;
    _view4TableView.delegate = self;
    _view4TableView.dataSource = self;
    [_scrollView addSubview:_view4TableView];
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)returnData:(NSMutableDictionary *)dda{
    NSLog(@"%@",dda);
    
    //头像url
    NSString *headURl = [[dda objectForKey:@"coacher_infomation"]objectForKey:@"head_pic"];
    NSLog(@"%@",headURl);
    if ([[headURl substringToIndex:4]isEqualToString:@"http"]) {
        [_headImage sd_setImageWithURL:[NSURL URLWithString:headURl]];
    }else{
       [_headImage sd_setImageWithURL:[NSURL URLWithString:[ImageUrl stringByAppendingString:headURl]]];
    }
    _name.text = [[dda objectForKey:@"coacher_infomation"]objectForKey:@"coacher_name"];
    _time.text = [[dda objectForKey:@"coacher_infomation"]objectForKey:@"user_birthday"];
    _hight.text = [[dda objectForKey:@"coacher_infomation"]objectForKey:@"user_height"];
    _province.text = [[dda objectForKey:@"coacher_infomation"]objectForKey:@"user_natice_place"];
    _texts.text = [dda objectForKey:@"coacher_personal_experience"];
    _techang.text = [dda objectForKey:@"coacher_user_speciality_result"];
   
    //个人经历
    CGSize tsiize = CGSizeMake(330*PW, 1000*PH);
    //cell.title.numberOfLines = 0;
    CGSize  tlabSize = [_texts.text sizeWithFont:_texts.font constrainedToSize:tsiize lineBreakMode:NSLineBreakByCharWrapping];
    _texts.frame = CGRectMake(8*PW, 35*PH, 343*PW, tlabSize.height);


    _tec.frame = CGRectMake(8*PW, _texts.frame.origin.y+_texts.frame.size.height+5, 58*PW, 28*PH);
    _techang.frame = CGRectMake(8*PW, _tec.frame.origin.y+_tec.frame.size.height+5, 343*PW, 49*PH);
    _techang.numberOfLines = 4;
    
    _texts.font = [UIFont systemFontOfSize:14*PW];
    _tec.font = [UIFont systemFontOfSize:17*PW];
    _techang.font = [UIFont systemFontOfSize:14*PW];

    
      _view2Title.font = [UIFont systemFontOfSize:17*PW];

    
    
    _scrollView.bounces = NO;

//  证书图片
    NSArray *view3array = [dda objectForKey:@"coacher_cernification_photo_result"];
//  教练风采图片
    NSArray *view4array = [dda objectForKey:@"coacher_photo_results"];
    
    if ([view3array isKindOfClass:[NSNull class]] ) {
      NSLog(@"这里有空值");
        _view3Image1.hidden = YES;
        _view3Image2.hidden = YES;
        _view3.hidden = YES;
        _view4.frame = CGRectMake(8*PW, 370*PH, SCREEN_WIDTH-(18*PW), 390*PH);
    }else if (view3array.count == 1){
        _view3Image2.hidden = YES;
        _view3Image1.hidden = NO;
          NSString *url = [[view3array objectAtIndex:0]objectForKey:@"cernification_pic_url"];
        [_view3Image1 sd_setImageWithURL:[NSURL URLWithString:[self checkUrl:url]]];

    }else{
        _view3Image1.hidden = NO;
        _view3Image2.hidden = NO;
        NSString *url = [[view3array objectAtIndex:0]objectForKey:@"cernification_pic_url"];
        NSString *url1 = [[view3array objectAtIndex:1]objectForKey:@"cernification_pic_url"];
        NSLog(@"!!!!!%@",url);
        NSLog(@"#####%@",url1);
        [_view3Image1 sd_setImageWithURL:[NSURL URLWithString:[self checkUrl:url]]];
        
        [_view3Image2 sd_setImageWithURL:[NSURL URLWithString:[self checkUrl:url1]]];
    }
    
    if ([view4array isKindOfClass:[NSNull class]]) {
        _view4.hidden = YES;
    }else if (view4array.count <=3){
        _ima1.hidden = NO;
        _ima2.hidden = NO;
        _ima3.hidden = NO;
        _ima5.hidden = YES;
        NSInteger length = view4array.count;
        if (length == 1) {
            NSString *url1 = [[view4array objectAtIndex:0]objectForKey:@"pic_url"];
            NSString *UrlImage1 = [self checkUrl:url1];
            [_ima1 sd_setImageWithURL:[NSURL URLWithString:UrlImage1]];
        }else if (length == 2){
             NSString *url1 = [[view4array objectAtIndex:0]objectForKey:@"pic_url"];
             NSString *url2 = [[view4array objectAtIndex:1]objectForKey:@"pic_url"];
            
            NSString *UrlImage1 = [self checkUrl:url1];
            [_ima1 sd_setImageWithURL:[NSURL URLWithString:UrlImage1]];
            
            NSString *UrlImage2 = [self checkUrl:url2];
            [_ima2 sd_setImageWithURL:[NSURL URLWithString:UrlImage2]];
            
        }else if (length == 3){
            NSString *url1 = [[view4array objectAtIndex:0]objectForKey:@"pic_url"];
            NSString *url2 = [[view4array objectAtIndex:1]objectForKey:@"pic_url"];
             NSString *url3 = [[view4array objectAtIndex:2]objectForKey:@"pic_url"];
            
            [_ima1 sd_setImageWithURL:[NSURL URLWithString:[self checkUrl:url1]]];
            [_ima2 sd_setImageWithURL:[NSURL URLWithString:[self checkUrl:url2]]];
            [_ima3 sd_setImageWithURL:[NSURL URLWithString:[self checkUrl:url3]]];
        }
    }else if (view4array.count >3){
        _ima1.hidden = NO;
        _ima2.hidden = NO;
        _ima3.hidden = NO;
        _ima5.hidden = NO;
       
        NSString *url1 = [[view4array objectAtIndex:0]objectForKey:@"pic_url"];
        NSString *url2 = [[view4array objectAtIndex:1]objectForKey:@"pic_url"];
        NSString *url3 = [[view4array objectAtIndex:2]objectForKey:@"pic_url"];
        NSString *url4 = [[view4array objectAtIndex:3]objectForKey:@"pic_url"];
        
        NSString *UrlImage1 = [self checkUrl:url1];
        [_ima1 sd_setImageWithURL:[NSURL URLWithString:UrlImage1]];
        
        NSString *UrlImage2 = [self checkUrl:url2];
        [_ima2 sd_setImageWithURL:[NSURL URLWithString:UrlImage2]];
        
        NSString *UrlImage3 = [self checkUrl:url3];
        [_ima3 sd_setImageWithURL:[NSURL URLWithString:UrlImage3]];
        
        NSString *UrlImage4 = [self checkUrl:url4];
        [_ima5 sd_setImageWithURL:[NSURL URLWithString:UrlImage4]];
    }
    
    
}
//获取数据
-(void)getData{
    NSString*wlzt=[[NSUserDefaults standardUserDefaults]stringForKey:@"WLZT"];
    if ([wlzt isEqualToString:@"no_net"]) {
        UIAlertView *ba = [[UIAlertView alloc]initWithTitle:@"蜂窝移动数据已关闭" message:@"启用蜂窝移动数据或无线局域网来访问数据" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
        [ba show];
    }else{
    [SVProgressHUD show];
    [self getReplayList];
    NSString *finaUrl = [MainUrl stringByAppendingString:@"index.php/api/get/coacher_certification_detail"];
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:_cocahID,@"coacher_id", nil];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"html/text"];
    [manager POST:finaUrl parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSMutableDictionary *data = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
        if ([[data objectForKey:@"message"]isEqualToString:@"success"]) {
            NSMutableDictionary *dd = [data objectForKey:@"results"];
//            NSLog(@"%@",dd);
            [self returnData:dd];
        }else{
            NSLog(@"教练详情获取失败");
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
    }
}
-(NSString *)checkUrl:(NSString *)url{
    NSString *FinaUrl;
    if ([[url substringToIndex:4]isEqualToString:@"http"]) {
        FinaUrl = url;
    }else{
        FinaUrl = [ImageUrl stringByAppendingString:url];
    }
    return FinaUrl;
}

//返回上一页面
-(void)popView{
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _status.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ide = @"ReqlyViewCell";
    ReqlyViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ide];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:ide owner:self options:nil]lastObject];
    }
    if ([[[_status objectAtIndex:indexPath.row]objectForKey:@"user_nickname"] isKindOfClass:[NSNull class]]) {
        finaNa = @"(";
    }else{
        NSString *name = [[_status objectAtIndex:indexPath.row]objectForKey:@"user_nickname"];
        NSInteger length =  name.length;
        
        NSString *nana = [name stringByReplacingCharactersInRange:NSMakeRange(0,length-(0+1)) withString:@"*"];
        finaNa = [nana stringByAppendingString:@"("];
    }
    if ([[[_status objectAtIndex:indexPath.row]objectForKey:@"user_account"] isKindOfClass:[NSNull class]]) {
        finaPhone = @"暂无手机号";
    }else{
        NSString *phone = [[_status objectAtIndex:indexPath.row]objectForKey:@"user_account"];
        NSString *tel = [phone stringByReplacingCharactersInRange:NSMakeRange(3, 4) withString:@"****"];
        finaPhone = [tel stringByAppendingString:@")"];
    }
    
    
    
    if ([[[_status objectAtIndex:indexPath.row]objectForKey:@"reply_point"]isEqualToString:@"1"]) {
        cell.goodOrBad.image = [UIImage imageNamed:@""];
        cell.pinjia.text = @"差评";
    }else if ([[[_status objectAtIndex:indexPath.row]objectForKey:@"reply_point"]isEqualToString:@"2"]){
        cell.goodOrBad.image = [UIImage imageNamed:@""];
        cell.pinjia.text = @"好评";
    }
    
    cell.namePhone.text = [finaNa stringByAppendingString:finaPhone];
    
    cell.time.text = [[_status objectAtIndex:indexPath.row]objectForKey:@"reply_time"];
    cell.title.text = [[_status objectAtIndex:indexPath.row]objectForKey:@"reply_text"];
    // Cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSDictionary *DIC = @{NSFontAttributeName:cell.namePhone.font};
    CGSize size = [cell.namePhone.text sizeWithAttributes:DIC];
    
    cell.namePhone.frame = CGRectMake(8*PW, 8*PH, size.width, size.height);
    
    NSDictionary *titleDic = @{NSFontAttributeName:cell.time.font};
    CGSize tltleSize = [cell.time.text sizeWithAttributes:titleDic];
   
    cell.title.font = [UIFont systemFontOfSize:16*PW];
   
    
    cell.time.font = [UIFont systemFontOfSize:14*PW];
    cell.pinjia.frame = CGRectMake(334*PW, 8*PH, 33*PW, 21*PH);
    
//    cell.backView.backgroundColor = [UIColor whiteColor];
//    cell.backView.hidden = NO;
     CGSize siize = CGSizeMake(330*PW, 1000*PH);
    cell.title.numberOfLines = 0;
    CGSize  labSize = [cell.title.text sizeWithFont:cell.title.font constrainedToSize:siize lineBreakMode:NSLineBreakByCharWrapping];
    cell.title.frame = CGRectMake(8*PW, 36*PH, 359*PW, labSize.height);
     cell.backView.frame = CGRectMake(8*PW, 0, 359*PW,cell.namePhone.frame.size.height+cell.title.frame.size.height+cell.time.frame.size.height+15);
     cell.time.frame = CGRectMake(cell.backView.frame.size.width-tltleSize.width+8, cell.title.frame.origin.y+cell.title.frame.size.height, tltleSize.width, tltleSize.height);   // cell.backgroundColor = [UIColor whiteColor];
   
     _view4TableView.rowHeight = cell.namePhone.frame.size.height+cell.title.frame.size.height+cell.time.frame.size.height+18;
    return cell;
}
//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//      return 94*PH;
//}
-(void)getReplayList{
    
    NSString *finaUrl = [MainUrl stringByAppendingString:@"/index.php/api/get/coacher_replys"];
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:_cocahID,@"coacher_id", nil];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"html/text"];
    [manager POST:finaUrl parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSMutableDictionary *data = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
        if ([[data objectForKey:@"message"]isEqualToString:@"success"]) {
            _status = [data objectForKey:@"results"];
            [_view4TableView reloadData];
            _view4TableView.frame = CGRectMake(0, _view44.frame.origin.y+_view44.frame.size.height+(5*PH), SCREEN_WIDTH, _status.count*(94*PH));
            
              _scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, _view4.frame.origin.y+_view4.frame.size.height+20+_view44.frame.size.height+_view4TableView.frame.size.height);
            [SVProgressHUD dismiss];
            NSLog(@"哈哈%@",_status);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
    
}
-(void)viewDidAppear:(BOOL)animated{
    [SVProgressHUD dismiss];
}
- (IBAction)backbeforeView:(id)sender {
     [self.navigationController popViewControllerAnimated:YES];
}
@end
