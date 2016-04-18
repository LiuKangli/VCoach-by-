//
//  IdinfoViewController.m
//  VCoach
//
//  Created by apple on 15/5/20.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "IdinfoViewController.h"
#import "MywalletViewController.h"
#import "VTeacher.pch"
@interface IdinfoViewController ()<UIAlertViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    NSString *imageUrll;
    NSString *newName;
    NSString *newSex;
}
@end

@implementation IdinfoViewController
-(void)viewWillAppear:(BOOL)animated{
    hiddenTabbar(YES);
    self.navigationController.navigationBar.hidden = YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self viewsLay];
    //[self rightBarButtonn];
    _userimg.layer.masksToBounds = YES;
    _userimg.layer.cornerRadius = _userimg.frame.size.width/2;
    [_realback addTarget:self action:@selector(popView) forControlEvents:UIControlEventTouchDown];
    
//头像部分添加点击事件
    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(headImageTouch)];
    [_headImage addGestureRecognizer:recognizer];
     //[self.userimg addTarget:self action:@selector(postheadimg) forControlEvents:UIControlEventTouchDown];
    
    NSString *headImageUrl = [_data objectForKey:@"user_head_pic"];
    if ([[headImageUrl substringToIndex:4]isEqualToString:@"http"]) {
        imageUrll = headImageUrl;
        _userimg.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrll]]];
    }else{
        imageUrll =[ImageUrl stringByAppendingString:headImageUrl];
        NSLog(@"%@",imageUrll);
       _userimg .image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrll]]];
    }
    
   
    
    
    
//姓名
    UITapGestureRecognizer *name_recognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(nameTouch)];
    [_nametouch addGestureRecognizer:name_recognizer];
    
     [self.nameBtn addTarget:self action:@selector(postname) forControlEvents:UIControlEventTouchDown];
    [_nameBtn setTitle:[_data objectForKey:@"user_nickname"] forState:UIControlStateNormal];
    NSDictionary *dicc = @{NSFontAttributeName:_nameBtn.titleLabel.font};
    CGSize sizee  = [_nameBtn.titleLabel.text sizeWithAttributes:dicc];
    _nameBtn.frame = CGRectMake(292*PW, 20*PH, sizee.width, sizee.height);
    _nameBtn.titleLabel.font = [UIFont systemFontOfSize:15*PW];
    
//钱包
    UITapGestureRecognizer *qian_recognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(monouch)];
    [_moneyTouch addGestureRecognizer:qian_recognizer];
    // [self.gowellet addTarget:self action:@selector(postwellet) forControlEvents:UIControlEventTouchDown];
    NSString *many = [_data objectForKey:@"user_money"];
    NSString *mma = [many stringByAppendingString:@"元"];
    _gowellet.text = mma;
    NSDictionary *dic = @{NSFontAttributeName:_gowellet.font};
    CGSize size  = [_gowellet.text sizeWithAttributes:dic];
    _gowellet.frame = CGRectMake(SCREEN_WIDTH-_qianbaoB.frame.size.width-size.width-(21*PW), 16*PH, size.width, size.height);
    _gowellet.font = [UIFont systemFontOfSize:15*PW];
    _gowellet.textAlignment = NSTextAlignmentRight;
   
    
//性别
    UITapGestureRecognizer *sex_recognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(sextouch)];
    [_sexTouch addGestureRecognizer:sex_recognizer];
     [self.sexBtn addTarget:self action:@selector(postsex) forControlEvents:UIControlEventTouchDown];
    NSString *finalSex;
    NSString *sexNum = [_data objectForKey:@"user_sex"];
    if ([sexNum isEqualToString:@"1"]) {
       finalSex = @"女";
    }else{
        finalSex = @"男";
    }
    [_sexBtn setTitle:finalSex forState:UIControlStateNormal];
//座右铭
    UITapGestureRecognizer *zym_recognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(zymTouch)];
    [_qianmingTouch addGestureRecognizer:zym_recognizer];
    _qianmLable.text =[_data objectForKey:@"user_sign"];
   
    CGSize qianmsize = CGSizeMake(250*PW, 1000*PH);
    _qianmLable.font = [UIFont systemFontOfSize:15*PW];
    _qianmLable.numberOfLines = 0;
    CGSize  labSize = [_qianmLable.text sizeWithFont:_qianmLable.font constrainedToSize:qianmsize lineBreakMode:NSLineBreakByCharWrapping];
    _qianmLable.frame = CGRectMake(92*PW, 8*PH, 250*PW, labSize.height);
    _qianmingTouch.frame = CGRectMake(0, 351*PH, SCREEN_WIDTH, _qianmLable.frame.size.height+10);
    _qianmL.frame = CGRectMake(8*PW, (_qianmLable.frame.size.height-_qianmL.frame.size.height+10)/2, 45*PW, 21*PH);
    _qianmB.frame = CGRectMake(350*PW,(_qianmLable.frame.size.height-_qianmB.frame.size.height+10)/2 , 10*PW, 14*PH);
   
