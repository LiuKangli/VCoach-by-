//
//  ReqlyViewCell.h
//  VCoach
//
//  Created by Moon on 16/1/19.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReqlyViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *backView;
@property (weak, nonatomic) IBOutlet UILabel *namePhone;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *pinjia;
@property (weak, nonatomic) IBOutlet UIImageView *goodOrBad;
@property (weak, nonatomic) IBOutlet UILabel *time;

@end
