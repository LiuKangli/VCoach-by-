//
//  cell.h
//  VCoach
//
//  Created by Moon on 16/1/25.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface cell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *lable;
@property (nonatomic,assign) int select;
-(void)set:(int)ty;
@end
