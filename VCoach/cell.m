//
//  cell.m
//  VCoach
//
//  Created by Moon on 16/1/25.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "cell.h"

@implementation cell{
    int _select;
}

- (void)awakeFromNib {
        // Initialization code
}
-(void)set:(int)ty{
    _select = ty;
}
-(void)setSelected:(BOOL)selected{
    [super setSelected:selected];
    if (_select == 1) {
        self.backgroundColor = [UIColor brownColor];
        _select = 0;
    }else if (_select == 0){
        self.backgroundColor = [UIColor colorWithRed:1.000f green:0.678f blue:0.518f alpha:1.00f];
        _select = 1;
    }

}
@end
