

//
//  Choosecoachstatus.m
//  VCoach
//
//  Created by apple on 15/5/18.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "Choosecoachstatus.h"
#import "PostClass.h"

@implementation Choosecoachstatus


+ (Choosecoachstatus *)initcoacher_id:(NSString *)Coacher_id initcoacher_name:(NSString *)Coacher_name inithead_pic:(NSString*)Head_pic inituser_sex:(NSString *)User_sex inituser_speciality:(NSString *)User_speciality inituser_work_experience:(NSString *)User_work_experience inittrans_sum:(NSString *)Trans_sum{
    Choosecoachstatus *choosecoachstatus = [[Choosecoachstatus alloc]init];
    
    choosecoachstatus.coacher_id = Coacher_id;
    choosecoachstatus.coacher_name = Coacher_name;
    choosecoachstatus.head_pic = Head_pic;
    choosecoachstatus.user_sex = User_sex;
    choosecoachstatus.user_speciality = User_speciality;
    choosecoachstatus.user_work_experience = User_work_experience;
    choosecoachstatus.trans_sum = Trans_sum;
    
    return choosecoachstatus;

}

+ (Choosecoachstatus *)statusWithDict:(NSDictionary *)dict{
    
    return [[self alloc]initWithDict:dict];

    
}

- (Choosecoachstatus *)initWithDict:(NSDictionary *)dict{
    
    if (self = [super init]) {
        
        if ([ PostClass getnet] == 0) {
            //网络环境为0，插入coredata数据
            
            
        }else{
            //coredata没有数据  加载数据
            if (dict == nil) {
            }
            self.coacher_id = dict[@"coacher_id"];
            self.coacher_name = dict[@"coacher_name"];
            self.head_pic = dict[@"head_pic"] ;
            self.user_sex = dict[@"coacher_sex"];
            self.user_speciality = dict[@"coacher_speciality"];
            self.user_work_experience = dict[@"coacher_experience"];
            self.trans_sum = dict[@"order_sum"];
            //将数据更新到coredata
            
        }
    }
    return self;
    
}


@end
