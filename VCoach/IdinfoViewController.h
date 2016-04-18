//
//  IdinfoViewController.h
//  VCoach
//
//  Created by apple on 15/5/20.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IdinfoViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *userimg;
@property (weak, nonatomic) IBOutlet UIButton *nameBtn;
@property (weak, nonatomic) IBOutlet UIView *headImage;
@property (weak, nonatomic) IBOutlet UIView *nametouch;
@property (weak, nonatomic) IBOutlet UIView *sexTouch;
@property (weak, nonatomic) IBOutlet UIView *moneyTouch;
@property (weak, nonatomic) IBOutlet UIView *qianmingTouch;
@property (weak, nonatomic) IBOutlet UILabel *gowellet;
@property (weak, nonatomic) IBOutlet UIButton *sexBtn;
@property (weak, nonatomic) IBOutlet UIButton *passwordBtn;
@property (weak, nonatomic) IBOutlet UIButton *BackBtn;
@property (weak, nonatomic) IBOutlet UILabel *qianmLable;
@property (weak, nonatomic) IBOutlet UIButton *qianm;
@property (weak, nonatomic) IBOutlet UIView *backView;
@property (weak, nonatomic) IBOutlet UIImageView *backImage;
@property (weak, nonatomic) IBOutlet UIButton *backTitle;
@property (weak, nonatomic) IBOutlet UILabel *headL;
@property (weak, nonatomic) IBOutlet UIButton *headB;
@property (weak, nonatomic) IBOutlet UIButton *realback;

@property (weak, nonatomic) IBOutlet UILabel *nameLable;
@property (weak, nonatomic) IBOutlet UIButton *nameRightImage;
@property (weak, nonatomic) IBOutlet UILabel *qianmL;
@property (weak, nonatomic) IBOutlet UIButton *qianmB;
@property (weak, nonatomic) IBOutlet UILabel *sexL;
@property (weak, nonatomic) IBOutlet UIButton *sexB;
@property (weak, nonatomic) IBOutlet UIButton *qianbaoB;
@property (weak, nonatomic) IBOutlet UILabel *qianbaoL;

@property (nonatomic,assign)NSDictionary *data;
@property (nonatomic,strong) UIImage *avatar;



@end