//    [_qianm addTarget:self action:@selector(pqianView) forControlEvents:UIControlEventTouchDown];
}


//头像点击事件

-(void)headImageTouch{
    NSLog(@"123");
    [self postheadimg];
}
- (void)postheadimg{
    NSLog(@"123123");
    UIAlertView *image = [[UIAlertView alloc]initWithTitle:nil message:@"修改头像" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"拍照",@"从相册选择", nil];
    image.tag = 10;
    [image show];
    
}
//导航栏右边button
//-(void)rightBarButtonn{
//    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    [rightButton setTitle:@"保存" forState:UIControlStateNormal];
//    [rightButton addTarget:self action:@selector(rigutTouch)
//          forControlEvents:UIControlEventTouchDown];
//    rightButton.frame = CGRectMake(0, 0, 40, 40);
//    
//    UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
//    self.navigationItem.rightBarButtonItem = right;
//    
//}
-(void)rigutTouch{
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//修改名字
-(void)nameTouch{
    [self postname];
}
- (void)postname{
    UIAlertView *name = [[UIAlertView alloc]initWithTitle:@"昵称修改" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"修改",nil];
    name.alertViewStyle = UIAlertViewStylePlainTextInput;
    name.tag = 11;
    [name show];

}
//修改性别
-(void)sextouch{
    [self postsex];
}
- (void)postsex{
    UIAlertController  *ale = [UIAlertController alertControllerWithTitle:nil message:@"选择" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"女" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
       // NSLog(@"345");
        [_sexBtn setTitle:@"女" forState:UIControlStateNormal];
        NSString *sexNUm = @"1";
        NSDictionary *sexnum = [NSDictionary dictionaryWithObjectsAndKeys:[[NSUserDefaults standardUserDefaults] objectForKey:@"userID"],@"user_id",sexNUm,@"user_sex", nil];
        [self Postdata:sexnum];
        
    }];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"男" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
         [_sexBtn setTitle:@"男" forState:UIControlStateNormal];
        NSString *newSe = @"0";
          NSDictionary *sexnum = [NSDictionary dictionaryWithObjectsAndKeys:[[NSUserDefaults standardUserDefaults] objectForKey:@"userID"],@"user_id",newSe,@"user_sex", nil];
        [self Postdata:sexnum];
        //NSLog(@"123");
    }];
     UIAlertAction *oAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil];
    [ale addAction:action];
    [ale addAction:okAction];
    [ale addAction:oAction];
    [self presentViewController:ale animated:YES completion:nil];
    

}
//钱包
-(void)monouch{
    [self postwellet];
}
- (void)postwellet{
    
    MywalletViewController *view = [[MywalletViewController alloc]init];
    [self.navigationController pushViewController: view animated:YES];
    
}
//座右铭
-(void)zymTouch{
    
    UIAlertView *zym = [[UIAlertView alloc]initWithTitle:@"座右铭修改" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"修改",nil];
    zym.alertViewStyle = UIAlertViewStylePlainTextInput;
    zym.tag = 12;
    [zym show];
}


