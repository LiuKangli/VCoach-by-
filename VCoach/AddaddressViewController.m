//
//  AddaddressViewController.m
//  VCoach
//
//  Created by apple on 15/5/13.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "AddaddressViewController.h"
#import "RepluyViewController.h"


#import "AddressCollectionViewCell.h"
#import "VTeacher.pch"
@interface AddaddressViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end
static int k = 1;
@implementation AddaddressViewController
{
    NSMutableArray *_status;
    
    NSString *provinceID;
    NSString *cityID;
    NSString *areraID;
    
    NSString *mor ;
    
    int i;
}
-(void)viewWillAppear:(BOOL)animated{
    
    self.tabBarController.tabBar.hidden = YES;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self viewsLays];
    mor = @"0";
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = backViewColor_gray;
   
    [_collectionView registerNib:[UINib nibWithNibName:@"AddressCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"AddressCollectionViewCell"];
    [self.realBack addTarget:self action:@selector(popViewv) forControlEvents:UIControlEventTouchDown];
    
   
    //选择省份点击事件
    UITapGestureRecognizer *province = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(provinceTouch)];
    [_provinceView addGestureRecognizer:province];
    //选择市 点击事件
    UITapGestureRecognizer *shi = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(shiTouch)];
    [_cityView addGestureRecognizer:shi];
    
    UITapGestureRecognizer *are = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(areTouch)];
    [_areraView addGestureRecognizer:are];
    
    
    UITapGestureRecognizer *jiedao = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(jiedaoTouch)];
    [_jiedaoView addGestureRecognizer:jiedao];
    
    UITapGestureRecognizer *xingm = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(xingmTouch)];
    [_nameView addGestureRecognizer:xingm];
    
    UITapGestureRecognizer *haoma = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(haomaTouch)];
    [_phoneView addGestureRecognizer:haoma];
    
    
    //设置默认
    [_morenBtn addTarget:self action:@selector(okok) forControlEvents:UIControlEventTouchDown];

    [_baocun addTarget:self action:@selector(baocun1) forControlEvents:UIControlEventTouchDown];
    if (_provinceN == nil && _areaN == nil && _cityN == nil) {
        i = 0;
    }else{
        i = 1;
    _provinceLable.text = _provinceN;
    _cityLable.text = _cityN;
    _arearTitle.text = _areaN;
    _phonrTextFILED.text = _phoneN;
    _nameTltle.text = _peopleN;
    _jiedaoTextFiled.text = _jieN;
        
        
    }
    
}
-(void)svpshow{
    [SVProgressHUD show];
}
-(void)jiedaoTouch{
    [_jiedaoTextFiled becomeFirstResponder];
}
-(void)xingmTouch{
    [_nameTltle becomeFirstResponder];
}
-(void)haomaTouch{
    [_phonrTextFILED becomeFirstResponder];
}
-(void)provinceTouch{
    _collectionView.hidden = NO;

    [self initData:@"0":@"0"];
   
   // [self initFrame:CGRectMake(0, 61, 375, 53)];
 
}
-(void)shiTouch{
    if (provinceID.length == 0) {
        
    }else{
       
        _status = [NSMutableArray array];
        _collectionView.hidden = NO;
        
    [self initData:provinceID :@"1"];
        //[self initFrame:CGRectMake(0, 122, 375, 53)];
  }
}
-(void)areTouch{
    if (cityID.length == 0) {
        
    }else{
        _collectionView.hidden = NO;
        _status = [NSMutableArray array];
        [self initData:cityID :@"2"];
    }
}
-(void)okok{
    k++;
   
    if (k%2 == 0) {
        _morenimg.image = [UIImage imageNamed:@"xuanzebtn"];
        mor = @"1";
    }else{
        _morenimg.image = [UIImage imageNamed:@"yuanioc"];
        mor = @"0";
    }
}
//行距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 5;
}

