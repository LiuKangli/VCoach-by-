//
//  PostClass.h
//  LikeDogGroupBuy
//
//  Created by apple on 15/4/8.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Reachability.h"

@interface PostClass : NSObject

//判断网络状况
+ (int) getnet;

//coredata



//网络请求
+ (NSData *) initwithurl:(NSString *)urlstr;

+ (NSString *) initurl:(NSString *)urlstr;

+ (NSDictionary *) initposturl:(NSString *)urlstr initparameter1:(NSString *)parameter1 initvalue1:(NSString *)value1;

+ (NSDictionary *) initposturl:(NSString *)urlstr initparameter1:(NSString *)parameter1 initvalue1:(NSString *)value1 nitparameter2:(NSString *)parameter2 initvalue2:(NSString *)value2;

+ (NSDictionary *) initposturl:(NSString *)urlstr initparameter1:(NSString *)parameter1 initvalue1:(NSString *)value1 nitparameter2:(NSString *)parameter2 initvalue2:(NSString *)value2 nitparameter3:(NSString *)parameter3 initvalue3:(NSString *)value3;

+ (NSDictionary *) initposturl:(NSString *)urlstr initparameter1:(NSString *)parameter1 initvalue1:(NSString *)value1 nitparameter2:(NSString *)parameter2 initvalue2:(NSString *)value2 nitparameter3:(NSString *)parameter3 initvalue3:(NSString *)value3 nitparameter4:(NSString *)parameter4 initvalue4:(NSString *)value4;

+ (NSDictionary *) initposturl:(NSString *)urlstr initparameter1:(NSString *)parameter1 initvalue1:(NSString *)value1 nitparameter2:(NSString *)parameter2 initvalue2:(NSString *)value2 nitparameter3:(NSString *)parameter3 initvalue3:(NSString *)value3 nitparameter4:(NSString *)parameter4 initvalue4:(NSString *)value4 nitparameter5:(NSString *)parameter5 initvalue5:(NSString *)value5;

+ (NSDictionary *) initposturl:(NSString *)urlstr initparameter1:(NSString *)parameter1 initvalue1:(NSString *)value1 nitparameter2:(NSString *)parameter2 initvalue2:(NSString *)value2 nitparameter3:(NSString *)parameter3 initvalue3:(NSString *)value3 initparameter4:(NSString *)parameter4 initvalue4:(NSString *)value4 nitparameter5:(NSString *)parameter5 initvalue5:(NSString *)value5 nitparameter6:(NSString *)parameter6 initvalue6:(NSString *)value6 initparameter7:(NSString *)parameter7 initvalue7:(NSString *)value7 nitparameter8:(NSString *)parameter8 initvalue8:(NSString *)value8;

@end
