//
//  tuijianViewCell.m
//  VCoach
//
//  Created by apple on 15/4/27.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "tuijianViewCell.h"
#import "VTeacher.pch"
@implementation tuijianViewCell


//- (tuijianViewCell *)cellWithstatus:(tuijianstatus *)status{
//    
//    
//    self.classtitle.text = status.Title;
//    self.jianjie.text = status.Simple_introduce;
//    self.classimg.image = [UIImage imageWithData:[PostClass initwithurl:status.Ad_image_url]];
//    self.price.text = status.Price;
//    
//    return self;
//}

- (void)awakeFromNib {

//    [self.postorderBtn.layer setBorderWidth:1];
//    [self.postorderBtn.layer setBorderColor:[UIColor redColor].CGColor];
//    self.postorderBtn.layer.cornerRadius = 3;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)ViewsLayout{
    self.frame = CGRectMake(0, 0, 375*PW, 134*PH);
    _classimg.frame = CGRectMake(8*PW, 22*PH, 80*PW, 80*PW);
    _classtitle.frame = CGRectMake(96*PW, 14*PH, 186*PW, 21*PH);
    _jianjie.frame = CGRectMake(96*PW, 43*PH, 182*PW, 37*PH);
    _moneyImage.frame = CGRectMake(96*PW, 88*PH, 17*PW, 21*PH);
    _price.frame =CGRectMake(114*PW, 88*PH, 37*PW, 21*PH);
    _moneylable.frame = CGRectMake(153*PW, 88*PH, 17*PW, 21*PH);
    _postorderBtn.frame = CGRectMake(278*PW, 88*PH, 75*PW, 21*PH);
    _line.frame = CGRectMake(0, 126*PH, 364*PW, 1);
}
@end
