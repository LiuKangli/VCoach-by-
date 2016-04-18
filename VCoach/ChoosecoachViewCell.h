//
//  ChoosecoachViewCell.h
//  VCoach
//
//  Created by apple on 15/5/18.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Choosecoachstatus.h"

@interface ChoosecoachViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *head_pic;
@property (weak, nonatomic) IBOutlet UILabel *coacher_name;
@property (weak, nonatomic) IBOutlet UILabel *coacher_sex;
@property (weak, nonatomic) IBOutlet UILabel *order_sum;
@property (weak, nonatomic) IBOutlet UILabel *coacher_speciality;
@property (weak, nonatomic) IBOutlet UILabel *coacher_experience;
@property (weak, nonatomic) IBOutlet UILabel *choosebtn;


+ (NSString *)cellID;

+ (ChoosecoachViewCell *)tuijianViewCell;

- (ChoosecoachViewCell *)cellWithstatus:(Choosecoachstatus *)status;



@end
