//
//  InputView.h
//  VCoach
//
//  Created by Moon on 16/1/28.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#define  boxWidth (SCREEN_WIDTH -70)/6 //密码框的宽度


@class InputView;

@protocol TXTradePasswordViewDelegate <NSObject>

@optional

-(void)TXTradePasswordView:(InputView *)view WithPasswordString:(NSString *)Password;

@end



@interface InputView : UIView<UITextFieldDelegate>
-(instancetype)initWithFrame:(CGRect)frame with:(NSString*)mon;
@property (nonatomic,assign)id <TXTradePasswordViewDelegate>TXTradePasswordDelegate;

///标题
@property (nonatomic,)UILabel *lable_title;
///  TF
@property (nonatomic,)UITextField *TF;

@property (nonatomic,strong) UIButton *next;
@property (nonatomic,strong) UILabel *money;
///  假的输入框
@property (nonatomic,)UIView *view_box;
@property (nonatomic,)UIView *view_box2;
@property (nonatomic,)UIView *view_box3;
@property (nonatomic,)UIView *view_box4;
@property (nonatomic,)UIView *view_box5;
@property (nonatomic,)UIView *view_box6;

///   密码点
@property (nonatomic,)UILabel *lable_point;
@property (nonatomic,)UILabel *lable_point2;
@property (nonatomic,)UILabel *lable_point3;
@property (nonatomic,)UILabel *lable_point4;
@property (nonatomic,)UILabel *lable_point5;
@property (nonatomic,)UILabel *lable_point6;
@end
