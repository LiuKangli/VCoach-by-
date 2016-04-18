//
//  AddaddressViewController.h
//  VCoach
//
//  Created by apple on 15/5/13.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddaddressViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *backView;
@property (weak, nonatomic) IBOutlet UILabel *backTITLE;
@property (weak, nonatomic) IBOutlet UIButton *BackBtn;
@property (weak, nonatomic) IBOutlet UIButton *morenBtn;
@property (weak, nonatomic) IBOutlet UIImageView *morenimg;
@property (weak, nonatomic) IBOutlet UILabel *morenLable;
@property (weak, nonatomic) IBOutlet UIImageView *backImage;

@property (weak, nonatomic) IBOutlet UIView *provinceView;
@property (weak, nonatomic) IBOutlet UILabel *provinceLable;
@property (weak, nonatomic) IBOutlet UIImageView *provinceRightImage;
@property (weak, nonatomic) IBOutlet UILabel *provinceTopLable;







@property (weak, nonatomic) IBOutlet UIView *cityView;
@property (weak, nonatomic) IBOutlet UILabel *cityLable;
@property (weak, nonatomic) IBOutlet UIImageView *cityRightImage;
@property (weak, nonatomic) IBOutlet UILabel *cityTopLable;
@property (weak, nonatomic) IBOutlet UIView *areraView;
@property (weak, nonatomic) IBOutlet UIView *jiedaoView;

@property (weak, nonatomic) IBOutlet UILabel *jiedaoTopTltle;
@property (weak, nonatomic) IBOutlet UIImageView *jiedaoRightImage;
@property (weak, nonatomic) IBOutlet UITextField *jiedaoTextFiled;


@property (weak, nonatomic) IBOutlet UIView *nameView;
@property (weak, nonatomic) IBOutlet UILabel *nameTopTitle;
@property (weak, nonatomic) IBOutlet UIImageView *nameRightImage;
@property (weak, nonatomic) IBOutlet UITextField *nameTltle;





@property (weak, nonatomic) IBOutlet UIView *phoneView;
@property (weak, nonatomic) IBOutlet UILabel *phoneTopTitle;
@property (weak, nonatomic) IBOutlet UIImageView *phoneRoghtImage;
@property (weak, nonatomic) IBOutlet UITextField *phonrTextFILED;




@property (weak, nonatomic) IBOutlet UIButton *moren;
@property (weak, nonatomic) IBOutlet UILabel *arearTitle;
@property (weak, nonatomic) IBOutlet UIImageView *areraRightImage;
@property (weak, nonatomic) IBOutlet UILabel *areraTopTitle;

@property (weak, nonatomic) IBOutlet UIButton *realBack;


@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIButton *baocun;


@property (nonatomic,strong) NSString *provinceN;
@property (nonatomic,strong) NSString *cityN;
@property (nonatomic,strong) NSString *areaN;
@property (nonatomic,strong) NSString *jieN;
@property (nonatomic,strong) NSString *phoneN;
@property (nonatomic,strong) NSString *peopleN;

@property (nonatomic,strong) NSString *provinceDM;
@property (nonatomic,strong) NSString *cityDM;
@property (nonatomic,strong) NSString *areraDM;
@property (nonatomic,strong) NSString *adrssID;


@end
