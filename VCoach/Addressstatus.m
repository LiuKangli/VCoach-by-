//
//  Addressstatus.m
//  VCoach
//
//  Created by apple on 15/5/7.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "Addressstatus.h"
#import "PostClass.h"

@implementation Addressstatus


+ (Addressstatus *)initaddress_id:(NSString *)address_id initrecieve:(NSString*)recieve initrecieve_phone:(NSString *)recieve_phone initrecieve_name:(NSString *)recieve_name{
    Addressstatus *addressstatus = [[Addressstatus alloc]init];
    
    addressstatus.address_id = address_id;
    addressstatus.recieve = recieve;
    addressstatus.recieve_phone = recieve_phone;
    addressstatus.recieve_name = recieve_name;
    
    return addressstatus;

}

+ (Addressstatus *)statusWithDict:(NSDictionary *)dict{
    
    return [[self alloc]initWithDict:dict];

}

- (Addressstatus *)initWithDict:(NSDictionary *)dict{
    
    
    if (self = [super init]) {
        
        if ([ PostClass getnet] == 0) {
            //网络环境为0，插入coredata数据
            
            
        }else{
            //coredata没有数据  加载数据
            if (dict == nil) {
            }
            
            self.address_id = dict[@"address_id"];
            NSString *str = [NSString stringWithFormat:@"%@%@%@%@",dict[@"recieve_province"],dict[@"recieve_city"],dict[@"recieve_area"],dict[@"recieve_detail_address"]];
            self.recieve = str;
            self.recieve_phone = dict[@"recieve_phone"];
            self.recieve_name = dict[@"recieve_name"];
            
            //将数据更新到coredata
            
        }
    }
    return self;
}


@end
