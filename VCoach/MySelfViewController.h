//
//  MySelfViewController.h
//  VCoach
//
//  Created by apple on 15/4/27.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MySelfViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *goorder;
@property (weak, nonatomic) IBOutlet UIImageView *gooderImage;
@property (weak, nonatomic) IBOutlet UILabel *gooderLable;
@property (weak, nonatomic) IBOutlet UIImageView *gooderImage1;



@property (weak, nonatomic) IBOutlet UIButton *goadress;
@property (weak, nonatomic) IBOutlet UIImageView *adressimage;
@property (weak, nonatomic) IBOutlet UIImageView *adressImage1;
@property (weak, nonatomic) IBOutlet UILabel *adressLable;

@property (weak, nonatomic) IBOutlet UIView *textview;


@property (weak, nonatomic) IBOutlet UIView *qianmingview;
@property (weak, nonatomic) IBOutlet UIImageView *qianminagImage;

@property (weak, nonatomic) IBOutlet UIView *userView;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *userLable;
@property (weak, nonatomic) IBOutlet UILabel *userYuan;
@property (weak, nonatomic) IBOutlet UILabel *userMoney;
@property (weak, nonatomic) IBOutlet UIImageView *userHeadImage;

@property (weak, nonatomic) IBOutlet UILabel *userSex;
@property (weak, nonatomic) IBOutlet UIImageView *userRightImage;
@property (weak, nonatomic) IBOutlet UIImageView *userMoneyImage;



@property (weak, nonatomic) IBOutlet UIButton *gologin;

@property (weak, nonatomic) IBOutlet UIView *moreView;
@property (weak, nonatomic) IBOutlet UIImageView *moreImage;
@property (weak, nonatomic) IBOutlet UIImageView *moreImage1;
@property (weak, nonatomic) IBOutlet UILabel *moreLable;


@property (weak, nonatomic) IBOutlet UILabel *usersign;
@property (weak, nonatomic) IBOutlet UIView *loginView;
@property (weak, nonatomic) IBOutlet UILabel *loginLable;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;


@property (nonatomic,strong) NSDictionary *userData;

//
@property (weak, nonatomic) IBOutlet UIView *backView;
@property (weak, nonatomic) IBOutlet UIImageView *backImage;


@end
