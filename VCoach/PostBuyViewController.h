//
//  PostBuyViewController.h
//  VCoach
//
//  Created by apple on 15/4/29.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PostBuyViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *BackBtn;
@property (weak, nonatomic) IBOutlet UIView *backView;
@property (weak, nonatomic) IBOutlet UIImageView *backImage;
@property (weak, nonatomic) IBOutlet UILabel *backLable;

@property (weak, nonatomic) IBOutlet UIView *view1;
@property (weak, nonatomic) IBOutlet UIView *view2;
@property (weak, nonatomic) IBOutlet UILabel *view2Left;

@property (weak, nonatomic) IBOutlet UIView *view3;
@property (weak, nonatomic) IBOutlet UILabel *view3Left;

@property (weak, nonatomic) IBOutlet UIButton *subtractNum;
@property (weak, nonatomic) IBOutlet UIButton *addNum;
@property (weak, nonatomic) IBOutlet UILabel *number;
@property (weak, nonatomic) IBOutlet UILabel *moneyNum;
@property (weak, nonatomic) IBOutlet UIButton *postBtn;
@property (weak, nonatomic) IBOutlet UILabel *classname;
@property (weak, nonatomic) IBOutlet UILabel *classprice;
@property (weak, nonatomic) IBOutlet UIButton *gowallet;
@property (weak, nonatomic) IBOutlet UIButton *realBack;


@property (nonatomic,strong) NSString *className;
@property (nonatomic,strong) NSString *jiage;

@property (nonatomic,strong) NSString *where;

@property (nonatomic,strong) NSString *KCID;//课程ID
@property (nonatomic,strong) NSString *jLiD;//教练ID

@property (nonatomic,strong) NSString *addressType;
@end
