//
//  About_ViewController.m
//  VCoach
//
//  Created by Moon on 16/3/7.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "About_ViewController.h"
#import "VTeacher.pch"
@interface About_ViewController ()

@end

@implementation About_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _backView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 64);
    _backImage.frame = CGRectMake(0, 0, SCREEN_WIDTH, 64);
    _backtitle.textColor= [UIColor whiteColor];
    _backtitle.frame = CGRectMake((SCREEN_WIDTH-68)/2, _backBtn.frame.origin.y-3, 68, 34);
    _iconImage.frame = CGRectMake(121*PW, 104*PH, 133*PW, 109*PH);
    _iconImage.backgroundColor = [UIColor redColor];
    _iconLable.frame = CGRectMake(121*PW, 229*PH, 133*PW, 27*PH);
    [self.realBack addTarget:self action:@selector(popView) forControlEvents:UIControlEventTouchDown];
    // Do any additional setup after loading the view from its nib.
}
-(void)popView{
    [self.navigationController popViewControllerAnimated:YES];
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
