//
//  Second-TeacherDetail-cell1.h
//  VCoach
//
//  Created by Moon on 16/1/9.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Second_TeacherDetail_cell1 : UITableViewCell
@property (nonatomic,strong) UIImageView *headImage;
@property (nonatomic,strong) UILabel *className;
@property (nonatomic,strong) UILabel *money;
@property (nonatomic,strong) UIImageView *yuan;
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
@end