//cell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _status.count;
}
//section个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
//每个uicollectionView展示的内容
-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ide = @"AddressCollectionViewCell";
    AddressCollectionViewCell *cell =(AddressCollectionViewCell*) [collectionView dequeueReusableCellWithReuseIdentifier:ide forIndexPath:indexPath];
    if ([[[[_status objectAtIndex:indexPath.row]allKeys]objectAtIndex:0]isEqualToString:@"province_name"]) {
        cell.name.text = [[_status objectAtIndex:indexPath.row] objectForKey:@"province_name"];
        
    }else if ([[[[_status objectAtIndex:indexPath.row]allKeys]objectAtIndex:1]isEqualToString:@"city_name"]){
       
        NSLog(@"****%@",[[[_status objectAtIndex:indexPath.row]allKeys]objectAtIndex:0]);
        cell.name.text = [[_status objectAtIndex:indexPath.row]objectForKey:@"city_name"];
    }else if ([[[[_status objectAtIndex:indexPath.row]allKeys]objectAtIndex:1]isEqualToString:@"area_name"]){
        cell.name.text = [[_status objectAtIndex:indexPath.row]objectForKey:@"area_name"];
    }
    cell.name.frame = CGRectMake(0, 0, 54*PW, 36*PH);
    cell.name.font = [UIFont systemFontOfSize:14*PW];
   cell.name.numberOfLines = 3;
    return cell;
    
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld",(long)indexPath.row);
   
    if ([[[[_status objectAtIndex:indexPath.row]allKeys]objectAtIndex:0]isEqualToString:@"province_name"]) {
         _provinceLable.text = [[_status objectAtIndex:indexPath.row]objectForKey:@"province_name"];
        provinceID = [[_status objectAtIndex:indexPath.row]objectForKey:@"province_id"];
    }else if ([[[[_status objectAtIndex:indexPath.row]allKeys]objectAtIndex:1]isEqualToString:@"city_name"]){
        cityID = [[_status objectAtIndex:indexPath.row]objectForKey:@"city_id"];
        _cityLable.text = [[_status objectAtIndex:indexPath.row]objectForKey:@"city_name"];
    }else if ([[[[_status objectAtIndex:indexPath.row]allKeys]objectAtIndex:1]isEqualToString:@"area_name"]){
      _arearTitle.text  = [[_status objectAtIndex:indexPath.row]objectForKey:@"area_name"];
        areraID = [[_status objectAtIndex:indexPath.row]objectForKey:@"area_id"];
    }
    
    _collectionView.hidden = YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)popViewv{
    
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)initData:(NSString *)place_id :(NSString*)type{
    [self svpshow];
    
    NSString *finaurl = [MainUrl stringByAppendingString:cityList];
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:place_id,@"place_id",type,@"type", nil];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    [manager POST:finaurl parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSMutableDictionary *data = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
        if ([[data objectForKey:@"message"]isEqualToString:@"success"]) {
            _status = [data objectForKey:@"results"];
            [_collectionView reloadData];
            
            [SVProgressHUD dismiss];
        }else{
            NSLog(@"城市列表获取失败");
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];

}
-(void)fr{
    [_status removeAllObjects];
}
//-(void)initFrame:(CGRect)framee{
//   
//    CGFloat H = 8;
//    _collectionView.hidden = NO;
//    _collectionView.frame = CGRectMake(0, framee.origin.y+framee.size.height+H, SCREEN_WIDTH, 116);
//    
//    _cityView.frame = CGRectMake(0, H+_collectionView.frame.size.height+_collectionView.frame.origin.y, 375, 53);
//    _areraView.frame = CGRectMake(0, _cityView.frame.origin.y+_cityView.frame.size.height+H, 375, 53);
//    _jiedaoView.frame = CGRectMake(0, _areraView.frame.origin.y+_areraView.frame.size.height+H, 375, 53);
//    _nameView.frame = CGRectMake(0, _jiedaoView.frame.origin.y+_jiedaoView.frame.size.height+H, 375, 53);
//    _phoneView.frame = CGRectMake(0, _nameView.frame.origin.y+_nameView.frame.size.height+H, 375, 53);
//  //  _collectionView.hidden = YES;
//}

//-(void)hidden{
//    _collectionView.hidden = YES;
//    
//}


