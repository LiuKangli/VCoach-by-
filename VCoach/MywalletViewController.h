//
//  MywalletViewController.h
//  VCoach
//
//  Created by apple on 15/5/21.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MywalletViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *BackBtn;
@property (weak, nonatomic) IBOutlet UIButton *getinBtn;
@property (weak, nonatomic) IBOutlet UIButton *changepassword;
@property (weak, nonatomic) IBOutlet UIView *backView;
@property (weak, nonatomic) IBOutlet UIImageView *backImage;
@property (weak, nonatomic) IBOutlet UILabel *backTitle;
@property (weak, nonatomic) IBOutlet UILabel *changeLable;
@property (weak, nonatomic) IBOutlet UIImageView *changeImage;
@property (weak, nonatomic) IBOutlet UIImageView *changeRightImage;
@property (weak, nonatomic) IBOutlet UILabel *changexing;
@property (weak, nonatomic) IBOutlet UILabel *getML;
@property (weak, nonatomic) IBOutlet UILabel *getMM;
@property (weak, nonatomic) IBOutlet UILabel *yuan;
@property (weak, nonatomic) IBOutlet UILabel *getLable;
@property (weak, nonatomic) IBOutlet UIImageView *getImageLeft;
@property (weak, nonatomic) IBOutlet UIImageView *getImageRight;
@property (weak, nonatomic) IBOutlet UIButton *realBack;

@end
