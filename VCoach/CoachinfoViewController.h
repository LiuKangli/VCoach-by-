//
//  CoachinfoViewController.h
//  VCoach
//
//  Created by apple on 15/4/28.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CoachinfoViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *backView;
@property (weak, nonatomic) IBOutlet UIImageView *backImage;
@property (weak, nonatomic) IBOutlet UILabel *backLable;
@property (weak, nonatomic) IBOutlet UIView *view1Line;



@property (weak, nonatomic) IBOutlet UIButton *BackBtn;
@property (weak, nonatomic) IBOutlet UIView *view1;
@property (weak, nonatomic) IBOutlet UIImageView *headImage;
@property (weak, nonatomic) IBOutlet UIImageView *dingdanImage;
@property (weak, nonatomic) IBOutlet UIImageView *diquImage;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *arera;
@property (weak, nonatomic) IBOutlet UIImageView *sexImage;
@property (weak, nonatomic) IBOutlet UILabel *sex;
@property (weak, nonatomic) IBOutlet UILabel *jibie;
@property (weak, nonatomic) IBOutlet UILabel *jingyan;
@property (weak, nonatomic) IBOutlet UILabel *jibieF;
@property (weak, nonatomic) IBOutlet UILabel *jingyanF;
@property (weak, nonatomic) IBOutlet UILabel *titleTop;
@property (weak, nonatomic) IBOutlet UIView *line;
@property (weak, nonatomic) IBOutlet UILabel *danNum;

@property (weak, nonatomic) IBOutlet UIView *view2;
@property (weak, nonatomic) IBOutlet UILabel *renZheng;
@property (weak, nonatomic) IBOutlet UIImageView *rightImage;

- (IBAction)gobuy:(id)sender;


@property (weak, nonatomic) IBOutlet UIImageView *titleImage;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollerView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *buttonF;
@property (weak, nonatomic) IBOutlet UIButton *realback;

@property (weak, nonatomic) IBOutlet UIButton *gobuy;

@property (nonatomic,strong)NSString *tID;

@end
