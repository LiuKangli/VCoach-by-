//
//  ClassinfoViewController.h
//  VCoach
//
//  Created by apple on 15/5/4.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClassinfoViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *BackBtn;
@property (weak, nonatomic) IBOutlet UIView *backView;
@property (weak, nonatomic) IBOutlet UIImageView *backImage;
@property (weak, nonatomic) IBOutlet UILabel *backLable;



@property (weak, nonatomic) IBOutlet UIScrollView *scrollerView;

@property (weak, nonatomic) IBOutlet UIView *classView1;
@property (weak, nonatomic) IBOutlet UIImageView *classImage;
@property (weak, nonatomic) IBOutlet UILabel *className;
@property (weak, nonatomic) IBOutlet UILabel *classjianjie;
@property (weak, nonatomic) IBOutlet UILabel *rmb;
@property (weak, nonatomic) IBOutlet UILabel *classprice;
@property (weak, nonatomic) IBOutlet UILabel *yuan;
@property (weak, nonatomic) IBOutlet UIButton *classButton;
@property (weak, nonatomic) IBOutlet UIImageView *litleImage;
@property (weak, nonatomic) IBOutlet UIButton *realBack;


@property (weak, nonatomic) IBOutlet UIView *classView2;
@property (weak, nonatomic) IBOutlet UIImageView *imageicon;
@property (weak, nonatomic) IBOutlet UILabel *titleName;
@property (weak, nonatomic) IBOutlet UILabel *classdetail;

@property (weak, nonatomic) IBOutlet UIImageView *image1;
@property (weak, nonatomic) IBOutlet UIImageView *image2;


@property (weak, nonatomic) IBOutlet UIView *classView3;
@property (weak, nonatomic) IBOutlet UIImageView *icon1;
@property (weak, nonatomic) IBOutlet UIImageView *icon2;
@property (weak, nonatomic) IBOutlet UILabel *pingjia;
@property (weak, nonatomic) IBOutlet UILabel *haoping;


@property (weak, nonatomic) IBOutlet UIView *classView4;

@property (weak, nonatomic) IBOutlet UIButton *done;


@property (nonatomic,strong) NSString *classID;
@end
