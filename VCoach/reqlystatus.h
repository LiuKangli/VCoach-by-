//
//  reqlystatus.h
//  VCoach
//
//  Created by apple on 15/5/5.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface reqlystatus : NSObject

@property(nonatomic,copy)NSString *Reply_user_phone;
@property(nonatomic,copy)NSString *User_nickname;
@property(nonatomic,copy)NSString *Reply_text;
@property(nonatomic,copy)NSString *Reply_point;
@property(nonatomic,copy)NSString *Reply_time;

+ (reqlystatus *)initreply_user_phone:(NSString *)reply_user_phone inituser_nickname:(NSString*)user_nickname initreply_text:(NSString *)reply_text initreply_point:(NSString *)reply_point initreply_time:(NSString *)reply_time;

+ (reqlystatus *)statusWithDict:(NSDictionary *)dict;

- (reqlystatus *)initWithDict:(NSDictionary *)dict;


@end