-(void)pqianView{
    [self zymTouch];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (alertView.tag == 10) {
        if (buttonIndex == 0) {
                    NSLog(@"123 取消");
        }else if (buttonIndex == 1){
                            NSLog(@"223 拍照");
        UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            sourceType = UIImagePickerControllerSourceTypeCamera;
            UIImagePickerController *picker = [[UIImagePickerController alloc]init];
                picker.delegate = self;
                picker.allowsEditing = YES;//设置可编辑
                picker.sourceType = sourceType;
            [self presentViewController:picker animated:YES completion:nil];
        }
    }else{
            NSLog(@"333 相册");
             UIImagePickerController *pickerImage = [[UIImagePickerController alloc]init];
               if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
                  pickerImage.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
             pickerImage.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:pickerImage.sourceType];
            pickerImage.delegate = self;
            pickerImage.allowsEditing = NO;
        [self presentViewController:pickerImage animated:YES completion:nil];
                            }
                        }

    }else if (alertView.tag == 11){
        //获取输入的新名字
        UITextField *text = [alertView textFieldAtIndex:0];
          if (buttonIndex == 0) {
              NSLog(@"1 取消");
            }else if (buttonIndex == 1){
               NSLog(@"2 修改");
                [_nameBtn setTitle:text.text forState:UIControlStateNormal];
                NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:text.text,@"user_nickname",[[NSUserDefaults standardUserDefaults] objectForKey:@"userID"],@"user_id", nil];
                [self Postdata:dic];
            }
    }else if (alertView.tag == 12){
        //座右铭修改
        UITextField *text = [alertView textFieldAtIndex:0];
        if (buttonIndex == 0) {
            NSLog(@"1 取消");
        }else if (buttonIndex == 1){
            NSLog(@"2 修改");
            [_qianm setTitle:text.text forState:UIControlStateNormal];
             NSDictionary *dicc = [NSDictionary dictionaryWithObjectsAndKeys:text.text,@"user_sign",[[NSUserDefaults standardUserDefaults] objectForKey:@"userID"],@"user_id", nil];
            [self Postdata:dicc];
        }
  
    }
    
}
//点击相册的图片 或相机后 点击 use后触发事件
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    NSLog(@"%@",info);
    _avatar = info[UIImagePickerControllerOriginalImage];
    NSData *data = UIImageJPEGRepresentation(_avatar, 0.00001);
    NSString *encodeStr = [data base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
    _userimg.image = _avatar;
   NSDictionary *headDic = [NSDictionary dictionaryWithObjectsAndKeys:[[NSUserDefaults standardUserDefaults]objectForKey:@"userID"],@"user_id",encodeStr,@"user_head_pic", nil];
    [self Postdata:headDic];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

//数据请求
-(void)Postdata:(NSDictionary*)parameter{
    NSString *finaUrl = [MainUrl stringByAppendingString:@"index.php/api/put/user_profiles"];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    [manager POST:finaUrl parameters:parameter success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSMutableDictionary *data = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
        NSLog(@"%@",data);
        if ([[data objectForKey:@"message"]isEqualToString:@"success"]) {
            NSLog(@"修改成功");
        }else{
            NSLog(@"修改失败");
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
    
}


-(void)popView{
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)viewsLay{
    _backView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 64);
    _backImage.frame = CGRectMake(0, 0, SCREEN_WIDTH, 64);
    _backTitle.frame = CGRectMake((SCREEN_WIDTH-68)/2,_BackBtn.frame.origin.y-3, 68, 34);
    _backTitle.titleLabel.font = [UIFont systemFontOfSize:17*PW];
    
    
    _headImage.frame = CGRectMake(0, 64, SCREEN_WIDTH, 73*PH);
    _headL.frame = CGRectMake(8*PW, 26*PH, 34*PW, 21*PH);
    _headL.font = [UIFont systemFontOfSize:15*PW];
    _headB.frame = CGRectMake(350*PW, 30*PH, 10*PW, 14*PH);
    _userimg.frame = CGRectMake(292*PW, 12*PH, 50*PW, 50*PW);
    
    _nametouch.frame = CGRectMake(0, 155*PH, SCREEN_WIDTH, 60*PH);
    _nameLable.frame = CGRectMake(8*PW, 19*PH, 34*PW, 21*PH);
    _nameLable.font = [UIFont systemFontOfSize:15*PW];
    
    _nameRightImage.frame = CGRectMake(350*PW, 23*PH, 10*PW, 14*PH);
    
    _sexTouch.frame = CGRectMake(0, 223*PH, SCREEN_WIDTH, 60*PH);
    _sexL.frame = CGRectMake(8*PW, 19*PH, 34*PW, 21*PH);
    _sexL.font = [UIFont systemFontOfSize:15*PW];
    
    _sexB.frame = CGRectMake(350*PW, 23*PH, 10*PW, 14*PH);
    _sexBtn.frame = CGRectMake(292*PW, 15*PH, 30*PW, 30*PH);
    _sexBtn.titleLabel.font = [UIFont systemFontOfSize:15*PW];
    
    _moneyTouch.frame = CGRectMake(0, 291*PH, SCREEN_WIDTH, 52*PH);
    _qianbaoL.frame = CGRectMake(8*PW, 15*PH, 68*PW, 21*PH);
    _qianbaoL.font = [UIFont systemFontOfSize:15*PW];
    _qianbaoB.frame = CGRectMake(350*PW, 19*PH, 10*PW, 14*PH);
//    _gowellet.frame = CGRectMake(277*PW, 8*PH, 65*PW, 36*PH);
//
    _gowellet.font = [UIFont systemFontOfSize:15*PW];
    _gowellet.textAlignment = NSTextAlignmentRight;
   
    
    _qianmingTouch.frame = CGRectMake(0, 351*PH, SCREEN_WIDTH, 60*PH);
   
    
    _qianmL.frame = CGRectMake(8*PW, 19*PH, 45*PW, 21*PH);
    _qianbaoL.font = [UIFont systemFontOfSize:15*PW];
    
    _qianmB.frame = CGRectMake(350*PW, 23*PH, 10*PW, 14*PH);
    _qianmL.font = [UIFont systemFontOfSize:15*PW];
    _qianm.frame = CGRectMake(92*PW, 8*PH, 250*PW, 44*PH);
    
}
@end
