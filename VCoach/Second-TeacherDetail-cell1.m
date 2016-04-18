//
//  Second-TeacherDetail-cell1.m
//  VCoach
//
//  Created by Moon on 16/1/9.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "Second-TeacherDetail-cell1.h"
#import "VTeacher.pch"
@implementation Second_TeacherDetail_cell1
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self) {
        self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
        self.backgroundColor = [UIColor lightGrayColor];
        [self creatView];
    }
    return self;
}
-(void)creatView{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(5, 5,SCREEN_WIDTH-10 , 80)];
    view.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:view];
    
    _headImage = [[UIImageView alloc]initWithFrame:CGRectMake(10, 15, 80, 50)];
    [view addSubview:_headImage];
    
    _className = [[UILabel alloc]initWithFrame:CGRectMake(5+_headImage.frame.size.width+5, 25, 100, 30)];
    _className.font = [UIFont systemFontOfSize:13];
    [view addSubview:_className];
    
    _money = [[UILabel alloc]initWithFrame:CGRectMake(_className.frame.origin.x+_className.frame.size.width+10, 25, 50, 30)];
    _money.font = [UIFont systemFontOfSize:13];
    [view addSubview:_money];
    
    _yuan = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-55, (view.frame.size.height-25)/2, 25, 25)];
    _yuan.image = [UIImage imageNamed:@"yuanioc.png"];
    [view addSubview:_yuan];
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-80, 5, 1, view.frame.size.height-10)];
    line.backgroundColor = [UIColor colorWithRed:0.718f green:0.569f blue:0.459f alpha:1.00f];
    [view addSubview:line];
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    NSLog(@"点击了");
    //_yuan.image = [UIImage imageNamed:@"xuanzebtn.png"];
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
