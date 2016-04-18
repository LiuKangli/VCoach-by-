//
//  My-self-user-cell3.m
//  VCoach
//
//  Created by Moon on 16/1/13.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "My-self-user-cell3.h"
#import "VTeacher.pch"
@implementation My_self_user_cell3
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self) {
        self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
        self.backgroundColor = [UIColor colorWithRed:0.886f green:0.886f blue:0.886f alpha:1.00f];
        [self views];
    }
    return  self;
}
-(void)views{
    UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(5, 5,SCREEN_WIDTH-10 , 55)];
    backView.backgroundColor = [UIColor whiteColor];
    backView.layer.masksToBounds = YES;
    backView.layer.cornerRadius = 4.0;
    [self.contentView addSubview:backView];
    
    _image = [[UIImageView alloc ]initWithFrame:CGRectMake(15,(60-15)/2 , 15, 15)];
    _image.image = [UIImage imageNamed:@""];
    [backView addSubview:_image];
    
    _name = [[UILabel alloc]initWithFrame:CGRectMake(25+_image.frame.size.width, 20, 100, 20)];
    //_name.backgroundColor = [UIColor redColor];
    _name.textColor = [UIColor blackColor];
    _name.font = [UIFont systemFontOfSize:14];
    [backView addSubview:_name];
    
    UIImageView*right = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-25, 25, 10, 15)];
    right.image = [UIImage imageNamed:@"goright.png"];
   // right.backgroundColor = [UIColor redColor];
    [backView addSubview:right];

    
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
