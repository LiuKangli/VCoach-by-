//
//  My-self-user-cell3.h
//  VCoach
//
//  Created by Moon on 16/1/13.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface My_self_user_cell3 : UITableViewCell
@property (nonatomic,strong) UILabel *name;
@property (nonatomic,strong) UIImageView *image;
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
@end
