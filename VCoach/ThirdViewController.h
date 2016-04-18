//
//  ThirdViewController.h
//  VCoach
//
//  Created by Moon on 16/1/8.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThirdViewController : UIViewController
@property (nonatomic,strong) UILabel *topLable;
@property (nonatomic,strong) UIButton *loginButton;
@property (nonatomic,strong) NSString *userId;
@property (nonatomic,strong) UITableView *userTableView;
@property (nonatomic,strong) NSDictionary *userData;
@end

