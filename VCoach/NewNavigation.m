//
//  NewNavigation.m
//  VCoach
//
//  Created by Moon on 16/1/8.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "NewNavigation.h"
#import "VTeacher.pch"
#import "SecondView_Search.h"
@interface NewNavigation ()

@end

@implementation NewNavigation

- (void)viewDidLoad {
    [super viewDidLoad];
   // [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"top_bg@2x.png"] forBarMetrics:UIBarMetricsDefault];
    
    UIImageView *image = [[UIImageView alloc ]initWithImage:[UIImage imageNamed:@"top_bg@2x.png"]];
    image.frame = CGRectMake(0, -20, SCREEN_WIDTH, 64*PH);
    //[self.navigationBar addSubview:image];
    
   
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
