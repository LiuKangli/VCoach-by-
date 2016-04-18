//
//  orderViewCell.h
//  VCoach
//
//  Created by apple on 15/5/19.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "orderstatus.h"

@interface orderViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *statusimg;
@property (weak, nonatomic) IBOutlet UILabel *classtitle;
@property (weak, nonatomic) IBOutlet UILabel *jianjie;
@property (weak, nonatomic) IBOutlet UIImageView *classimg;
@property (weak, nonatomic) IBOutlet UILabel *price;
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
//+ (NSString *)cellID;
//
//+ (orderViewCell *)tuijianViewCell;
//
//- (orderViewCell *)cellWithstatus:(orderstatus *)status;


@end
