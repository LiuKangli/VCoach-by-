//
//  My-self-user-cell2.m
//  VCoach
//
//  Created by Moon on 16/1/13.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "My-self-user-cell2.h"
#import "VTeacher.pch"
@implementation My_self_user_cell2
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self) {
        self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
        cellbackcolor_gray;
        [self views];
    }
    return self;
}
-(void)views{
    UIView * back = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 80)];
    back.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:back];
    _mingyan = [[UILabel alloc]initWithFrame:CGRectMake(10, 15, back.frame.size.width-20, 50)];
    //<#name#>.text = <#text#>;
    //<#name#>.backgroundColor = [UIColor <#color#>];
    _mingyan.textColor = [UIColor blackColor];
    _mingyan.font = [UIFont systemFontOfSize:14];
    [back addSubview:_mingyan];
    
    
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
