//
//  choosecoachViewController.h
//  VCoach
//
//  Created by apple on 15/5/12.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface choosecoachViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *realback;

@property (weak, nonatomic) IBOutlet UIButton *BackBtn;
@property (weak, nonatomic) IBOutlet UIButton *postBtn;
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (weak, nonatomic) IBOutlet UIImageView *backImage;
@property (weak, nonatomic) IBOutlet UILabel *backLable;
@property (weak, nonatomic) IBOutlet UIView *view1;
@property (weak, nonatomic) IBOutlet UILabel *view1Lable;
@property (weak, nonatomic) IBOutlet UIView *backView;

@property (nonatomic,strong) NSString *kCid;
@property (nonatomic,strong) NSString *adressId;
@property (nonatomic,strong) NSString *dIngdS;
@property (nonatomic,copy) NSString*jAge;
@end
