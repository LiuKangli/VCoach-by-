//
//  ChoosetimeViewController.h
//  VCoach
//
//  Created by apple on 15/5/22.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChoosetimeViewController : UIViewController


@property (weak, nonatomic) IBOutlet UIButton *BackBtn;
@property (weak, nonatomic) IBOutlet UIButton *realback;

@property (nonatomic,strong) NSString *JliD;//教练ID
@property (nonatomic,strong) NSString *DindanShu;//订单数
@property (nonatomic,strong) NSString *dizhiID;//地址id
@property (nonatomic,strong) NSString *clsaaID;

//导航栏Viwe
@property (weak, nonatomic) IBOutlet UIView *DView;
@property (weak, nonatomic) IBOutlet UIImageView *DVimage;
@property (weak, nonatomic) IBOutlet UIButton *DVbackbutton;
@property (weak, nonatomic) IBOutlet UILabel *DVTitle;



@property (weak, nonatomic) IBOutlet UIView *daysTopView;
@property (weak, nonatomic) IBOutlet UIView *daysTopLine;
@property (weak, nonatomic) IBOutlet UIButton *Today;

@property (weak, nonatomic) IBOutlet UIButton *Tomorrow;


@property (weak, nonatomic) IBOutlet UIButton *houTian;

@property (weak, nonatomic) IBOutlet UIButton *FinaDay;

@property (nonatomic,strong) UITextField *filed;
//付款View
@property (weak, nonatomic) IBOutlet UIView *payView;
@property (weak, nonatomic) IBOutlet UIImageView *qianbaoImage;
@property (weak, nonatomic) IBOutlet UIView *line;
@property (weak, nonatomic) IBOutlet UIButton *qianbaoButton;
@property (weak, nonatomic) IBOutlet UIButton *ZFB;
@property (weak, nonatomic) IBOutlet UIImageView *ZFBImage;


@property (weak, nonatomic) IBOutlet UIButton *tijiao;
//提示View
@property (weak, nonatomic) IBOutlet UIView *TiV1;

@property (weak, nonatomic) IBOutlet UIView *TiV2;
@property (weak, nonatomic) IBOutlet UILabel *TiL1;
@property (weak, nonatomic) IBOutlet UILabel *TiL2;

@property (weak, nonatomic) IBOutlet UILabel *llable;

@property (weak, nonatomic) IBOutlet UICollectionView *colle;

@property (weak, nonatomic) IBOutlet UIView *inputPasswordView;
@property (weak, nonatomic) IBOutlet UIImageView *InImage;
@property (weak, nonatomic) IBOutlet UILabel *Inlable;
@property (weak, nonatomic) IBOutlet UIView *Inline;
@property (weak, nonatomic) IBOutlet UILabel *InMonLable;
@property (weak, nonatomic) IBOutlet UILabel *InMoney;
@property (weak, nonatomic) IBOutlet UIView *view1;
@property (weak, nonatomic) IBOutlet UITextField *IntextFiled;
@property (weak, nonatomic) IBOutlet UIView *view2;
@property (weak, nonatomic) IBOutlet UIView *view3;
@property (weak, nonatomic) IBOutlet UIView *view4;
@property (weak, nonatomic) IBOutlet UIView *view5;
@property (weak, nonatomic) IBOutlet UIView *view6;
@property (weak, nonatomic) IBOutlet UIButton *InGoNext;
@property (weak, nonatomic) IBOutlet UIView *view11;
@property (weak, nonatomic) IBOutlet UIView *view22;
@property (weak, nonatomic) IBOutlet UIView *view33;
@property (weak, nonatomic) IBOutlet UIView *view44;
@property (weak, nonatomic) IBOutlet UIView *view55;
@property (weak, nonatomic) IBOutlet UIView *view66;

@property (nonatomic,copy)NSString *price;
@end
