//
//  tuijianViewCell.h
//  VCoach
//
//  Created by apple on 15/4/27.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "tuijianstatus.h"
#import "PostClass.h"

@interface tuijianViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *classtitle;
@property (weak, nonatomic) IBOutlet UILabel *jianjie;
@property (weak, nonatomic) IBOutlet UIImageView *classimg;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UILabel *postorderBtn;
@property (weak, nonatomic) IBOutlet UILabel *moneyImage;
@property (weak, nonatomic) IBOutlet UIView *line;
@property (weak, nonatomic) IBOutlet UILabel *moneylable;

-(void)ViewsLayout;

//- (tuijianViewCell *)cellWithstatus:(tuijianstatus *)status;


@end
