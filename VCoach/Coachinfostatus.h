//
//  Coachinfostatus.h
//  VCoach
//
//  Created by apple on 15/4/28.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Coachinfostatus : NSObject

@property(nonatomic,copy)NSString *class_id;
@property(nonatomic,copy)NSString *ad_image_url;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *price;

+ (Coachinfostatus *)initclass_id:(NSString *)Class_id initad_image_url:(NSString*)Ad_image_url inittitle:(NSString *)Title initprice:(NSString *)Price;

+ (Coachinfostatus *)statusWithDict:(NSDictionary *)dict;

- (Coachinfostatus *)initWithDict:(NSDictionary *)dict;

@end
