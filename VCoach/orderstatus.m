


//
//  orderstatus.m
//  VCoach
//
//  Created by apple on 15/5/19.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "orderstatus.h"
#import "PostClass.h"

@implementation orderstatus

+ (orderstatus *)initorder_id:(NSString *)order_id initad_image_url:(NSString*)ad_image_url inittitle:(NSString *)title initsimple_introduce:(NSString *)simple_introduce initprice:(NSString *)price initcoacher_id:(NSString *)coacher_id initorder_status:(NSString *)order_status{
    
    orderstatus *status = [[orderstatus alloc]init];
    
    status.order_id = order_id;
    status.ad_image_url = ad_image_url;
    status.title = title;
    status.simple_introduce = simple_introduce;
    status.price = price;
    status.coacher_id = coacher_id;
    status.order_status = order_status;
    
    return status;

}

+ (orderstatus *)statusWithDict:(NSDictionary *)dict{
    
    return [[self alloc]initWithDict:dict];

}

- (orderstatus *)initWithDict:(NSDictionary *)dict{
    
    
    if (self = [super init]) {
        
        if ([ PostClass getnet] == 0) {
            //网络环境为0，插入coredata数据
            
            
        }else{
            //coredata没有数据  加载数据
            if (dict == nil) {
            }
            
            self.order_id = dict[@"order_id"];
            self.ad_image_url = dict[@"ad_image_url"];
            self.title = dict[@"title"] ;
            self.simple_introduce = dict[@"simple_introduce"];
            self.price = dict[@"price"];
            self.coacher_id = dict[@"coacher_id"];
            self.order_status = dict[@"order_status"];
            
            //将数据更新到coredata
            
        }
    }
    return self;
    
}


@end
