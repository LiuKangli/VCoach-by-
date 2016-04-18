//
//  tuijianstatus.h
//  VCoach
//
//  Created by apple on 15/4/27.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface tuijianstatus : NSObject

@property(nonatomic,copy)NSString *Class_id;
@property(nonatomic,copy)NSString *Title;
@property(nonatomic,copy)NSString *Ad_image_url;
@property(nonatomic,copy)NSString *Simple_introduce;
@property(nonatomic,copy)NSString *Price;

+ (tuijianstatus *)initclass_id:(NSString *)class_id inittitle:(NSString*)title initad_image_url:(NSString *)ad_image_url initprice:(NSString *)price initsimple_introduce:(NSString *)simple_introduce;

+ (tuijianstatus *)statusWithDict:(NSDictionary *)dict;

- (tuijianstatus *)initWithDict:(NSDictionary *)dict;


@end
