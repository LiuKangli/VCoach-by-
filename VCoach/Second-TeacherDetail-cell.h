//
//  Second-TeacherDetail-cell.h
//  VCoach
//
//  Created by Moon on 16/1/9.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Second_TeacherDetail_cell : UITableViewCell
@property (nonatomic,strong)UIImageView *headImage;//头像
@property (nonatomic,strong) UILabel *name;//姓名
@property (nonatomic,strong) UILabel *number;//接单数
@property (nonatomic,strong) UILabel *specialty;//当前级别
@property (nonatomic,strong) UILabel *Work_experience;//工作经验
@property (nonatomic,strong) UILabel *arera;//地区
@property (nonatomic,strong) UILabel *sex;//性别
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
@end
