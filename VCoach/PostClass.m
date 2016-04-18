//
//  PostClass.m
//  LikeDogGroupBuy
//
//  Created by apple on 15/4/8.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "PostClass.h"
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"




@implementation PostClass

+ (int) getnet{
    
    int i = 0;
    Reachability *r = [Reachability reachabilityWithHostName:@"www.baidu.com"];
    switch ([r currentReachabilityStatus]) {
        case NotReachable:
            i = 0;
            break;
        case ReachableViaWWAN:
            i = 1;
            break;
        case ReachableViaWiFi:
            i = 1;
            break;
    
    }
    return i;
}

+ (NSData *) initwithurl:(NSString *)urlstr{

    NSString *urlstr1 = [NSString stringWithFormat:@"http://192.168.1.220/vcoacher%@",urlstr];
    NSURL *url1=[NSURL URLWithString:urlstr1];
    ASIHTTPRequest *httpRequest1=[ASIHTTPRequest requestWithURL:url1];
    [httpRequest1 startSynchronous];
    
    return [httpRequest1 responseData];
}

+ (NSString *) initurl:(NSString *)urlstr{
    
    NSString *urlstr1 = [NSString stringWithFormat:@"http://192.168.1.220/vcoacher/api/%@",urlstr];
    NSURL *url1=[NSURL URLWithString:urlstr1];
    ASIHTTPRequest *httpRequest1=[ASIHTTPRequest requestWithURL:url1];
    [httpRequest1 startSynchronous];
    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:[httpRequest1 responseData] options:NSJSONReadingAllowFragments error:nil];
    
    NSString *results = [dic objectForKey:@"results"];
    
    return results;
}

+ (NSDictionary *) initposturl:(NSString *)urlstr initparameter1:(NSString *)parameter1 initvalue1:(NSString *)value1{

    NSString *urlstr1 = [NSString stringWithFormat:@"http://192.168.1.220/vcoacher/api/%@",urlstr];
    NSURL *url = [NSURL URLWithString:urlstr1];
    
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    [request setPostValue:value1 forKey:parameter1];
    [request setRequestMethod:@"POST"];
    [request startSynchronous];
    
    NSData *response = [request responseData];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingAllowFragments error:nil];
    
    return dic;
}

+ (NSDictionary *) initposturl:(NSString *)urlstr initparameter1:(NSString *)parameter1 initvalue1:(NSString *)value1 nitparameter2:(NSString *)parameter2 initvalue2:(NSString *)value2{
    
    NSString *urlstr1 = [NSString stringWithFormat:@"http://192.168.1.220/vcoacher/api/%@",urlstr];
    NSURL *url = [NSURL URLWithString:urlstr1];
    
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    [request setPostValue:value1 forKey:parameter1];
    [request setPostValue:value2 forKey:parameter2];
    [request setRequestMethod:@"POST"];
    [request startSynchronous];
    
    NSData *response = [request responseData];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingAllowFragments error:nil];
    
    return dic;
    
}
+ (NSDictionary *) initposturl:(NSString *)urlstr initparameter1:(NSString *)parameter1 initvalue1:(NSString *)value1 nitparameter2:(NSString *)parameter2 initvalue2:(NSString *)value2 nitparameter3:(NSString *)parameter3 initvalue3:(NSString *)value3{

    NSString *urlstr1 = [NSString stringWithFormat:@"http://192.168.1.220/vcoacher/api/%@",urlstr];
    NSURL *url = [NSURL URLWithString:urlstr1];
    
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    [request setPostValue:value1 forKey:parameter1];
    [request setPostValue:value2 forKey:parameter2];
    [request setPostValue:value3 forKey:parameter3];
    [request setRequestMethod:@"POST"];
    [request startSynchronous];
    
    NSData *response = [request responseData];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingAllowFragments error:nil];
    
    return dic;
}

+ (NSDictionary *) initposturl:(NSString *)urlstr initparameter1:(NSString *)parameter1 initvalue1:(NSString *)value1 nitparameter2:(NSString *)parameter2 initvalue2:(NSString *)value2 nitparameter3:(NSString *)parameter3 initvalue3:(NSString *)value3 nitparameter4:(NSString *)parameter4 initvalue4:(NSString *)value4{

    NSString *urlstr1 = [NSString stringWithFormat:@"http://192.168.1.220/vcoacher/api/%@",urlstr];
    NSURL *url = [NSURL URLWithString:urlstr1];
    
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    [request setPostValue:value1 forKey:parameter1];
    [request setPostValue:value2 forKey:parameter2];
    [request setPostValue:value3 forKey:parameter3];
    [request setPostValue:value4 forKey:parameter4];

    [request setRequestMethod:@"POST"];
    [request startSynchronous];
    
    NSData *response = [request responseData];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingAllowFragments error:nil];
    
    return dic;
}

+ (NSDictionary *) initposturl:(NSString *)urlstr initparameter1:(NSString *)parameter1 initvalue1:(NSString *)value1 nitparameter2:(NSString *)parameter2 initvalue2:(NSString *)value2 nitparameter3:(NSString *)parameter3 initvalue3:(NSString *)value3 nitparameter4:(NSString *)parameter4 initvalue4:(NSString *)value4 nitparameter5:(NSString *)parameter5 initvalue5:(NSString *)value5{
    
    NSString *urlstr1 = [NSString stringWithFormat:@"http://192.168.1.220/vcoacher/api/%@",urlstr];
    NSURL *url = [NSURL URLWithString:urlstr1];
    
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    [request setPostValue:value1 forKey:parameter1];
    [request setPostValue:value2 forKey:parameter2];
    [request setPostValue:value3 forKey:parameter3];
    [request setPostValue:value4 forKey:parameter4];
    [request setPostValue:value5 forKey:parameter5];
    
    [request setRequestMethod:@"POST"];
    [request startSynchronous];
    
    NSData *response = [request responseData];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingAllowFragments error:nil];
    
    return dic;
}

+ (NSDictionary *) initposturl:(NSString *)urlstr initparameter1:(NSString *)parameter1 initvalue1:(NSString *)value1 nitparameter2:(NSString *)parameter2 initvalue2:(NSString *)value2 nitparameter3:(NSString *)parameter3 initvalue3:(NSString *)value3 initparameter4:(NSString *)parameter4 initvalue4:(NSString *)value4 nitparameter5:(NSString *)parameter5 initvalue5:(NSString *)value5 nitparameter6:(NSString *)parameter6 initvalue6:(NSString *)value6 initparameter7:(NSString *)parameter7 initvalue7:(NSString *)value7 nitparameter8:(NSString *)parameter8 initvalue8:(NSString *)value8{
    
    NSString *urlstr1 = [NSString stringWithFormat:@"http://192.168.1.220/vcoacher/api/%@",urlstr];
    NSURL *url = [NSURL URLWithString:urlstr1];
    
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    [request setPostValue:value1 forKey:parameter1];
    [request setPostValue:value2 forKey:parameter2];
    [request setPostValue:value3 forKey:parameter3];
    [request setPostValue:value4 forKey:parameter4];
    [request setPostValue:value5 forKey:parameter5];
    [request setPostValue:value6 forKey:parameter6];
    [request setPostValue:value7 forKey:parameter7];
    [request setPostValue:value8 forKey:parameter8];
    
    [request setRequestMethod:@"POST"];
    [request startSynchronous];
    
    NSData *response = [request responseData];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingAllowFragments error:nil];
    
    return dic;
    
}

@end
