//
//  MoreViewController.h
//  VCoach
//
//  Created by apple on 15/5/7.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MoreViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *realback;

- (IBAction)gonew:(id)sender;
- (IBAction)gozhaoping:(id)sender;
- (IBAction)gofuwu:(id)sender;
- (IBAction)aboutus:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *BackBtn;

- (IBAction)exit:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *exitLable;
@property (weak, nonatomic) IBOutlet UIView *backView;
@property (weak, nonatomic) IBOutlet UILabel *backLable;
@property (weak, nonatomic) IBOutlet UILabel *zhaoping;
@property (weak, nonatomic) IBOutlet UIImageView *zhaopingImage;
@property (weak, nonatomic) IBOutlet UILabel *fuwu;
@property (weak, nonatomic) IBOutlet UIImageView *fuwuImage;
@property (weak, nonatomic) IBOutlet UILabel *xiaoxi;
@property (weak, nonatomic) IBOutlet UIImageView *xiaoxiImage;
@property (weak, nonatomic) IBOutlet UILabel *guanyu;
@property (weak, nonatomic) IBOutlet UIImageView *guanyuImage;
@property (weak, nonatomic) IBOutlet UIImageView *backImage;
@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet UIButton *button3;
@property (weak, nonatomic) IBOutlet UIButton *button4;
@property (weak, nonatomic) IBOutlet UIButton *button5;
@property (weak, nonatomic) IBOutlet UIImageView *x1;
@property (weak, nonatomic) IBOutlet UIImageView *x2;
@property (weak, nonatomic) IBOutlet UIImageView *x3;
@property (weak, nonatomic) IBOutlet UIImageView *x4;

@end
