//
//  AFNetWorking.h
//  VCoach
//
//  Created by Moon on 16/1/12.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "AFHTTPRequestOperationManager.h"
@interface AFNetWorking : NSObject
@property (nonatomic,copy ) NSString *Url;
@property (nonatomic,copy ) NSDictionary *parameters;

-(void)geturl:(NSString*)url parameter:(NSDictionary*)dic;
-(void)getData:(NSString *)url parameter:(NSDictionary*)dic;
@end
