//
//  My-self-user-cell1.h
//  VCoach
//
//  Created by Moon on 16/1/13.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface My_self_user_cell1 : UITableViewCell
@property (nonatomic,strong) UIImageView *headImage;
@property (nonatomic,strong) UILabel *name;
@property (nonatomic,strong) UILabel *money;
@property (nonatomic,strong) UILabel *sex;
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
@end
