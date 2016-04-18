//
//  CoachViewCell.m
//  VCoach
//
//  Created by apple on 15/4/27.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "CoachViewCell.h"
#import "PostClass.h"
#import "VTeacher.pch"
@implementation CoachViewCell

////返回cell ID
//+(NSString *)cellID
//{
//    return @"CoachViewCell";
//}
//
////加载xib
//+ (CoachViewCell *)tuijianViewCell{
//    
//    NSArray *arrayXibObjects = [[NSBundle mainBundle] loadNibNamed:@"CoachViewCell" owner:nil options:nil];
//    
//    return arrayXibObjects[0];
//}
//
//- (CoachViewCell *)cellWithstatus:(Coachstatus *)status{
//    
//    
//    self.coachname.text = status.coacher_name;
//    self.coachimg.image = [UIImage imageWithData:[PostClass initwithurl:status.head_pic]];
//    
//    if ([status.user_sex intValue] == 0) {
//        self.sex.text = @"男";
//    }else{
//    self.sex.text = @"女";
//    }
//    self.speciality.text = status.user_speciality;
//    self.work_experience.text = status.user_work_experience;
//    self.area.text = status.area;
//    NSString *num = [NSString stringWithFormat:@"%@单",status.trans_sum];
//    self.dannum.text = num;
//    
//    return self;
//}

- (void)awakeFromNib {
//    self.coachview.layer.cornerRadius = 5;
//    self.coachimg.layer.masksToBounds =YES;
//    self.coachimg.layer.cornerRadius = 36.5;
//    self.coachview.frame = CGRectMake(5*PW, 1, 365*PW, 131*PH);
//    self.coachimg.layer.cornerRadius = self.coachimg.frame.size.width/2;
//    self.coachimg.frame = CGRectMake(12*PW, 29*PH, 73*PH, 73*PH);
//    
//    self.coachname.frame = CGRectMake(101*PW, 17*PH, 56*PW, 21*PH);
//    self.sex.frame = CGRectMake(163*PW, 17*PH, 14*PW, 21*PH);
//    self.danimagr.frame = CGRectMake(104*PW, 46*PH, 14*PW, 12*PH);
//    self.dannum.frame = CGRectMake(120*PW, 42*PH, 37*PW, 21*PH);
//    self.areraImage.frame = CGRectMake(309*PW, 12*PH, 13*PW, 14*PH);
//    self.area.frame = CGRectMake(322*PW, 10*PH, 41*PW, 18*PH);
//    self.tecT.frame = CGRectMake(107*PW, 73*PH, 39*PW, 16*PH);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
