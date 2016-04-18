//
//  MyorderViewController.h
//  VCoach
//
//  Created by apple on 15/5/14.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyorderViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *realback;

@property (weak, nonatomic) IBOutlet UIView *listView;
@property (weak, nonatomic) IBOutlet UIButton *noYet;//待确认
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (weak, nonatomic) IBOutlet UIView *backView;
@property (weak, nonatomic) IBOutlet UIButton *BackBtn;
@property (weak, nonatomic) IBOutlet UILabel *backTitle;
@property (weak, nonatomic) IBOutlet UIImageView *backImage;

@property (weak, nonatomic) IBOutlet UIButton *allBtn;//全部
@property (weak, nonatomic) IBOutlet UIButton *nopayBtn;//待付款
@property (weak, nonatomic) IBOutlet UIButton *nouseBtn;//待使用
@property (weak, nonatomic) IBOutlet UIButton *noreplyBtn;//待评价
@property (weak, nonatomic) IBOutlet UIView *xianview;
@property (weak, nonatomic) IBOutlet UILabel *notext;

@end
