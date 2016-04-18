//
//  AddressViewCell.h
//  VCoach
//
//  Created by apple on 15/5/7.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Addressstatus.h"

@interface AddressViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *username;
@property (weak, nonatomic) IBOutlet UILabel *phone;
@property (weak, nonatomic) IBOutlet UILabel *address;
@property (weak, nonatomic) IBOutlet UIImageView *selectimg;
@property (weak, nonatomic) IBOutlet UIImageView *addressimg;
@property (weak, nonatomic) IBOutlet UILabel *morenimg;

-(void)ser:(int)i;
//+ (NSString *)cellID;
//
//+ (AddressViewCell *)tuijianViewCell;
//
//- (AddressViewCell *)cellWithstatus:(Addressstatus *)status;

@end
