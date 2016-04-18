//
//  orderViewCell.m
//  VCoach
//
//  Created by apple on 15/5/19.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "orderViewCell.h"
#import "PostClass.h"

@implementation orderViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self) {
        self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    }
    return self;
}
////返回cell ID
//+(NSString *)cellID
//{
//    
//    return @"orderViewCell";
//}
//
////加载xib
//+ (orderViewCell *)tuijianViewCell{
//    
//    NSArray *arrayXibObjects = [[NSBundle mainBundle] loadNibNamed:@"orderViewCell" owner:nil options:nil];
//    
//    return arrayXibObjects[0];
//}
//
//- (orderViewCell *)cellWithstatus:(orderstatus *)status{
//    
//    
//    self.classtitle.text = status.title;
//    self.jianjie.text = status.simple_introduce;
//    self.classimg.image = [UIImage imageWithData:[PostClass initwithurl:status.ad_image_url]];
//    self.price.text = status.price;
//    
//    return self;
//}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