//保存
-(void)baocun1{
    //i = 1修改    0新增
    if (i == 1) {
    NSString *finaurl = [MainUrl stringByAppendingString:updateAd];
    NSDictionary  *dic = [NSDictionary dictionaryWithObjectsAndKeys:[[NSUserDefaults standardUserDefaults] objectForKey:@"userID"],@"user_id",
                              _adrssID,@"address_id",
                              provinceID,@"recieve_province",
                              areraID,@"recieve_area",
                              cityID,@"recieve_city",
                              _jiedaoTextFiled.text,@"recieve_detail_address",
                              _nameTltle.text,@"recieve_name",
                              _phonrTextFILED.text,@"recieve_phone",
                              mor,@"is_set_default", nil];
        //NSLog(@"%@", address_id);
        [self adressChange:finaurl per:dic];
    }else{
   NSString * finaurl = [MainUrl stringByAppendingString:addAD];
        
        NSDictionary  *dic = [NSDictionary dictionaryWithObjectsAndKeys:[[NSUserDefaults standardUserDefaults] objectForKey:@"userID"],@"user_id",
                              provinceID,@"recieve_province",
                              areraID,@"recieve_area",
                              cityID,@"recieve_city",
                              _jiedaoTextFiled.text,@"recieve_detail_address",
                              _nameTltle.text,@"recieve_name",
                              _phonrTextFILED.text,@"recieve_phone",
                              mor,@"is_set_default", nil];
        [self adressChange:finaurl per:dic];
    }

}
-(void)adressChange:(NSString*)url per:(NSDictionary *)dic{
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    [manager POST:url parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSMutableDictionary *data = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
        if ([[data objectForKey:@"message"]isEqualToString:@"success"]) {
            [self.navigationController popViewControllerAnimated:YES];
        }else{
           // NSLog(@"%@",[data objectForKey:@"results"]);
            UIAlertView *ale = [[UIAlertView alloc]initWithTitle:@"提示" message:@"修改失败" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [ale show];
            NSLog(@"失败");
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
    

    
}

-(void)viewsLays{
    _backView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 64);
    _backImage.frame = CGRectMake(0, 0, SCREEN_WIDTH, 64);
    
    //_BackBtn.frame = CGRectMake(8*PW, 35*PH, 17*PW, 21*PH);
    _backTITLE.frame = CGRectMake((SCREEN_WIDTH-68)/2, _BackBtn.frame.origin.y-3, 68, 34);
    _backTITLE.font = [UIFont systemFontOfSize:17];
    
    _provinceView.frame = CGRectMake(0, 80*PH, SCREEN_WIDTH, 53*PH);
    _provinceTopLable.frame = CGRectMake(8*PW, 0, 78*PW, 23*PH);
    _provinceTopLable.font = [UIFont systemFontOfSize:15*PW];
    _provinceLable.frame = CGRectMake(8*PW, 31*PH, 78*PW, 21*PH);
    _provinceLable.font = [UIFont systemFontOfSize:15*PW];
    _provinceRightImage.frame = CGRectMake(353*PW, 19*PH, 9*PW, 15*PH);
    
    _cityView.frame = CGRectMake(0, _provinceView.frame.origin.y+_provinceView.frame.size.height+10*PH, SCREEN_WIDTH, 53*PH);
    _cityLable.frame = CGRectMake(8*PW, 31*PH, 78*PW, 21*PH);
    _cityLable.font = [UIFont systemFontOfSize:15*PW];
    
    _cityRightImage.frame = CGRectMake(353*PW, 19*PH, 9*PW, 15*PH);
    _cityTopLable.frame = CGRectMake(8*PW, 0, 78*PW, 23*PH);
    _cityTopLable.font = [UIFont systemFontOfSize:15*PW];
    
    _areraView.frame = CGRectMake(0,  _cityView.frame.origin.y+_cityView.frame.size.height+10*PH, SCREEN_WIDTH, 53*PH);
    _areraTopTitle.frame = CGRectMake(8*PW, 0, 78*PW, 23*PH);
    _areraTopTitle.font = [UIFont systemFontOfSize:15*PW];
    _areraRightImage.frame =CGRectMake(353*PW, 19*PH, 9*PW, 15*PH);
    _arearTitle.frame = CGRectMake(8*PW, 31*PH, 78*PW, 21*PH);
    _arearTitle.font = [UIFont systemFontOfSize:15*PW];
    
    _jiedaoView.frame = CGRectMake(0, _areraView.frame.origin.y+_areraView.frame.size.height+10*PH, SCREEN_WIDTH, 53*PH);
    _jiedaoTopTltle.frame = CGRectMake(8*PW, 0, 78*PW, 23*PH);
    _jiedaoTopTltle.font = [UIFont systemFontOfSize:15*PW];
    _jiedaoTextFiled.frame = CGRectMake(8*PW, 31*PH, 195*PW, 21*PH);
    _jiedaoTextFiled.font = [UIFont systemFontOfSize:15*PW];
    _jiedaoRightImage.frame =CGRectMake(353*PW, 19*PH, 9*PW, 15*PH);
    
    _nameView.frame = CGRectMake(0, _jiedaoView.frame.origin.y+_jiedaoView.frame.size.height+10*PH, SCREEN_WIDTH, 53*PH);
    _nameTopTitle.frame = CGRectMake(8*PW, 0, 78*PW, 23*PH);
    _nameTopTitle.font = [UIFont systemFontOfSize:15*PW];
    
    _nameTltle.frame = CGRectMake(8*PW, 31*PH, 78*PW, 21*PH);
    _nameTltle.font = [UIFont systemFontOfSize:15*PW];
    _nameRightImage.frame = CGRectMake(353*PW, 19*PH, 9*PW, 15*PH);
    
    _phoneView.frame = CGRectMake(0, _nameView.frame.origin.y+_nameView.frame.size.height+10*PH, SCREEN_WIDTH, 53*PH);
    _phoneRoghtImage.frame = CGRectMake(353*PW, 19*PH, 9*PW, 15*PH);
    _phoneTopTitle.frame = CGRectMake(8*PW, 0, 135*PW, 23*PH);
    _phoneTopTitle.font = [UIFont systemFontOfSize:15*PW];
    _phonrTextFILED.frame = CGRectMake(8*PW, 31*PH, 195*PW, 21*PH)
    ;
    _phonrTextFILED.font = [UIFont systemFontOfSize:15*PW];
    
    _moren.frame = CGRectMake(0, _phoneView.frame.origin.y+_phoneView.frame.size.height+10*PH, SCREEN_WIDTH, 51*PH);
    _morenLable.frame = CGRectMake(8*PW, 15*PH, 102*PW, 21*PH);
    _morenLable.font = [UIFont systemFontOfSize:15*PW];
    _morenimg.frame = CGRectMake(351*PW, 18*PH, 16*PW, 16*PW);
    
    _baocun.frame = CGRectMake(252*PW, _moren.frame.origin.y+_moren.frame.size.height+10*PH, 115*PW, 32*PH);
    
    _collectionView.frame = CGRectMake(0, 116*PH, SCREEN_WIDTH, 116*PH);
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    _collectionView .hidden = YES;
}
@end
