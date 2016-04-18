//
//  Myself-Registered1.m
//  VCoach
//
//  Created by Moon on 16/1/11.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "Myself-Registered1.h"
#import "Myself-Registered1.h"
#import "VTeacher.pch"
#import "Myself-Registered2.h"
@interface Myself_Registered1 ()

@end

@implementation Myself_Registered1
-(void)viewWillAppear:(BOOL)animated{
    backViewColor_gray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self Sview];
    // Do any additional setup after loading the view.
}
-(void)Sview{
    UIImageView *image= [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, 50)];
    image.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:image];
    
    UIView *back = [[UIView alloc]initWithFrame:CGRectMake(15, image.frame.size.height+image.frame.origin.y+15, SCREEN_WIDTH-30, 50)];
    back.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:back];
    
    
    _yzm = [[UITextField alloc]initWithFrame:CGRectMake(25, 5, back.frame.size.width-50, 30)];
    _yzm.placeholder = @"请输入验证短信";
    [back addSubview:_yzm];
    
    _next = [UIButton buttonWithType:UIButtonTypeCustom];
    _next.frame = CGRectMake(15, back.frame.origin.y+back.frame.size.height+15, back.frame.size.width, 40);
    [_next setTitle:@"下一步" forState:UIControlStateNormal];
    _next.layer.masksToBounds = YES;
    _next.layer.cornerRadius = 2.0;
    _next.backgroundColor = [UIColor grayColor];
    [_next addTarget:self action:@selector(nextt) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:_next];
    
    _chickMark = [UIButton buttonWithType:UIButtonTypeCustom];
    _chickMark.frame = CGRectMake(15, _next.frame.origin.y+_next.frame.size.height+5, 20, 20);
    [_chickMark setImage:[UIImage imageNamed:@"tabbar4@2x"] forState:UIControlStateNormal];
    //[chickMark setImage:[UIImage imageNamed:@"tabbar3@2x"] forState:UIControlStateSelected];
    _chickMark.userInteractionEnabled = YES;
    [_chickMark addTarget:self action:@selector(chickDown) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:_chickMark];
    
  _chickMark_NoYet = [UIButton buttonWithType:UIButtonTypeCustom];
    _chickMark_NoYet.frame = CGRectMake(15, _next.frame.origin.y+_next.frame.size.height+5, 20, 20);
    [_chickMark_NoYet addTarget:self action:@selector(chickUp) forControlEvents:UIControlEventTouchDown];
    _chickMark_NoYet.userInteractionEnabled = YES;
    [_chickMark_NoYet setImage:[UIImage imageNamed:@"tabbar3@2x"] forState:UIControlStateNormal];
    [self.view addSubview:_chickMark_NoYet];
    
    UILabel *tip = [[UILabel alloc]init];
    tip.text = @"我已经阅读并接受";
    tip.font = [UIFont systemFontOfSize:13];
    NSDictionary *dic = @{NSFontAttributeName:tip.font};
    CGSize size = [tip.text sizeWithAttributes:dic];
    tip.frame = CGRectMake(_chickMark.frame.origin.x+_chickMark.frame.size.width, _next.frame.origin.y+_next.frame.size.height+5, size.width, size.height);
    
    [self.view addSubview:tip];
//用户协议
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(tip.frame.origin.x+tip.frame.size.width, _next.frame.origin.y+_next.frame.size.height+5, 100, 20);
    //[button setTitle:@"V教练用户协议" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc]initWithString:@"V教练用户协议"];
    NSRange strRang = {0,[str length]};
    [str addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:strRang];
    [button setAttributedTitle:str forState:UIControlStateNormal];
    
    [self.view addSubview:button];
    
}
-(void)nextt{
    Myself_Registered2 *myself = [[Myself_Registered2 alloc]init];
    myself.title = @"注册";
    [self.navigationController pushViewController:myself animated:YES];
}

-(void)chickDown{
    _chickMark.hidden = YES;
    _chickMark_NoYet.hidden = NO;
}
-(void)chickUp{
    _chickMark_NoYet.hidden = YES;
    _chickMark.hidden = NO;
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
