//
//  tuijianstatus.m
//  VCoach
//
//  Created by apple on 15/4/27.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "tuijianstatus.h"
#import "PostClass.h"

@implementation tuijianstatus

+ (tuijianstatus *)initclass_id:(NSString *)class_id inittitle:(NSString*)title initad_image_url:(NSString *)ad_image_url initprice:(NSString *)price  initsimple_introduce:(NSString *)simple_introduce
{
    tuijianstatus *Tuijianstatus = [[tuijianstatus alloc]init];
    
    Tuijianstatus.Class_id = class_id;
    Tuijianstatus.Title = title;
    Tuijianstatus.Ad_image_url = ad_image_url;
    Tuijianstatus.Price = price;
    Tuijianstatus.Simple_introduce = simple_introduce;
    return Tuijianstatus;
    
}

+ (tuijianstatus *)statusWithDict:(NSDictionary *)dict{
    
    return [[self alloc]initWithDict:dict];
    
}

- (tuijianstatus *)initWithDict:(NSDictionary *)dict{
    
    if (self = [super init]) {
        
        if ([ PostClass getnet] == 0) {
            //网络环境为0，插入coredata数据
            
            
        }else{
            //coredata没有数据  加载数据
            if (dict == nil) {
            }
            
            self.Class_id = dict[@"class_id"];
            self.Title = dict[@"title"] ;
            self.Ad_image_url = dict[@"ad_image_url"];
            self.Simple_introduce = dict[@"simple_introduce"];
            self.Price = dict[@"price"];
            
            //将数据更新到coredata
            
        }
    }
    return self;
}

@end
