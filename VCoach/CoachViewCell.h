//
//  CoachViewCell.h
//  VCoach
//
//  Created by apple on 15/4/27.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CoachViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *coachimg;
@property (weak, nonatomic) IBOutlet UILabel *coachname;
@property (weak, nonatomic) IBOutlet UILabel *sex;
@property (weak, nonatomic) IBOutlet UILabel *area;
@property (weak, nonatomic) IBOutlet UILabel *dannum;
@property (weak, nonatomic) IBOutlet UILabel *speciality;
@property (weak, nonatomic) IBOutlet UILabel *work_experience;
@property (weak, nonatomic) IBOutlet UIView *coachview;
@property (weak, nonatomic) IBOutlet UIImageView *areraImage;
@property (weak, nonatomic) IBOutlet UILabel *gzjy;
@property (weak, nonatomic) IBOutlet UIImageView *danimagr;

@property (weak, nonatomic) IBOutlet UILabel *tecT;

//+ (NSString *)cellID;
//
//+ (CoachViewCell *)tuijianViewCell;
//
//- (CoachViewCell *)cellWithstatus:(Coachstatus *)status;


@end
