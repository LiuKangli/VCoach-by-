//
//  TXTradePasswordView.m
//  TF
//
//  Created by --- on 16/1/3.
//  Copyright © 2016年 吴天祥. All rights reserved.
//

#import "TXTradePasswordView.h"
#import "VTeacher.pch"
@implementation TXTradePasswordView
- (id)initWithFrame:(CGRect)frame WithTitle :(NSString *)title
{
    self = [super initWithFrame:frame];// 先调用父类的initWithFrame方法
    if (self)
    {
        ///标题
        _lable_title = [[UILabel alloc]init];
        _lable_title.frame = CGRectMake(10*PW, 20*PH, SCREEN_WIDTH, 20*PH);
        _lable_title.text = title;
        _lable_title.textAlignment= NSTextAlignmentLeft;
        _lable_title.textColor = [UIColor grayColor];
        [self addSubview:_lable_title];
        
      
        
        ///  TF
        _TF = [[UITextField alloc]init];
        _TF.frame = CGRectMake(0, 0, 0, 0);
        _TF.delegate = self;
        _TF.keyboardType=UIKeyboardTypeNumberPad;
        [_TF addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
        [_TF becomeFirstResponder];
        [self addSubview:_TF];
        
        
        
        ///  假的输入框
        _view_box = [[UIView alloc]initWithFrame:CGRectMake(10*PW, 60*PH, boxWidth, boxWidth)];
        [_view_box.layer setBorderWidth:1.0];
        _view_box.layer.borderColor = [[UIColor grayColor]CGColor];
        [self addSubview:_view_box];
        
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
        
        
        _lable_title1 = [[UILabel alloc]initWithFrame:CGRectMake(10*PW, _view_box.frame.origin.y+_view_box.frame.size.height+15, SCREEN_WIDTH, 20*PH)];
        _lable_title1.text = @"请再次确认您的新密码:";
        _lable_title1.textAlignment= NSTextAlignmentLeft;
        _lable_title1.textColor = [UIColor grayColor];
        [self addSubview:_lable_title1];
    //二行
        _view_box1 = [[UIView alloc]initWithFrame:CGRectMake(10*PW, (115*PH)+_view_box.frame.size.height, boxWidth, boxWidth)];
        [_view_box1.layer setBorderWidth:1.0];
        _view_box1.layer.borderColor = [[UIColor grayColor]CGColor];
        [self addSubview:_view_box1];
    
        _view_box7 = [[UIView alloc]initWithFrame:CGRectMake((20*PW)+boxWidth*1, _view_box1.frame.origin.y, boxWidth, boxWidth)];
        [_view_box7.layer setBorderWidth:1.0];
        _view_box7.layer.borderColor = [[UIColor grayColor]CGColor];
        [self addSubview:_view_box7];
        
        _view_box8 = [[UIView alloc]initWithFrame:CGRectMake((30*PW)+boxWidth*2, _view_box1.frame.origin.y, boxWidth, boxWidth)];
        [_view_box8.layer setBorderWidth:1.0];
        _view_box8.layer.borderColor = [[UIColor grayColor]CGColor];
        [self addSubview:_view_box8];
        
        _view_box9 = [[UIView alloc]initWithFrame:CGRectMake((40*PW)+boxWidth*3, _view_box1.frame.origin.y, boxWidth, boxWidth)];
        [_view_box9.layer setBorderWidth:1.0];
        _view_box9.layer.borderColor = [[UIColor grayColor]CGColor];
        [self addSubview:_view_box9];
        
        _view_box10 = [[UIView alloc]initWithFrame:CGRectMake((50*PW)+boxWidth*4, _view_box1.frame.origin.y, boxWidth, boxWidth)];
        [_view_box10.layer setBorderWidth:1.0];
        _view_box10.layer.borderColor = [[UIColor grayColor]CGColor];
        [self addSubview:_view_box10];
        
        _view_box11 = [[UIView alloc]initWithFrame:CGRectMake((60*PW)+boxWidth*5, _view_box1.frame.origin.y, boxWidth, boxWidth)];
        [_view_box11.layer setBorderWidth:1.0];
        _view_box11.layer.borderColor = [[UIColor grayColor]CGColor];
        [self addSubview:_view_box11];
        
        
        ///   密码点
        _lable_point = [[UILabel alloc]init];
        _lable_point.frame = CGRectMake((_view_box.frame.size.width-(10*PW))/2, (_view_box.frame.size.width-(10*PW))/2, 10*PW, 10*PW);
        [_lable_point.layer setCornerRadius:5];
        [_lable_point.layer setMasksToBounds:YES];
        _lable_point.backgroundColor = [UIColor blackColor];
        [_view_box addSubview:_lable_point];
        
        _lable_point2 = [[UILabel alloc]init];
        _lable_point2.frame = CGRectMake((_view_box.frame.size.width-(10*PW))/2, (_view_box.frame.size.width-(10*PW))/2, 10*PW, 10*PW);
        [_lable_point2.layer setCornerRadius:5];
        [_lable_point2.layer setMasksToBounds:YES];
        _lable_point2.backgroundColor = [UIColor blackColor];
        [_view_box2 addSubview:_lable_point2];
        
        
        _lable_point3 = [[UILabel alloc]init];
        _lable_point3.frame = CGRectMake((_view_box.frame.size.width-(10*PW))/2, (_view_box.frame.size.width-(10*PW))/2, 10*PW, 10*PW);
        [_lable_point3.layer setCornerRadius:5];
        [_lable_point3.layer setMasksToBounds:YES];
        _lable_point3.backgroundColor = [UIColor blackColor];
        [_view_box3 addSubview:_lable_point3];
        
        _lable_point4 = [[UILabel alloc]init];
        _lable_point4.frame = CGRectMake((_view_box.frame.size.width-(10*PW))/2, (_view_box.frame.size.width-(10*PW))/2, 10*PW, 10*PW);
        [_lable_point4.layer setCornerRadius:5];
        [_lable_point4.layer setMasksToBounds:YES];
        _lable_point4.backgroundColor = [UIColor blackColor];
        [_view_box4 addSubview:_lable_point4];
        
        _lable_point5 = [[UILabel alloc]init];
        _lable_point5.frame = CGRectMake((_view_box.frame.size.width-(10*PW))/2, (_view_box.frame.size.width-(10*PW))/2, 10*PW, 10*PW);
        [_lable_point5.layer setCornerRadius:5];
        [_lable_point5.layer setMasksToBounds:YES];
        _lable_point5.backgroundColor = [UIColor blackColor];
        [_view_box5 addSubview:_lable_point5];
        
        _lable_point6 = [[UILabel alloc]init];
        _lable_point6.frame = CGRectMake((_view_box.frame.size.width-(10*PW))/2, (_view_box.frame.size.width-(10*PW))/2, 10*PW, 10*PW);
        [_lable_point6.layer setCornerRadius:5];
        [_lable_point6.layer setMasksToBounds:YES];
        _lable_point6.backgroundColor = [UIColor blackColor];
        [_view_box6 addSubview:_lable_point6];
        
//二行
        _lable_point7 = [[UILabel alloc]init];
        _lable_point7.frame = CGRectMake((_view_box1.frame.size.width-(10*PW))/2, (_view_box.frame.size.width-(10*PW))/2, 10*PW, 10*PW);
        [_lable_point7.layer setCornerRadius:5];
        [_lable_point7.layer setMasksToBounds:YES];
        _lable_point7.backgroundColor = [UIColor blackColor];
        [_view_box1 addSubview:_lable_point7];
        
        _lable_point8 = [[UILabel alloc]init];
        _lable_point8.frame = CGRectMake((_view_box1.frame.size.width-(10*PW))/2, (_view_box1.frame.size.width-(10*PW))/2, 10*PW, 10*PW);
        [_lable_point8.layer setCornerRadius:5];
        [_lable_point8.layer setMasksToBounds:YES];
        _lable_point8.backgroundColor = [UIColor blackColor];
        [_view_box7 addSubview:_lable_point8];
        
        
        _lable_point9 = [[UILabel alloc]init];
        _lable_point9.frame = CGRectMake((_view_box1.frame.size.width-(10*PW))/2, (_view_box1.frame.size.width-(10*PW))/2, 10*PW, 10*PW);
        [_lable_point9.layer setCornerRadius:5];
        [_lable_point9.layer setMasksToBounds:YES];
        _lable_point9.backgroundColor = [UIColor blackColor];
        [_view_box8 addSubview:_lable_point9];
        
        _lable_point10 = [[UILabel alloc]init];
        _lable_point10.frame = CGRectMake((_view_box1.frame.size.width-(10*PW))/2, (_view_box1.frame.size.width-(10*PW))/2, 10*PW, 10*PW);
        [_lable_point10.layer setCornerRadius:5];
        [_lable_point10.layer setMasksToBounds:YES];
        _lable_point10.backgroundColor = [UIColor blackColor];
        [_view_box9 addSubview:_lable_point10];
        
        _lable_point11 = [[UILabel alloc]init];
        _lable_point11.frame = CGRectMake((_view_box1.frame.size.width-(10*PW))/2, (_view_box1.frame.size.width-(10*PW))/2, 10*PW, 10*PW);
        [_lable_point11.layer setCornerRadius:5];
        [_lable_point11.layer setMasksToBounds:YES];
        _lable_point11.backgroundColor = [UIColor blackColor];
        [_view_box10 addSubview:_lable_point11];
        
        _lable_point12 = [[UILabel alloc]init];
        _lable_point12.frame = CGRectMake((_view_box1.frame.size.width-(10*PW))/2, (_view_box1.frame.size.width-(10*PW))/2, 10*PW, 10*PW);
        [_lable_point12.layer setCornerRadius:5];
        [_lable_point12.layer setMasksToBounds:YES];
        _lable_point12.backgroundColor = [UIColor blackColor];
        [_view_box11 addSubview:_lable_point12];
        
        _view_box.userInteractionEnabled = YES;
        _view_box1.userInteractionEnabled = YES;
        _view_box10.userInteractionEnabled = YES;
        _view_box11.userInteractionEnabled = YES;
        _view_box2.userInteractionEnabled = YES;
        _view_box3.userInteractionEnabled = YES;
        _view_box4.userInteractionEnabled = YES;
        _view_box5.userInteractionEnabled = YES;
        _view_box6.userInteractionEnabled = YES;
        _view_box7.userInteractionEnabled = YES;
        
        _view_box8.userInteractionEnabled = YES;
        _view_box9.userInteractionEnabled = YES;
        
        UITapGestureRecognizer *t1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dosomething)];
        [_view_box addGestureRecognizer:t1];
        
        UITapGestureRecognizer *t2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dosomething)];
        [_view_box1 addGestureRecognizer:t2];
        
        UITapGestureRecognizer *t3 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dosomething)];
        [_view_box10 addGestureRecognizer:t3];
        
        UITapGestureRecognizer *t4 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dosomething)];
        [_view_box11 addGestureRecognizer:t4];
        
        UITapGestureRecognizer *t5 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dosomething)];
        [_view_box2 addGestureRecognizer:t5];
        
        UITapGestureRecognizer *t6 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dosomething)];
        [_view_box3 addGestureRecognizer:t6];
        
        UITapGestureRecognizer *t7 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dosomething)];
        [_view_box4 addGestureRecognizer:t7];
        
        UITapGestureRecognizer *t8 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dosomething)];
        [_view_box5 addGestureRecognizer:t8];
        
        UITapGestureRecognizer *t9 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dosomething)];
        [_view_box6 addGestureRecognizer:t9];
        
        UITapGestureRecognizer *t10 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dosomething)];
        [_view_box7 addGestureRecognizer:t10];
        
        UITapGestureRecognizer *t11 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dosomething)];
        [_view_box8 addGestureRecognizer:t11];
        
        UITapGestureRecognizer *t12 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dosomething)];
        [_view_box9 addGestureRecognizer:t12];

        
        _lable_point.hidden=YES;
        _lable_point2.hidden=YES;
        _lable_point3.hidden=YES;
        _lable_point4.hidden=YES;
        _lable_point5.hidden=YES;
        _lable_point6.hidden=YES;
        _lable_point7.hidden = YES;
        _lable_point8.hidden = YES;
        _lable_point9.hidden = YES;
        _lable_point10.hidden = YES;
        _lable_point11.hidden = YES;
        _lable_point12.hidden = YES;





        
    }
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
            _lable_point7.hidden = YES;
             _lable_point8.hidden = YES;
             _lable_point9.hidden = YES;
             _lable_point10.hidden = YES;
             _lable_point11.hidden = YES;
             _lable_point12.hidden = YES;
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
            _lable_point7.hidden = YES;
            _lable_point8.hidden = YES;
            _lable_point9.hidden = YES;
            _lable_point10.hidden = YES;
            _lable_point11.hidden = YES;
            _lable_point12.hidden = YES;
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
            _lable_point7.hidden = YES;
            _lable_point8.hidden = YES;
            _lable_point9.hidden = YES;
            _lable_point10.hidden = YES;
            _lable_point11.hidden = YES;
            _lable_point12.hidden = YES;
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
            _lable_point7.hidden = YES;
            _lable_point8.hidden = YES;
            _lable_point9.hidden = YES;
            _lable_point10.hidden = YES;
            _lable_point11.hidden = YES;
            _lable_point12.hidden = YES;
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
            _lable_point7.hidden = YES;
            _lable_point8.hidden = YES;
            _lable_point9.hidden = YES;
            _lable_point10.hidden = YES;
            _lable_point11.hidden = YES;
            _lable_point12.hidden = YES;
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
            _lable_point7.hidden = YES;
            _lable_point8.hidden = YES;
            _lable_point9.hidden = YES;
            _lable_point10.hidden = YES;
            _lable_point11.hidden = YES;
            _lable_point12.hidden = YES;
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
            _lable_point7.hidden = YES;
            _lable_point8.hidden = YES;
            _lable_point9.hidden = YES;
            _lable_point10.hidden = YES;
            _lable_point11.hidden = YES;
            _lable_point12.hidden = YES;
        }
            break;
        case 7:
        {
            _lable_point.hidden=NO;
            _lable_point2.hidden=NO;
            _lable_point3.hidden=NO;
            _lable_point4.hidden=NO;
            _lable_point5.hidden=NO;
            _lable_point6.hidden=NO;
            _lable_point7.hidden = NO;
            _lable_point8.hidden = YES;
            _lable_point9.hidden = YES;
            _lable_point10.hidden = YES;
            _lable_point11.hidden = YES;
            _lable_point12.hidden = YES;
        }
            break;
        case 8:
        {
            _lable_point.hidden=NO;
            _lable_point2.hidden=NO;
            _lable_point3.hidden=NO;
            _lable_point4.hidden=NO;
            _lable_point5.hidden=NO;
            _lable_point6.hidden=NO;
            _lable_point7.hidden = NO;
            _lable_point8.hidden = NO;
            _lable_point9.hidden = YES;
            _lable_point10.hidden = YES;
            _lable_point11.hidden = YES;
            _lable_point12.hidden = YES;
        }
            break;
        case 9:
        {
            _lable_point.hidden=NO;
            _lable_point2.hidden=NO;
            _lable_point3.hidden=NO;
            _lable_point4.hidden=NO;
            _lable_point5.hidden=NO;
            _lable_point6.hidden=NO;
            _lable_point7.hidden = NO;
            _lable_point8.hidden = NO;
            _lable_point9.hidden = NO;
            _lable_point10.hidden = YES;
            _lable_point11.hidden = YES;
            _lable_point12.hidden = YES;
        }
            break;
        case 10:
        {
            _lable_point.hidden=NO;
            _lable_point2.hidden=NO;
            _lable_point3.hidden=NO;
            _lable_point4.hidden=NO;
            _lable_point5.hidden=NO;
            _lable_point6.hidden=NO;
            _lable_point7.hidden = NO;
            _lable_point8.hidden = NO;
            _lable_point9.hidden = NO;
            _lable_point10.hidden = NO;
            _lable_point11.hidden = YES;
            _lable_point12.hidden = YES;
        }
            break;
        case 11:
        {
            _lable_point.hidden=NO;
            _lable_point2.hidden=NO;
            _lable_point3.hidden=NO;
            _lable_point4.hidden=NO;
            _lable_point5.hidden=NO;
            _lable_point6.hidden=NO;
            _lable_point7.hidden = NO;
            _lable_point8.hidden = NO;
            _lable_point9.hidden = NO;
            _lable_point10.hidden = NO;
            _lable_point11.hidden = NO;
            _lable_point12.hidden = YES;
        }
            break;
        case 12:
        {
            _lable_point.hidden=NO;
            _lable_point2.hidden=NO;
            _lable_point3.hidden=NO;
            _lable_point4.hidden=NO;
            _lable_point5.hidden=NO;
            _lable_point6.hidden=NO;
            _lable_point7.hidden = NO;
            _lable_point8.hidden = NO;
            _lable_point9.hidden = NO;
            _lable_point10.hidden = NO;
            _lable_point11.hidden = NO;
            _lable_point12.hidden = NO;
        }
            break;
        default:
            break;
    }
    
    
    if (_field.text.length==12)
    {        
        [self.TXTradePasswordDelegate TXTradePasswordView:self WithPasswordString:_field.text];
        
}
    
   

}
-(void)dosomething{
    [_TF becomeFirstResponder];
}
@end
