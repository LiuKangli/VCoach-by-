//
//  RepluyViewController.m
//  VCoach
//
//  Created by apple on 15/5/14.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "RepluyViewController.h"
#import "Constants.h"
#import "PostClass.h"
#import "VTeacher.pch"
@interface RepluyViewController ()
{
    NSString *gs;
    NSString *bs;
}
@end

@implementation RepluyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@",_orderID);
    [self.realback addTarget:self action:@selector(popView) forControlEvents:UIControlEventTouchDown];
    [self.SaveBtn addTarget:self action:@selector(savereply)
           forControlEvents:UIControlEventTouchDown];
    
    _backView.frame = CGRectMake(0, 0,SCREEN_WIDTH , 64);
    _backImage.frame = CGRectMake(0, 0, SCREEN_WIDTH, 64);
    _backTitle.frame = CGRectMake((SCREEN_WIDTH-68)/2, _BackBtn.frame.origin.y-3, 68, 34);
    _backTitle.font = [UIFont systemFontOfSize:17];
    
    _strnumber.frame = CGRectMake(296*PW, 173*PH, 65*PW, 21*PH);
    _replytext.frame = CGRectMake(4*PW, 75*PH, 367*PW, 138*PH);
    
    _goodButton.frame = CGRectMake(13*PW, 223*PH, 20*PW, 20*PW);
     _goodB1.frame = CGRectMake(13*PW, 223*PH, 20*PW, 20*PW);
    _goodLable.frame = CGRectMake(34*PW, 219*PH, 34*PW, 30*PH);
    _badButton.frame = CGRectMake(79*PW, 223*PH, 20*PW, 20*PW);
     _badB1.frame = CGRectMake(79*PW, 223*PH, 20*PW, 20*PW);
    _badLable.frame = CGRectMake(100*PW, 219*PH, 34*PW, 30*PH);
    
    _goodLable.font = [UIFont systemFontOfSize:16*PW];
    _badLable.font = [UIFont systemFontOfSize:16*PW];
    _strnumber.font = [UIFont systemFontOfSize:14*PW];
    
    _SaveBtn.frame = CGRectMake(SCREEN_WIDTH-57, _BackBtn.frame.origin.y-3, 34, 34);
    
    [_goodButton addTarget:self action:@selector(good1) forControlEvents:UIControlEventTouchDown];
    [_goodB1 addTarget:self action:@selector(good2) forControlEvents:UIControlEventTouchDown];
    
    [_badButton addTarget:self action:@selector(bad1) forControlEvents:UIControlEventTouchDown];
    [_badB1 addTarget:self action:@selector(bad2) forControlEvents:UIControlEventTouchDown];
    
}
-(void)good1{
    _goodButton.hidden = YES;
    _goodB1.hidden = NO;
    gs = @"2";
}
-(void)good2{
    _goodButton.hidden = NO;
    _goodB1.hidden = YES;
}
-(void)bad1{
    _badButton.hidden = YES;
    _badB1.hidden = NO;
    gs = @"0";
}
-(void)bad2{
    _badButton.hidden = NO;
    _badB1.hidden = YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)savereply{
    NSString*wlzt=[[NSUserDefaults standardUserDefaults]stringForKey:@"WLZT"];
    if ([wlzt isEqualToString:@"no_net"]) {
        UIAlertView *ba = [[UIAlertView alloc]initWithTitle:@"蜂窝移动数据已关闭" message:@"启用蜂窝移动数据或无线局域网来访问数据" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
        [ba show];
    }else{
    if (_replytext.text.length>0) {
        if ([_replytext.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]){
            UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"提示" message:@"输入有误" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
           
            [alert show];
        }else{
            NSLog(@"%lu",(unsigned long)self.replytext.text.length);
            
            NSData *stt = [_replytext.text dataUsingEncoding:NSASCIIStringEncoding];
            NSString *st = [stt base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
            
            NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[[NSUserDefaults standardUserDefaults] objectForKey:@"userID"],@"user_id",st,@"reply_text",gs,@"reply_point",_orderID,@"order_id", nil];
            if ([[dic objectForKey:@"status"]intValue] == 0) {
                UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"提示" message:@"回复成功" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                alert.delegate = self;
                [alert show];
            }

        }
    }
    }
    
}

-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)popView{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)textViewDidChangeSelection:(UITextView *)textView{
    if (self.replytext.text.length < 200) {
        [self.replytext setEditable:YES];
        self.strnumber.text = [NSString stringWithFormat:@"%lu/200",200 - self.replytext.text.length];
    }else{
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"抱歉" message:@"您输入的评论长度超过200个" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        [self.replytext setEditable:NO];
        
    }
    
}

-(void)viewWillAppear:(BOOL)animated{
    
    self.tabBarController.tabBar.hidden = YES;
    
}
@end
