//
//  Second.h
//  VCoach
//
//  Created by Moon on 16/2/26.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Second : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *backView;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *tcLable;
@property (weak, nonatomic) IBOutlet UILabel *jyLable;
@property (weak, nonatomic) IBOutlet UILabel *dingdan;
@property (weak, nonatomic) IBOutlet UILabel *tcText;
@property (weak, nonatomic) IBOutlet UILabel *jyText;
@property (weak, nonatomic) IBOutlet UILabel *areraText;
@property (weak, nonatomic) IBOutlet UIImageView *ddImage;
@property (weak, nonatomic) IBOutlet UIImageView *areraImage;
@property (weak, nonatomic) IBOutlet UILabel *sex;

@end
