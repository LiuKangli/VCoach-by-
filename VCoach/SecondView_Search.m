//
//  SecondView_Search.m
//  VCoach
//
//  Created by Moon on 16/1/8.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "SecondView_Search.h"

@implementation SecondView_Search
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.searchBarStyle = UISearchBarStyleMinimal;
        self.placeholder = @"搜索教练/运动分类";
        //self.backgroundColor = [UIColor redColor];
    }
    return self;
}





@end
