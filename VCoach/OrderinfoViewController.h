//
//  OrderinfoViewController.h
//  VCoach
//
//  Created by apple on 15/5/14.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderinfoViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *BackBtn;

@property (weak, nonatomic) IBOutlet UILabel *coachname;
@property (weak, nonatomic) IBOutlet UILabel *sex;
@property (weak, nonatomic) IBOutlet UIImageView *coachimg;
@property (weak, nonatomic) IBOutlet UILabel *work_experience;
@property (weak, nonatomic) IBOutlet UILabel *coachrook;
@property (weak, nonatomic) IBOutlet UILabel *trans_sum;


@property (weak, nonatomic) IBOutlet UIButton *replyBtn;//评价
@property (weak, nonatomic) IBOutlet UIButton *delorder;//删除
@property (weak, nonatomic) IBOutlet UIButton *buyIt;//付款
@property (weak, nonatomic) IBOutlet UIButton *realback;


@property (weak, nonatomic) IBOutlet UILabel *classname;//课程名
@property (weak, nonatomic) IBOutlet UILabel *classtitle;//课程简介
@property (weak, nonatomic) IBOutlet UILabel *classprice;//价格
@property (weak, nonatomic) IBOutlet UIImageView *classimg;//图片

@property (weak, nonatomic) IBOutlet UIButton *seepw;
@property (weak, nonatomic) IBOutlet UILabel *password;
@property (weak, nonatomic) IBOutlet UIView *passwordview;

@property (weak, nonatomic) IBOutlet UIButton *cancalorder;
@property (weak, nonatomic) IBOutlet UIButton *payBtn;
@property (weak, nonatomic) IBOutlet UIView *replyview;
@property (weak, nonatomic) IBOutlet UIView *payview;



@property (nonatomic,strong)NSString *Cname;
@property (nonatomic,strong)NSString*Ctitle;
@property (nonatomic,strong)NSString *Cprice;
@property (nonatomic,strong)NSString *Cimage;
@property (nonatomic,strong)NSString *TeacherId;

@property (nonatomic,assign)NSString*order_status;

@property (weak, nonatomic) IBOutlet UIView *backView;

@property (weak, nonatomic) IBOutlet UILabel *backTitle;
@property (weak, nonatomic) IBOutlet UIView *View1;
@property (weak, nonatomic) IBOutlet UIImageView *view1Image;
@property (weak, nonatomic) IBOutlet UILabel *view1Lable;
@property (weak, nonatomic) IBOutlet UIView *view2;
@property (weak, nonatomic) IBOutlet UIImageView *sexImage;
@property (weak, nonatomic) IBOutlet UIImageView *dingdanImage;
@property (weak, nonatomic) IBOutlet UILabel *jibie;

@property (weak, nonatomic) IBOutlet UILabel *jingyan;
@property (weak, nonatomic) IBOutlet UIView *view3;
@property (weak, nonatomic) IBOutlet UILabel *view3yuan;
@property (weak, nonatomic) IBOutlet UILabel *view3yuanhou;
@property (weak, nonatomic) IBOutlet UIImageView *backImage;
@property (weak, nonatomic) IBOutlet UIView *view4;

@property (weak, nonatomic) IBOutlet UIButton *yishangke;
@property (weak, nonatomic) IBOutlet UILabel *yishangkeLable;
@property (weak, nonatomic) IBOutlet UILabel *waitShangke;

@property (nonatomic,strong) NSString *orderID;

//

@property (weak, nonatomic) IBOutlet UIView *payView;
@property (weak, nonatomic) IBOutlet UIImageView *QianbaoImage;

@property (weak, nonatomic) IBOutlet UIView *Line;
@property (weak, nonatomic) IBOutlet UIButton *qiaobaoButton;
@property (weak, nonatomic) IBOutlet UIButton *ZFB;
@property (weak, nonatomic) IBOutlet UIImageView *ZFBImage;

@property (weak, nonatomic) IBOutlet UIView *inputPassworkView;
@property (weak, nonatomic) IBOutlet UILabel *Inlable;
@property (weak, nonatomic) IBOutlet UIView *Inline;
@property (weak, nonatomic) IBOutlet UILabel *inmonLable;
@property (weak, nonatomic) IBOutlet UILabel *inMoney;
@property (weak, nonatomic) IBOutlet UIView *SView1;
@property (weak, nonatomic) IBOutlet UITextField *intextFiled;
@property (weak, nonatomic) IBOutlet UIView *SV11;
@property (weak, nonatomic) IBOutlet UIView *SView2;
@property (weak, nonatomic) IBOutlet UIView *SV22;
@property (weak, nonatomic) IBOutlet UIView *SView3;
@property (weak, nonatomic) IBOutlet UIView *SV33;
@property (weak, nonatomic) IBOutlet UIView *SView4;
@property (weak, nonatomic) IBOutlet UIView *SV44;
@property (weak, nonatomic) IBOutlet UIView *SView5;
@property (weak, nonatomic) IBOutlet UIView *SV55;
@property (weak, nonatomic) IBOutlet UIView *SView6;
@property (weak, nonatomic) IBOutlet UIView *SV66;
@property (weak, nonatomic) IBOutlet UIButton *queding;
@property (weak, nonatomic) IBOutlet UIImageView *inImage;

@property (nonatomic,strong) UITextField *filed;
@property (nonatomic,copy) NSString *jiage;
@end
