//
//  ClassinfoViewController.m
//  VCoach
//
//  Created by apple on 15/5/4.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ClassinfoViewController.h"
#import "PostBuyViewController.h"
#import "DejalActivityView.h"
#import "ReqlyViewController.h"
#import "PostClass.h"
#import "Constants.h"
#import "LoginViewController.h"
#import "VTeacher.pch"
@interface ClassinfoViewController (){

    NSString *name;
    NSString *cprice;
    NSDictionary *finaData;
}

@end

@implementation ClassinfoViewController
-(void)viewWillAppear:(BOOL)animated{
   hiddenTabbar(YES)
    NSString*wlzt=[[NSUserDefaults standardUserDefaults]stringForKey:@"WLZT"];
    if ([wlzt isEqualToString:@"no_net"]) {
        UIAlertView *ba = [[UIAlertView alloc]initWithTitle:@"蜂窝移动数据已关闭" message:@"启用蜂窝移动数据或无线局域网来访问数据" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
        [ba show];
    }else{
    NSThread *the = [[NSThread alloc]initWithTarget:self selector:@selector(initdata) object:nil];
    [the start];
    }
    //self.view.backgroundColor = [UIColor whiteColor];
}
- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self viewsLayouts];
    _scrollerView.bounces = NO;
    [self.realBack addTarget:self action:@selector(popView) forControlEvents:UIControlEventTouchDown];
    self.classButton.layer.borderColor = [[UIColor redColor]CGColor];
    self.classButton.layer.borderWidth = 1;
    
    [self.done addTarget:self action:@selector(Place_the_order) forControlEvents:UIControlEventTouchDown];
    [self.classButton addTarget:self action:@selector(Place_the_order) forControlEvents:UIControlEventTouchDown];
    
    UITapGestureRecognizer *resger = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(view3Touch)];
    [self.classView3 addGestureRecognizer:resger];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dats:(NSDictionary *)dd{
    
    NSString *url = [[dd objectForKey:@"class_info"]objectForKey:@"ad_image_url"];
    NSArray *bottomUrl = [dd objectForKey:@"class_photos"];
    if ([[url substringToIndex:4]isEqualToString:@"http"]) {
        [self.classImage sd_setImageWithURL:[NSURL URLWithString:url]];
    }else{
        [self.classImage sd_setImageWithURL:[NSURL URLWithString:[ImageUrl stringByAppendingString:url]]];
    }
    self.classjianjie.text = [[dd objectForKey:@"class_info"]objectForKey:@"simple_introduce"];
    self.classprice.text = [[dd objectForKey:@"class_info"]objectForKey:@"price"];
    self.classdetail.text = [[dd objectForKey:@"class_detail"]objectForKey:@"class_detail"];
    self.className.text = [[dd objectForKey:@"class_info"]objectForKey:@"title"];
    for (int i = 0; i<bottomUrl.count; i++) {
        if ([[[[bottomUrl objectAtIndex:i] objectForKey:@"pic_url"]substringToIndex:4]isEqualToString:@"http"]) {
            
        }else{
            NSString *url = [[bottomUrl objectAtIndex:0]objectForKey:@"pic_url"];
             NSString *url1 = [[bottomUrl objectAtIndex:1]objectForKey:@"pic_url"];
            [self.image1 sd_setImageWithURL:[NSURL URLWithString:[ImageUrl stringByAppendingString:url]]];
            [self.image2 sd_setImageWithURL:[NSURL URLWithString:[ImageUrl stringByAppendingString:url1]]];
        }
    }
    
   
    //全部评价
    NSString *num = [[dd objectForKey:@"reply_infomation"]objectForKey:@"reply_sum"];
    NSString *tex = @"全部评价";
    NSString *fina = [NSString stringWithFormat:@"%@%@%@",tex,num,@"条"];
    self.pingjia.text =fina;
    //好评度
    NSString *num1 = [[dd objectForKey:@"reply_infomation"]objectForKey:@"good_point_persent"];
    NSString *tex1 = @"好评度";
    NSString *fina1 = [NSString stringWithFormat:@"%@%@%@",num1,@"%",tex1];
    self.haoping.text = fina1;

    //_classjianjie.numberOfLines = 0;
    NSMutableParagraphStyle *ppp = [[NSMutableParagraphStyle alloc]init];
    ppp.lineBreakMode = NSLineBreakByCharWrapping;
    NSDictionary *attribute = @{NSFontAttributeName:_classdetail.font,NSParagraphStyleAttributeName:ppp.copy};
    CGSize size = [_classdetail.text boundingRectWithSize:CGSizeMake(_classdetail.frame.size.width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    _classdetail.lineBreakMode = NSLineBreakByCharWrapping;
    _classdetail.frame = CGRectMake(_classdetail.frame.origin.x, _classdetail.frame.origin.y, _classdetail.frame.size.width, size.height);
    if (bottomUrl.count == 0) {
        _image1.hidden = YES;
        _image2.hidden = YES;
        _classView2.frame =CGRectMake(_classView2.frame.origin.x, _classView2.frame.origin.y, _classView2.frame.size.width, _titleName.frame.size.height+_classdetail.frame.size.height+15);
    }else if (bottomUrl.count == 1){
        _image2.hidden = YES;
         _image1.frame = CGRectMake(_image1.frame.origin.x, _classdetail.frame.origin.y+_classdetail.frame.size.height, _image1.frame.size.width, _image1.frame.size.height);
        _classView2.frame = CGRectMake(_classView2.frame.origin.x, _classView2.frame.origin.y, _classView2.frame.size.width, _titleName.frame.size.height+_classdetail.frame.size.height+_image2.frame.size.height+15);
    }else{
        _image1.frame = CGRectMake(_image1.frame.origin.x, _classdetail.frame.origin.y+_classdetail.frame.size.height, _image1.frame.size.width, _image1.frame.size.height);
        _image2.frame =CGRectMake(_image2.frame.origin.x, _classdetail.frame.origin.y+_classdetail.frame.size.height, _image2.frame.size.width, _image2.frame.size.height);
     _classView2.frame = CGRectMake(_classView2.frame.origin.x, _classView2.frame.origin.y, _classView2.frame.size.width, _titleName.frame.size.height+_classdetail.frame.size.height+_image2.frame.size.height+15);
    }
    
    
    _classView3.frame = CGRectMake(_classView3.frame.origin.x,
                                   _classView2.frame.origin.y+_classView2.frame.size.height+10,
                                   _classView3.frame.size.width, _classView3.frame.size.height);
    
    _scrollerView.contentSize = CGSizeMake(SCREEN_WIDTH, _classView1.frame.size.height+_classView2.frame.size.height+_classView3.frame.size.height+35);
    
    [SVProgressHUD dismiss];
}
- (void)initdata{
    [SVProgressHUD show];
    NSString *finaurl = [MainUrl stringByAppendingString:classDetail];
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:_classID,@"class_id", nil];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    [manager POST:finaurl parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSMutableDictionary *data = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
        if ([[data objectForKey:@"message"]isEqualToString:@"success"]) {
           finaData = [data objectForKey:@"results"];
            [self dats:finaData];
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];

}


-(void)popView{
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)postbuy{

    
}

//评论界面
-(void)view3Touch{

    ReqlyViewController *view = [[ReqlyViewController alloc]initWithNibName:@"ReqlyViewController" bundle:nil];
    view.classID = _classID;
    view.title =@"评论";
    [self.navigationController pushViewController:view animated:YES];

}
//确定下单
-(void)Place_the_order{
    if ([_classprice.text intValue]== 0) {
        
    }else{
        PostBuyViewController *post = [[PostBuyViewController alloc]initWithNibName:@"PostBuyViewController" bundle:nil];
        post.className = [[finaData objectForKey:@"class_info"]objectForKey:@"title"];
        post.KCID = [[finaData objectForKey:@"class_info"]objectForKey:@"class_id"];
        post.where = @"A";
        post.jiage = [[finaData objectForKey:@"class_info"]objectForKey:@"price"];
        post.addressType = @"W";
        NSLog(@"首页第二页面课程ID= %@",_classID);
        [self.navigationController pushViewController:post animated:YES];
    }
   
}
-(void)viewsLayouts{
    
    _backView.frame = CGRectMake(0, 0, 378*PW, 64);
    //_BackBtn.frame = CGRectMake(16, 30, 14, 27);
    _backImage.frame = CGRectMake(0, 0, 378*PW, 64);
    
    _backLable.frame = CGRectMake((SCREEN_WIDTH-68)/2, _BackBtn.frame.origin.y-3, 68, 34);
    _backLable.font = [UIFont systemFontOfSize:17];
    
    _realBack.frame = CGRectMake(2, 8, 82, 54);
    
    _scrollerView.frame = CGRectMake(0, _backView.frame.origin.y+_backView.frame.size.height, SCREEN_WIDTH, 564*PH);
    _classView1.frame = CGRectMake(8*PW, 8*PH, 359*PW, 128*PH);
    
    _litleImage.frame = CGRectMake(341*PW, 0, 10*PW, 10*PW);
    _classImage.frame = CGRectMake(8*PW, 21*PH, 85*PW, 85*PW);
    
    _className.frame = CGRectMake(101*PW, 21*PH, 148*PW, 27*PH);
    _classjianjie.frame = CGRectMake(101*PW, 53*PH, 175*PW, 35*PH);
    _rmb.frame = CGRectMake(101*PW, 96*PH, 23*PW, 19*PH);
    _classprice.frame = CGRectMake(113*PW, 95*PH, 54*PW, 21*PH);
    _yuan.frame = CGRectMake(167*PW, 95*PH, 24*PW, 21*PH);
    _classButton.frame = CGRectMake(289*PW, 93*PH, 62*PW, 24*PH);
    _classButton.titleLabel.font = [UIFont systemFontOfSize:14*PW];
    _imageicon.frame = CGRectMake(8*PW, 5*PH, 13*PW, 14*PH);
    _titleName.frame = CGRectMake(24*PW, 1, 69*PW, 21*PH);
    _titleName.font = [UIFont systemFontOfSize:16*PW];
    
    _classdetail.frame = CGRectMake(8*PW, 27*PH, 343*PW, 174*PH);
    _image1.frame = CGRectMake(8*PW, 213*PH, 168*PW, 128*PH);
    _image2.frame = CGRectMake(183*PW, 214*PH, 168*PW, 128*PH);
    
    _classView2.frame = CGRectMake(8*PW, 141*PH, 359*PW, 350*PH);
    _classView3.frame = CGRectMake(8*PW, 499*PH, 359*PW, 45*PH);
    _icon1.frame = CGRectMake(8*PW, 14*PH, 13*PW, 14*PH);
    _icon2.frame = CGRectMake(341*PW, 15*PH, 10*PW, 12*PH);
    _pingjia.frame = CGRectMake(29*PW, 7*PH, 108*PW, 27*PH);
    _haoping.frame = CGRectMake(223*PW, 9*PH, 108*PW, 27*PH);
    _classView4.frame = CGRectMake(0, 615*PH, SCREEN_WIDTH, 52*PH);
    _done.frame = CGRectMake(280*PW, 10*PH, 79*PW, 32*PH);
    self.view.backgroundColor = [UIColor colorWithRed:0.886f green:0.886f blue:0.886f alpha:1.00f];
    _classView4.backgroundColor = [UIColor colorWithRed:0.886f green:0.886f blue:0.886f alpha:1.00f];
}
-(void)viewDidAppear:(BOOL)animated{
    [SVProgressHUD dismiss];
}
@end
