//
//  AddressViewCell.m
//  VCoach
//
//  Created by apple on 15/5/7.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "AddressViewCell.h"

@implementation AddressViewCell
{
    
    int _selectstatus ;
    
}

-(void)ser:(int)i{
    _selectstatus = i;
}
- (void)awakeFromNib {
 // _selectstatus = 1;
   // self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    if (_selectstatus == 0) {
        self.selectimg.image = [UIImage imageNamed:@"xuanzebtn.png"];
        self.userInteractionEnabled = NO;
        _selectstatus = 1;
        
    }else if(_selectstatus == 1){
        self.userInteractionEnabled = YES;
        self.selectimg.image = [UIImage imageNamed:@"yuanioc.png"];
        _selectstatus = 0;
        
    }
    //NSLog(@"  ---%d",selectstatus);

    
}

@end
