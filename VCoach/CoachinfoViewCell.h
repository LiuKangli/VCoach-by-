//
//  CoachinfoViewCell.h
//  VCoach
//
//  Created by apple on 15/4/28.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Coachinfostatus.h"

@interface CoachinfoViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *selectimg;
@property (weak, nonatomic) IBOutlet UIImageView *classimg;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UIView *coachview;

@property (weak, nonatomic) IBOutlet UIView *line;
@property (weak, nonatomic) IBOutlet UILabel *yuan;

-(void)ser:(int)i;
//+ (NSString *)cellID;
//
//+ (CoachinfoViewCell *)tuijianViewCell;
//
//- (CoachinfoViewCell *)cellWithstatus:(Coachinfostatus *)status;
//
@end
