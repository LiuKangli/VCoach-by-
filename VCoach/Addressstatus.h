//
//  Addressstatus.h
//  VCoach
//
//  Created by apple on 15/5/7.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Addressstatus : NSObject

@property(nonatomic,copy)NSString *address_id;
@property(nonatomic,copy)NSString *recieve;
@property(nonatomic,copy)NSString *recieve_phone;
@property(nonatomic,copy)NSString *recieve_name;

+ (Addressstatus *)initaddress_id:(NSString *)address_id initrecieve:(NSString*)recieve initrecieve_phone:(NSString *)recieve_phone initrecieve_name:(NSString *)recieve_name;

+ (Addressstatus *)statusWithDict:(NSDictionary *)dict;

- (Addressstatus *)initWithDict:(NSDictionary *)dict;


@end
