//
//  AttestationViewController.h
//  VCoach
//
//  Created by Moon on 16/1/20.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AttestationViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *view0;
@property (weak, nonatomic) IBOutlet UILabel *topTitle;
@property (weak, nonatomic) IBOutlet UIButton *BackButton;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *view1;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UILabel *shenggao;
@property (weak, nonatomic) IBOutlet UILabel *hight;
@property (weak, nonatomic) IBOutlet UILabel *jiguan;
@property (weak, nonatomic) IBOutlet UILabel *province;
@property (weak, nonatomic) IBOutlet UIImageView *headImage;
@property (weak, nonatomic) IBOutlet UIView *line;
@property (weak, nonatomic) IBOutlet UILabel *titlee;

@property (weak, nonatomic) IBOutlet UIView *view2;
@property (weak, nonatomic) IBOutlet UILabel *view2Title;
@property (weak, nonatomic) IBOutlet UILabel *texts;
@property (weak, nonatomic) IBOutlet UILabel *techang;
- (IBAction)backbeforeView:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *backImage;

@property (weak, nonatomic) IBOutlet UIButton *backButton1;

@property (weak, nonatomic) IBOutlet UIView *view3;
@property (weak, nonatomic) IBOutlet UIView *line1;
@property (weak, nonatomic) IBOutlet UILabel *view3Title;
@property (weak, nonatomic) IBOutlet UIImageView *view3Image1;
@property (weak, nonatomic) IBOutlet UIImageView *view3Image2;

@property (nonatomic,strong) UIView *view4;
@property (nonatomic,strong) UILabel *view4Title;
@property (nonatomic,strong) UIImageView *ima1;
@property (nonatomic,strong) UIImageView *ima2;
@property (nonatomic,strong) UIImageView *ima3;
@property (nonatomic,strong) UIImageView *ima4;
@property (nonatomic,strong) UIImageView *ima5;
@property (nonatomic,strong) UIView *line2;
@property (weak, nonatomic) IBOutlet UILabel *tec;

//评价
@property (strong, nonatomic)  UIView *view44;
@property (strong, nonatomic)  UILabel *view44Title;
@property (nonatomic,strong) UITableView *view4TableView;

@property (nonatomic,strong) NSString *cocahID;
@end
