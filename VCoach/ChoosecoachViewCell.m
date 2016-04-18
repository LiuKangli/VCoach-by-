//
//  ChoosecoachViewCell.m
//  VCoach
//
//  Created by apple on 15/5/18.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ChoosecoachViewCell.h"
#import "PostClass.h"

@implementation ChoosecoachViewCell{

    int selectstatus;

}


//返回cell ID
+(NSString *)cellID
{
    
    return @"ChoosecoachViewCell";
}

//加载xib
+ (ChoosecoachViewCell *)tuijianViewCell{
    
    NSArray *arrayXibObjects = [[NSBundle mainBundle] loadNibNamed:@"ChoosecoachViewCell" owner:nil options:nil];
    
    return arrayXibObjects[0];
}

- (ChoosecoachViewCell *)cellWithstatus:(Choosecoachstatus *)status{
    
    
    self.coacher_name.text = status.coacher_name;
    self.head_pic.image = [UIImage imageWithData:[PostClass initwithurl:status.head_pic]];
    
    if ([status.user_sex intValue] == 0) {
        self.coacher_sex.text = @"男";
    }else{
        self.coacher_sex.text = @"女";
    }
    self.coacher_speciality.text = status.user_speciality;
    self.coacher_experience.text = status.user_work_experience;
    NSString *num = [NSString stringWithFormat:@"%@单",status.trans_sum];
    self.order_sum.text = num;
    
    return self;
}



- (void)awakeFromNib {
    selectstatus = 0;
    self.head_pic.layer.masksToBounds =YES;
    self.head_pic.layer.cornerRadius = 36.5;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    if (selectstatus == 0) {
        self.choosebtn.backgroundColor = [UIColor whiteColor];
        self.choosebtn.textColor = [UIColor brownColor];
        selectstatus = 1;
    }else{
        
        self.choosebtn.backgroundColor = [UIColor brownColor];
        self.choosebtn.textColor = [UIColor whiteColor];
        selectstatus = 0;
    }}

@end
