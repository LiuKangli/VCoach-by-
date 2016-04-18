//
//  MainViewController.m
//  VCoach
//
//  Created by apple on 15/4/27.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "MainViewController.h"
#import "ServiceViewController.h"
#import "CoachViewController.h"
#import "MySelfViewController.h"

#import "NewNavigation.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "SecondView_Search.h"
#import "VTeacher.pch"
@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    ServiceViewController *servView = [[ServiceViewController alloc]init];
    servView.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"项目" image:[UIImage imageNamed:@"tabbar1"] selectedImage:[UIImage imageNamed:@"tabbar2"]];
    NewNavigation *ServViewNavVC = [[NewNavigation alloc]initWithRootViewController:servView];
    
    
    
    
    CoachViewController *comm = [[CoachViewController alloc]init];
    comm.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"教练" image:[UIImage imageNamed:@"tabbar3"] selectedImage:[UIImage imageNamed:@"tabbar4"]];
    NewNavigation *commNav = [[NewNavigation alloc]initWithRootViewController:comm];
    comm.tabBarItem.tag = 2;
    
    MySelfViewController *myself = [[MySelfViewController alloc]init];
    myself.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"我的" image:[UIImage imageNamed:@"tabbar5"] selectedImage:[UIImage imageNamed:@"tabbar6"]];
    NewNavigation *myNav = [[NewNavigation alloc]initWithRootViewController:myself];
    myself.tabBarItem.tag = 3;
    
    
    self.tabBar.barStyle = UIBarStyleDefault;
    //self.tabBar.backgroundImage = [UIImage imageNamed:@"top_bg.png"];
    self.tabBar.tintColor = [UIColor orangeColor];
    self.tabBar.alpha = 0.8;//设置tabbar透明度
    self.viewControllers = [NSArray arrayWithObjects:ServViewNavVC,commNav,myNav, nil];
    
    //[self addChildViewController:myNav];
    


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
