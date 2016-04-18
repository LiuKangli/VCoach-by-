//
//  ReqlyViewController.h
//  VCoach
//
//  Created by apple on 15/5/5.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReqlyViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *BackBtn;
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (weak, nonatomic) IBOutlet UIImageView *backImage;
- (IBAction)backButton:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *backLable;

@property (weak, nonatomic) IBOutlet UIView *backView;

@property (nonatomic,strong) NSString *classID;
@end
