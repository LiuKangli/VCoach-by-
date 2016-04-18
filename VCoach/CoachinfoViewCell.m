//
//  CoachinfoViewCell.m
//  VCoach
//
//  Created by apple on 15/4/28.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "CoachinfoViewCell.h"
#import "PostClass.h"

@implementation CoachinfoViewCell{

    int selectstatus;

}

////返回cell ID
//+(NSString *)cellID
//{
//    
//    return @"CoachinfoViewCell";
//}
//
////加载xib
//+ (CoachinfoViewCell *)tuijianViewCell{
//    
//    NSArray *arrayXibObjects = [[NSBundle mainBundle] loadNibNamed:@"CoachinfoViewCell" owner:nil options:nil];
//    
//    return arrayXibObjects[0];
//}
//
//- (CoachinfoViewCell *)cellWithstatus:(Coachinfostatus *)status{
//    
//    self.title.text = status.title;
//    NSData *imgdata = [PostClass initwithurl:status.ad_image_url];
//    self.classimg.image = [UIImage imageWithData:imgdata];
//    self.price.text = status.price;
//    
//    
//    return self;
//}


-(void)ser:(int)i{
    selectstatus = i;
}
- (void)awakeFromNib {
    
    //selectstatus = 1;
    //self.coachview.layer.cornerRadius = 5;

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    if (selectstatus == 0) {
        self.selectimg.image = [UIImage imageNamed:@"xuanzebtn.png"];
        self.userInteractionEnabled = NO;
        selectstatus = 1;
    }else if(selectstatus == 1){
        self.userInteractionEnabled = YES;
        self.selectimg.image = [UIImage imageNamed:@"yuanioc.png"];
        selectstatus = 0;
        
    }
    // Configure the view for the selected state
}

@end
