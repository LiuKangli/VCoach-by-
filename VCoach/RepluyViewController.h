//
//  RepluyViewController.h
//  VCoach
//
//  Created by apple on 15/5/14.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RepluyViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *realback;

@property (weak, nonatomic) IBOutlet UILabel *backTitle;
@property (weak, nonatomic) IBOutlet UIImageView *backImage;
@property (weak, nonatomic) IBOutlet UITextView *replytext;
@property (weak, nonatomic) IBOutlet UIButton *SaveBtn;
@property (weak, nonatomic) IBOutlet UIButton *BackBtn;
@property (weak, nonatomic) IBOutlet UILabel *strnumber;
@property (weak, nonatomic) IBOutlet UIView *backView;
@property (weak, nonatomic) IBOutlet UIButton *goodButton;
@property (weak, nonatomic) IBOutlet UILabel *badLable;
@property (weak, nonatomic) IBOutlet UIButton *badButton;
@property (weak, nonatomic) IBOutlet UILabel *goodLable;

@property (nonatomic,strong) NSString *orderID;

@property (weak, nonatomic) IBOutlet UIButton *goodB1;
@property (weak, nonatomic) IBOutlet UIButton *badB1;

@end
