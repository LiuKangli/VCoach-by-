//
//  My-self-user-cell1.m
//  VCoach
//
//  Created by Moon on 16/1/13.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "My-self-user-cell1.h"
#import "VTeacher.pch"
@implementation My_self_user_cell1
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self) {
        self= [super initWithStyle:style reuseIdentifier:reuseIdentifier];
        cellbackcolor_gray;
        [self views];
    }
    return self;
}
-(void)views{
    UIView * back = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 80)];
    back.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:back];
    
    _headImage = [[UIImageView alloc]initWithFrame:CGRectMake(15, 10, 60, 60)];
    _headImage.backgroundColor = [UIColor redColor];
    _headImage.layer.masksToBounds = YES;
    _headImage.layer.cornerRadius = _headImage.frame.size.width/2;
    [back addSubview:_headImage];
    
    _name  = [[UILabel alloc]initWithFrame:CGRectMake(_headImage.frame.origin.x+_headImage.frame.size.width+5, 10, 50, 30)];
    //<#name#>.text = <#text#>;
    //_name.backgroundColor = [UIColor redColor];
    //<#name#>.textColor = [UIColor redColor];
    _name.font = [UIFont systemFontOfSize:14];
    [back addSubview:_name];
    
    _sex = [[UILabel alloc]initWithFrame:CGRectMake(_name.frame.origin.x+_name.frame.size.width, 10, 30, 30)];
    //<#name#>.text = <#text#>;
    //<#name#>.backgroundColor = [UIColor <#color#>];
    //<#name#>.textColor = [UIColor redColor];
    _sex.font = [UIFont systemFontOfSize:14];
    [back addSubview:_sex];

    
    UIImageView *tupian = [[UIImageView alloc]initWithFrame:CGRectMake(_name.frame.origin.x, _name.frame.origin.y+_name.frame.size.height+15, 10, 10)];
    tupian.image = [UIImage imageNamed:@"goright.png"];
    [back addSubview:tupian];
    
    UILabel *yue = [[UILabel alloc]initWithFrame:CGRectMake(tupian.frame.origin.x+tupian.frame.size.width, _name.frame.origin.y+_name.frame.size.height+15, 80, 20)];
    yue.text = @"账户余额:";
    //yue.backgroundColor = [UIColor <#color#>];
    //<#name#>.textColor = [UIColor redColor];
    yue.font = [UIFont systemFontOfSize:15];
    [back addSubview:yue];
    
    _money = [[UILabel alloc]initWithFrame:CGRectMake(yue.frame.origin.x+yue.frame.size.width, _name.frame.origin.y+_name.frame.size.height+15, 100, 20)];
    //<#name#>.text = <#text#>;
    //<#name#>.backgroundColor = [UIColor <#color#>];
    //<#name#>.textColor = [UIColor redColor];
    _money.font = [UIFont systemFontOfSize:15];
    [back addSubview:_money];

    UIImageView*right = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-25, 35, 10, 15)];
    right.image = [UIImage imageNamed:@"goright.png"];
    // right.backgroundColor = [UIColor redColor];
    [back addSubview:right];


}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
