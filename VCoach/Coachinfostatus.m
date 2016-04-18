//
//  Coachinfostatus.m
//  VCoach
//
//  Created by apple on 15/4/28.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "Coachinfostatus.h"
#import "PostClass.h"

@implementation Coachinfostatus

+ (Coachinfostatus *)initclass_id:(NSString *)Class_id initad_image_url:(NSString*)Ad_image_url inittitle:(NSString *)Title initprice:(NSString *)Price{

    Coachinfostatus *coachinfostatus = [[Coachinfostatus alloc]init];
    
    coachinfostatus.class_id = Class_id;
    coachinfostatus.ad_image_url = Ad_image_url;
    coachinfostatus.title = Title;
    coachinfostatus.price = Price;
    
    return coachinfostatus;

}

+ (Coachinfostatus *)statusWithDict:(NSDictionary *)dict{

    return [[self alloc]initWithDict:dict];

}

- (Coachinfostatus *)initWithDict:(NSDictionary *)dict{


    if (self = [super init]) {
        
        if ([ PostClass getnet] == 0) {
            //网络环境为0，插入coredata数据
            
            
        }else{
            //coredata没有数据  加载数据
            if (dict == nil) {
            }
            
            self.class_id = dict[@"class_id"];
            self.ad_image_url = dict[@"ad_image_url"] ;
            self.title = dict[@"title"];
            self.price = dict[@"price"];
            
            //将数据更新到coredata
            
        }
    }
    return self;

}


@end
