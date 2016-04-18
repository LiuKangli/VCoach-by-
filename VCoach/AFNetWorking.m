//
//  AFNetWorking.m
//  VCoach
//
//  Created by Moon on 16/1/12.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "AFNetWorking.h"
#import "VTeacher.pch"
@implementation AFNetWorking
-(void)geturl:(NSString*)url parameter:(NSDictionary*)dic{
    _Url = [MainUrl stringByAppendingString:url];
    _parameters = dic;
    
    
}
-(void)getData:(NSString *)url parameter:(NSDictionary *)dic{
    
    
}
@end
