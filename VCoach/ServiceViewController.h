//
//  ServiceViewController.h
//  VCoach
//
//  Created by apple on 15/4/27.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ServiceViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *leftButtonText;
- (IBAction)leftButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIScrollView *showimage;

@property (weak, nonatomic) IBOutlet UIPageControl *pagecontrol;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;

@property (weak, nonatomic) IBOutlet UIButton *classBtn1;
@property (weak, nonatomic) IBOutlet UIButton *classBtn2;
@property (weak, nonatomic) IBOutlet UIButton *classBtn3;
@property (weak, nonatomic) IBOutlet UIButton *classBtn4;

@property (weak, nonatomic) IBOutlet UIImageView *gongfuimg1;
@property (weak, nonatomic) IBOutlet UIImageView *gongfuimg2;
@property (weak, nonatomic) IBOutlet UIImageView *gongfuimg3;
@property (weak, nonatomic) IBOutlet UIImageView *gongfuimg4;

@property (weak, nonatomic) IBOutlet UILabel *gongfutext1;
@property (weak, nonatomic) IBOutlet UILabel *gongfutext2;
@property (weak, nonatomic) IBOutlet UILabel *gongfutext3;
@property (weak, nonatomic) IBOutlet UILabel *gongfutext4;


@property (nonatomic,strong) NSTimer *Timer;
@property (nonatomic,strong)UITableView *tableView;
//课程View
@property (weak, nonatomic) IBOutlet UIView *ClassVieW;
@property (weak, nonatomic) IBOutlet UIView *TuijianView;
@property (weak, nonatomic) IBOutlet UILabel *TuijianLable;
@property (weak, nonatomic) IBOutlet UIImageView *TuijianImage;

//导航栏view
@property (weak, nonatomic) IBOutlet UIView *NovView;
@property (weak, nonatomic) IBOutlet UIImageView *NovImageView;
@property (weak, nonatomic) IBOutlet UILabel *NovLable;
@property (weak, nonatomic) IBOutlet UIImageView *NovLableImage;
@property (weak, nonatomic) IBOutlet UIButton *NovButton;

@end
