//
//  InputView.m
//  VCoach
//
//  Created by Moon on 16/1/28.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "InputView.h"
#import "VTeacher.pch"
@implementation InputView
-(instancetype)initWithFrame:(CGRect)frame with:(NSString*)mon{
    if (self) {
        self = [super initWithFrame:frame];
    }
    UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(5*PW, 5*PH, 40*PW, 40*PW)];
    image.image = [UIImage imageNamed:@""];
    image.backgroundColor = [UIColor redColor];
    [self addSubview:image];
    
    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(50*PW, 5*PH, SCREEN_WIDTH-(100*PW), 30*PH)];
    lable.text = @"请输入支付密码";
    //<#name#>.backgroundColor = [UIColor <#color#>];
    lable.textColor = [UIColor blackColor];
    lable.font = [UIFont systemFontOfSize:15*PW];
    [self addSubview:lable];
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, (10*PH)+lable.frame.size.height, SCREEN_WIDTH, 1)];
    line.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:line];
    
    UILabel *jine = [[UILabel alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-(100*PW))/2, line.frame.origin.y+line.frame.size.height+(5*PH), SCREEN_WIDTH, 30*PH)];
    jine.text = @"金额";
    jine.font = [UIFont systemFontOfSize:15*PW];
    [self addSubview:jine];

    ///  TF
    _TF = [[UITextField alloc]init];
    _TF.frame = CGRectMake(0, 0, 0, 0);
    _TF.delegate = self;
    _TF.keyboardType=UIKeyboardTypeNumberPad;
    [_TF addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [self addSubview:_TF];
   
    _money = [[UILabel alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-(100*PW))/2, jine.frame.origin.y+jine.frame.size.height+(15*PH), 100*PW, 300*PH)];
    _money.text = mon;
    _money.font = [UIFont systemFontOfSize:15*PW];
    [self addSubview:_money];
    
    
    ///  假的输入框
    _view_box = [[UIView alloc]initWithFrame:CGRectMake(10*PW, _money.frame.origin.y+_money.frame.size.height+(10*PH)
                                                        , boxWidth, boxWidth)];
    [_view_box.layer setBorderWidth:1.0];
    _view_box.layer.borderColor = [[UIColor grayColor]CGColor];
    [self addSubview:_view_box];
    
    //确认按钮
    _next  = [UIButton buttonWithType:UIButtonTypeCustom];
    _next.frame = CGRectMake(15*PW, _view_box.frame.origin.y+_view_box.frame.size.height+(15*PH), (SCREEN_WIDTH-(30*PW))/2, 30*PH);
    
    [_next setTitle:@"确认" forState:UIControlStateNormal];
    _next.backgroundColor = [UIColor brownColor];
    [_next setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self addSubview:_next];
    
    
    _view_box2 = [[UIView alloc]initWithFrame:CGRectMake((20*PW)+boxWidth*1, _view_box.frame.origin.y, boxWidth, boxWidth)];
    [_view_box2.layer setBorderWidth:1.0];
    _view_box2.layer.borderColor = [[UIColor grayColor]CGColor];
    [self addSubview:_view_box2];
    
    _view_box3 = [[UIView alloc]initWithFrame:CGRectMake((30*PW)+boxWidth*2, _view_box.frame.origin.y, boxWidth, boxWidth)];
    [_view_box3.layer setBorderWidth:1.0];
    _view_box3.layer.borderColor = [[UIColor grayColor]CGColor];
    [self addSubview:_view_box3];
    
    _view_box4 = [[UIView alloc]initWithFrame:CGRectMake((40*PW)+boxWidth*3, _view_box.frame.origin.y, boxWidth, boxWidth)];
    [_view_box4.layer setBorderWidth:1.0];
    _view_box4.layer.borderColor = [[UIColor grayColor]CGColor];
    [self addSubview:_view_box4];
    
    _view_box5 = [[UIView alloc]initWithFrame:CGRectMake((50*PW)+boxWidth*4, _view_box.frame.origin.y, boxWidth, boxWidth)];
    [_view_box5.layer setBorderWidth:1.0];
    _view_box5.layer.borderColor = [[UIColor grayColor]CGColor];
    [self addSubview:_view_box5];
    
    _view_box6 = [[UIView alloc]initWithFrame:CGRectMake((60*PW)+boxWidth*5, _view_box.frame.origin.y, boxWidth, boxWidth)];
    [_view_box6.layer setBorderWidth:1.0];
    _view_box6.layer.borderColor = [[UIColor grayColor]CGColor];
    [self addSubview:_view_box6];

    ///   密码点
    _lable_point = [[UILabel alloc]init];
    _lable_point.frame = CGRectMake((_view_box.frame.size.width-(10*PW))/2, (_view_box.frame.size.width-(10*PH))/2, 10*PW, 10*PH);
    [_lable_point.layer setCornerRadius:5];
    [_lable_point.layer setMasksToBounds:YES];
    _lable_point.backgroundColor = [UIColor blackColor];
    [_view_box addSubview:_lable_point];
    
    _lable_point2 = [[UILabel alloc]init];
    _lable_point2.frame = CGRectMake((_view_box.frame.size.width-(10*PW))/2, (_view_box.frame.size.width-(10*PH))/2, 10*PW, 10*PW);
    [_lable_point2.layer setCornerRadius:5];
    [_lable_point2.layer setMasksToBounds:YES];
    _lable_point2.backgroundColor = [UIColor blackColor];
    [_view_box2 addSubview:_lable_point2];
    
    
    _lable_point3 = [[UILabel alloc]init];
    _lable_point3.frame = CGRectMake((_view_box.frame.size.width-(10*PW))/2, (_view_box.frame.size.width-(10*PH))/2, 10*PW, 10*PW);
    [_lable_point3.layer setCornerRadius:5];
    [_lable_point3.layer setMasksToBounds:YES];
    _lable_point3.backgroundColor = [UIColor blackColor];
    [_view_box3 addSubview:_lable_point3];
    
    _lable_point4 = [[UILabel alloc]init];
    _lable_point4.frame = CGRectMake((_view_box.frame.size.width-(10*PW))/2, (_view_box.frame.size.width-(10*PH))/2, 10*PW, 10*PW);
    [_lable_point4.layer setCornerRadius:5];
    [_lable_point4.layer setMasksToBounds:YES];
    _lable_point4.backgroundColor = [UIColor blackColor];
    [_view_box4 addSubview:_lable_point4];
    
    _lable_point5 = [[UILabel alloc]init];
    _lable_point5.frame = CGRectMake((_view_box.frame.size.width-(10*PW))/2, (_view_box.frame.size.width-(10*PH))/2, 10*PW, 10*PW);
    [_lable_point5.layer setCornerRadius:5];
    [_lable_point5.layer setMasksToBounds:YES];
    _lable_point5.backgroundColor = [UIColor blackColor];
    [_view_box5 addSubview:_lable_point5];
    
    _lable_point6 = [[UILabel alloc]init];
    _lable_point6.frame = CGRectMake((_view_box.frame.size.width-(10*PW))/2, (_view_box.frame.size.width-(10*PH))/2, 10*PW, 10*PW);
    [_lable_point6.layer setCornerRadius:5];
    [_lable_point6.layer setMasksToBounds:YES];
    _lable_point6.backgroundColor = [UIColor blackColor];
    [_view_box6 addSubview:_lable_point6];
    
    _lable_point.hidden=YES;
    _lable_point2.hidden=YES;
    _lable_point3.hidden=YES;
    _lable_point4.hidden=YES;
    _lable_point5.hidden=YES;
    _lable_point6.hidden=YES;
    
    
    return self;
}
- (void) textFieldDidChange:(id) sender
{
    
    UITextField *_field = (UITextField *)sender;
    
    switch (_field.text.length) {
        case 0:
        {
            _lable_point.hidden=YES;
            _lable_point2.hidden=YES;
            _lable_point3.hidden=YES;
            _lable_point4.hidden=YES;
            _lable_point5.hidden=YES;
            _lable_point6.hidden=YES;
        }
            break;
        case 1:
        {
            _lable_point.hidden=NO;
            _lable_point2.hidden=YES;
            _lable_point3.hidden=YES;
            _lable_point4.hidden=YES;
            _lable_point5.hidden=YES;
            _lable_point6.hidden=YES;
        }
            break;
        case 2:
        {
            _lable_point.hidden=NO;
            _lable_point2.hidden=NO;
            _lable_point3.hidden=YES;
            _lable_point4.hidden=YES;
            _lable_point5.hidden=YES;
            _lable_point6.hidden=YES;
        }
            break;
        case 3:
        {
            _lable_point.hidden=NO;
            _lable_point2.hidden=NO;
            _lable_point3.hidden=NO;
            _lable_point4.hidden=YES;
            _lable_point5.hidden=YES;
            _lable_point6.hidden=YES;
        }
            break;
        case 4:
        {
            _lable_point.hidden=NO;
            _lable_point2.hidden=NO;
            _lable_point3.hidden=NO;
            _lable_point4.hidden=NO;
            _lable_point5.hidden=YES;
            _lable_point6.hidden=YES;
        }
            break;
        case 5:
        {
            _lable_point.hidden=NO;
            _lable_point2.hidden=NO;
            _lable_point3.hidden=NO;
            _lable_point4.hidden=NO;
            _lable_point5.hidden=NO;
            _lable_point6.hidden=YES;
        }
            break;
        case 6:
        {
            _lable_point.hidden=NO;
            _lable_point2.hidden=NO;
            _lable_point3.hidden=NO;
            _lable_point4.hidden=NO;
            _lable_point5.hidden=NO;
            _lable_point6.hidden=NO;
        }
            break;
            
        default:
            break;
    }
    
    
    if (_field.text.length==6)
    {
        [self.TXTradePasswordDelegate TXTradePasswordView:self WithPasswordString:_field.text];
        
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
