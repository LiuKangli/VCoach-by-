//
//  PayresultViewController.h
//  VCoach
//
//  Created by apple on 15/5/13.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PayresultViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *BackBtn;
//订单View
@property (weak, nonatomic) IBOutlet UIView *orderView;
//订单号Lable
@property (weak, nonatomic) IBOutlet UILabel *orderNameLable;
//订单号
@property (weak, nonatomic) IBOutlet UILabel *orderNamePassword;
//支付结果Lable

@property (weak, nonatomic) IBOutlet UILabel *payresultLable;
//支付结果Lable1
@property (weak, nonatomic) IBOutlet UILabel *lable1;

@property (nonatomic,strong) NSString *orderName;//订单号

@property (nonatomic,strong) NSString *payresultLable1;
@property (nonatomic,strong) NSString *lable11;
@property (nonatomic) BOOL hidden;
@property (weak, nonatomic) IBOutlet UIImageView *resultImage;
@property (weak, nonatomic) IBOutlet UIView *backView;

@property (weak, nonatomic) IBOutlet UIImageView *backViewImage;
@property (weak, nonatomic) IBOutlet UIButton *realBack;

@property (weak, nonatomic) IBOutlet UILabel *backLable;

@end
