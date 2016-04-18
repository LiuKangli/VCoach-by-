//
//  MyacountViewController.m
//  VCoach
//
//  Created by apple on 15/5/6.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "MyacountViewController.h"

@interface MyacountViewController ()

@end

@implementation MyacountViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.popview addTarget:self action:@selector(popView) forControlEvents:UIControlEventTouchDown];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)popView{


    [self.navigationController popViewControllerAnimated:YES];

}

-(void)viewWillAppear:(BOOL)animated{
    
    self.tabBarController.tabBar.hidden = YES;
    
}

@end
