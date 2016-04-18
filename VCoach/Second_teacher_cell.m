//
//  Second_teacher_cell.m
//  VCoach
//
//  Created by Moon on 16/1/8.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "Second_teacher_cell.h"
#import "VTeacher.pch"
@implementation Second_teacher_cell

- (void)awakeFromNib {
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self) {
        self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
        self.backgroundColor = [UIColor lightGrayColor];
        [self creatViews];
    }
    return self;
}
-(void)creatViews{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(5, 5, SCREEN_WIDTH-10, 150)];
    view.layer.masksToBounds = YES;
    view.layer.cornerRadius = 5.0;
    view.backgroundColor = [UIColor whiteColor];
   
    [self.contentView addSubview:view];
    //头像
    _headImage = [[UIImageView alloc]initWithFrame:CGRectMake(15, 35, 80, 80)];
    _headImage.backgroundColor = [UIColor redColor];
    _headImage.layer.masksToBounds = YES;
    _headImage.layer.cornerRadius = _headImage.frame.size.width/2;
    [view addSubview:_headImage];
    
    //名字
    _name = [[UILabel alloc]initWithFrame:CGRectMake(_headImage.frame.size.width+25, 10, 50, 40)];
    _name.font = [UIFont systemFontOfSize:13];
    [view addSubview:_name];
    
    //性别
    _sex = [[UILabel alloc]initWithFrame:CGRectMake(_name.frame.size.width+_name.frame.origin.x, 10, 20, 40)];
    _sex.font = [UIFont systemFontOfSize:13];
    [view addSubview:_sex];
    
    UIImageView *sexImage = [[UIImageView alloc]initWithFrame:CGRectMake(+_sex.frame.size.width+_sex.frame.origin.x, 22, 15, 15)];
    sexImage.image = [UIImage imageNamed:@"seximg.png"];
    [view addSubview:sexImage];
    
    //接单数
    UIImageView *numberImage = [[UIImageView alloc]initWithFrame:CGRectMake(_name.frame.origin.x
                                                                           , _name.frame.origin.y+_name.frame.size.height,
                                                                            13, 13)];
    numberImage.image = [UIImage imageNamed:@"dingdan.png"];
    [view addSubview:numberImage];
    
    _number = [[UILabel alloc]initWithFrame:CGRectMake(_name.frame.origin.x+numberImage.frame.size.width+5
                                                      ,  _name.frame.origin.y+_name.frame.size.height-12
                                                       , 80, 40)];
    _number.font = [UIFont systemFontOfSize:13];
    _number.textAlignment = NSTextAlignmentLeft;
    [view addSubview:_number];
    
    //特长
    UILabel *teC = [[UILabel alloc]initWithFrame:CGRectMake(_name.frame.origin.x, numberImage.frame.origin.y+numberImage.frame.size.height+15, 40, 20)];
    teC.font = [UIFont systemFontOfSize:13];
    teC.textAlignment = NSTextAlignmentLeft;
    teC.text = @"特长:";
    [view addSubview:teC];
    
    _specialty = [[UILabel alloc]initWithFrame:CGRectMake(teC.frame.origin.x+teC.frame.size.width, numberImage.frame.origin.y+numberImage.frame.size.height+15, 100, 20)];
    _specialty.font = [UIFont systemFontOfSize:10];
    _specialty.textAlignment = NSTextAlignmentLeft;
    [view addSubview:_specialty];
    
    //工作经验
    UILabel *gzjy = [[UILabel alloc]initWithFrame:CGRectMake(teC.frame.origin.x, teC.frame.size.height+teC.frame.origin.y+7, 70, 20)];
    gzjy.font = [UIFont systemFontOfSize:13];
    gzjy.text = @"工作经验:";
    [view addSubview:gzjy];
    
    _Work_experience = [[UILabel alloc ]initWithFrame:CGRectMake(gzjy.frame.origin.x+gzjy.frame.size.width, _specialty.frame.origin.y+numberImage.frame.size.height+15, 100, 20)];
    _Work_experience.font = [UIFont systemFontOfSize:10];
    _Work_experience.textAlignment = NSTextAlignmentLeft;
    [view addSubview:_Work_experience];
   
    // 地区
    
    _arera = [[UILabel alloc]initWithFrame:CGRectMake(view.frame.size.width-60, 15, 50, 20)];
    //_arera.backgroundColor = [UIColor redColor];
    _arera.textAlignment = NSTextAlignmentCenter;
    _arera.font = [UIFont systemFontOfSize:10];
    [view addSubview:_arera];
    
    
    UIImageView *arearImage = [[UIImageView alloc]initWithFrame:CGRectMake(view.frame.size.width-80, 17, 15, 15)];
    arearImage.image = [UIImage imageNamed:@"weizhiimg.png"];
    [view addSubview:arearImage];
    
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
