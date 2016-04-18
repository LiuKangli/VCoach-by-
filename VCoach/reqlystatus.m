//
//  reqlystatus.m
//  VCoach
//
//  Created by apple on 15/5/5.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "reqlystatus.h"
#import "PostClass.h"

@implementation reqlystatus


+ (reqlystatus *)initreply_user_phone:(NSString *)reply_user_phone inituser_nickname:(NSString*)user_nickname initreply_text:(NSString *)reply_text initreply_point:(NSString *)reply_point initreply_time:(NSString *)reply_time{

    reqlystatus *Reqlystatus = [[reqlystatus alloc]init];
    
    Reqlystatus.Reply_user_phone = reply_user_phone;
    Reqlystatus.User_nickname = user_nickname;
    Reqlystatus.Reply_text = reply_text;
    Reqlystatus.Reply_point = reply_point;
    Reqlystatus.Reply_time = reply_time;
    
    return Reqlystatus;

}

+ (reqlystatus *)statusWithDict:(NSDictionary *)dict{

    return [[self alloc]initWithDict:dict];

}

- (reqlystatus *)initWithDict:(NSDictionary *)dict{

    if (self = [super init]) {
        
        if ([ PostClass getnet] == 0) {
            //网络环境为0，插入coredata数据
            
            
        }else{
            //coredata没有数据  加载数据
            if (dict == nil) {
            }
            
            self.Reply_user_phone = dict[@"reply_user_phone"];
            self.User_nickname = dict[@"user_nickname"] ;
            self.Reply_text = dict[@"reply_text"];
            self.Reply_point = dict[@"reply_point"];
            self.Reply_time = dict[@"reply_time"];
            
            //将数据更新到coredata
            
        }
    }
    return self;


}

@end
