//
//  orderstatus.h
//  VCoach
//
//  Created by apple on 15/5/19.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface orderstatus : NSObject

@property(nonatomic,copy)NSString *order_id;
@property(nonatomic,copy)NSString *ad_image_url;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *simple_introduce;
@property(nonatomic,copy)NSString *price;
@property(nonatomic,copy)NSString *coacher_id;
@property(nonatomic,copy)NSString *order_status;


+ (orderstatus *)initorder_id:(NSString *)order_id initad_image_url:(NSString*)ad_image_url inittitle:(NSString *)title initsimple_introduce:(NSString *)simple_introduce initprice:(NSString *)price initcoacher_id:(NSString *)coacher_id initorder_status:(NSString *)order_status;

+ (orderstatus *)statusWithDict:(NSDictionary *)dict;

- (orderstatus *)initWithDict:(NSDictionary *)dict;


@end
