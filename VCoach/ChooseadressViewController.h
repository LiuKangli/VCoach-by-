//
//  ChooseadressViewController.h
//  VCoach
//
//  Created by apple on 15/5/7.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChooseadressViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *realBack;


@property (weak, nonatomic) IBOutlet UIButton *BackBtn;
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (weak, nonatomic) IBOutlet UIView *backView;
@property (weak, nonatomic) IBOutlet UIButton *gonext;
@property (weak, nonatomic) IBOutlet UIButton *makenew;
@property (weak, nonatomic) IBOutlet UIButton *addaddress;

@property (nonatomic,strong) NSString *whereGo;
@property (nonatomic,strong) NSString *KID;
@property (weak, nonatomic) IBOutlet UIButton *bianji;
@property (weak, nonatomic) IBOutlet UIButton *delect;
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UIImageView *topImage;
@property (weak, nonatomic) IBOutlet UILabel *topLable;

@property (weak, nonatomic) IBOutlet UIView *view1;
@property (weak, nonatomic) IBOutlet UILabel *view1Lable;


@property (nonatomic,strong) NSString *JlId;
@property (nonatomic,strong) NSString *typeAd;
@property (nonatomic,strong) NSString *buy_num;
@property (nonatomic,copy)NSString *jiage;
@end
