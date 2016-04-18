//
//  Second-TeacherDetail-cell.m
//  VCoach
//
//  Created by Moon on 16/1/9.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "Second-TeacherDetail-cell.h"
#import "VTeacher.pch"
@implementation Second_TeacherDetail_cell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self ) {
        self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
        self.backgroundColor = [UIColor lightGrayColor];
        [self creat];
    }
    return self;
}
-(void)creat{
    UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(5, 0,SCREEN_WIDTH-10 , 170)];
    backView.layer.masksToBounds = YES;
    backView.layer.cornerRadius = 5.0;
    backView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:backView];
    
    UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(10, 5, 20, 25)];
    image.image = [UIImage imageNamed:@"coachinfoimg.png"];
    [backView addSubview:image];
    
    UILabel *teacher = [[UILabel alloc ]initWithFrame:CGRectMake(image.frame.origin.x+image.frame.size.width, 5, 80, 30)];
    teacher.text = @"教练信息";
    
    [backView addSubview:teacher];
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 10+teacher.frame.size.height, backView.frame.size.width, 1)];
    line.backgroundColor = [UIColor lightGrayColor];
    [backView addSubview:line];
    
    //头像
    _headImage = [[UIImageView alloc]initWithFrame:CGRectMake(line.frame.origin.x, line.frame.origin.y+line.frame.size.height+10, 80, 80)];
    _headImage.layer.masksToBounds = YES;
    _headImage.layer.cornerRadius = _headImage.frame.size.width/2;
    [backView addSubview:_headImage];
    
    //姓名 性别
    _name = [[UILabel alloc]initWithFrame:CGRectMake(_headImage.frame.size.width+25, line.frame.origin.y+line.frame.size.height+5, 50, 40)];
    _name.font = [UIFont systemFontOfSize:13];
    [backView addSubview:_name];
    
    _sex = [[UILabel alloc]initWithFrame:CGRectMake(_name.frame.size.width+_name.frame.origin.x, line.frame.origin.y+line.frame.size.height+5, 20, 40)];
    _sex.font = [UIFont systemFontOfSize:13];
    [backView addSubview:_sex];
    
    UIImageView *sexImage = [[UIImageView alloc]initWithFrame:CGRectMake(+_sex.frame.size.width+_sex.frame.origin.x, line.frame.origin.y+line.frame.size.height+17, 15, 15)];
    sexImage.image = [UIImage imageNamed:@"seximg.png"];
    [backView addSubview:sexImage];

    //接单数
    UIImageView *numberImage = [[UIImageView alloc]initWithFrame:CGRectMake(_name.frame.origin.x
                                                                            , _name.frame.origin.y+_name.frame.size.height,
                                                                            13, 13)];
    numberImage.image = [UIImage imageNamed:@"weizhiimg.png"];
    [backView addSubview:numberImage];
    
    _arera = [[UILabel alloc]initWithFrame:CGRectMake(_name.frame.origin.x+numberImage.frame.size.width+5
                                                       ,  _name.frame.origin.y+_name.frame.size.height-12
                                                       , 80, 40)];
    _arera.font = [UIFont systemFontOfSize:13];
    _arera.textAlignment = NSTextAlignmentLeft;
    [backView addSubview:_arera];

    //特长
    UILabel *teC = [[UILabel alloc]initWithFrame:CGRectMake(_name.frame.origin.x, numberImage.frame.origin.y+numberImage.frame.size.height+15, 40, 20)];
    teC.font = [UIFont systemFontOfSize:13];
    teC.textAlignment = NSTextAlignmentLeft;
    teC.text = @"当前级别:";
    [backView addSubview:teC];
    
    _specialty = [[UILabel alloc]initWithFrame:CGRectMake(teC.frame.origin.x+teC.frame.size.width, numberImage.frame.origin.y+numberImage.frame.size.height+15, 100, 20)];
    _specialty.font = [UIFont systemFontOfSize:10];
    _specialty.textAlignment = NSTextAlignmentLeft;
    [backView addSubview:_specialty];
    
    //工作经验
    UILabel *gzjy = [[UILabel alloc]initWithFrame:CGRectMake(teC.frame.origin.x, teC.frame.size.height+teC.frame.origin.y+7, 70, 20)];
    gzjy.font = [UIFont systemFontOfSize:13];
    gzjy.text = @"工作经验:";
    [backView addSubview:gzjy];
    
    
    _Work_experience = [[UILabel alloc ]initWithFrame:CGRectMake(gzjy.frame.origin.x+gzjy.frame.size.width, _specialty.frame.origin.y+numberImage.frame.size.height+15, 100, 20)];
    _Work_experience.font = [UIFont systemFontOfSize:10];
    _Work_experience.textAlignment = NSTextAlignmentLeft;
    [backView addSubview:_Work_experience];


    
    // 地区
    
    _number = [[UILabel alloc]initWithFrame:CGRectMake(backView.frame.size.width-60, line.frame.origin.y+line.frame.size.height+20, 50, 20)];
    //_arera.backgroundColor = [UIColor redColor];
    _number.textAlignment = NSTextAlignmentCenter;
    _number.font = [UIFont systemFontOfSize:10];
    [backView addSubview:_number];
    
    
    UIImageView *arearImage = [[UIImageView alloc]initWithFrame:CGRectMake(backView.frame.size.width-80, line.frame.origin.y+line.frame.size.height+22, 15, 15)];
    arearImage.image = [UIImage imageNamed:@"dingdan.png"];
    [backView addSubview:arearImage];

    
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
