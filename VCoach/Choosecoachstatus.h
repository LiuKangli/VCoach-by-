//
//  Choosecoachstatus.h
//  VCoach
//
//  Created by apple on 15/5/18.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Choosecoachstatus : NSObject

@property(nonatomic,copy)NSString *coacher_id;
@property(nonatomic,copy)NSString *coacher_name;
@property(nonatomic,copy)NSString *head_pic;
@property(nonatomic,copy)NSString *user_sex;
@property(nonatomic,copy)NSString *user_speciality;
@property(nonatomic,copy)NSString *user_work_experience;
@property(nonatomic,copy)NSString *trans_sum;

+ (Choosecoachstatus *)initcoacher_id:(NSString *)Coacher_id initcoacher_name:(NSString *)Coacher_name inithead_pic:(NSString*)Head_pic inituser_sex:(NSString *)User_sex inituser_speciality:(NSString *)User_speciality inituser_work_experience:(NSString *)User_work_experience inittrans_sum:(NSString *)Trans_sum;

+ (Choosecoachstatus *)statusWithDict:(NSDictionary *)dict;

- (Choosecoachstatus *)initWithDict:(NSDictionary *)dict;

@end
