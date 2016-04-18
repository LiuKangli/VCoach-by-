//
//  Second-TeacherDetail.m
//  VCoach
//
//  Created by Moon on 16/1/8.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "Second-TeacherDetail.h"
#import "VTeacher.pch"
#import "Second-TeacherDetail-cell.h"
#import "Second-TeacherDetail-cell1.h"
@interface Second_TeacherDetail ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation Second_TeacherDetail
-(void)viewWillAppear:(BOOL)animated{
    viewBackColor;
    self.tabBarController.tabBar.hidden = YES;
}
-(void)creatViews{
    _TeacherView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-145)];
    _TeacherView.dataSource = self;
    _TeacherView.delegate = self;
    self.automaticallyAdjustsScrollViewInsets = false;
    _TeacherView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:_TeacherView];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, _TeacherView.frame.origin.y+_TeacherView.frame.size.height, 49, 45);
    button.backgroundColor = [UIColor redColor];
    [self.view addSubview:button];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatViews];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger num;
    if (section == 0) {
        num =  1;
    }else if (section == 1){
        num = 1;
    }else if (section == 2){
        num = 2;
    }
    return num;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *sell = @"cell";
    static NSString *sell1 = @"cell1";
    static NSString *sel = @"cc";
    Second_TeacherDetail_cell *cell = [tableView dequeueReusableCellWithIdentifier:sell];
    Second_TeacherDetail_cell1 *cell1 = [tableView dequeueReusableCellWithIdentifier:sell1];
    UITableViewCell *cel = [tableView dequeueReusableCellWithIdentifier:sel];
    
    if (indexPath.section == 0) {
        if (cell == nil) {
            cell = [[Second_TeacherDetail_cell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:sell];
            
            cell.name.text = @"教练1";
            cell.headImage.image = [UIImage imageNamed:@"cellimg"];
            cell.sex.text = @"男";
            cell.number.text =@"87单";
            cell.specialty.text = @"跆拳道，空手道，气功";
            cell.Work_experience.text =@"已经有四年的工作经验啦";
            cell.arera.text = @"洪山区";
            cell.selectionStyle = UITableViewCellSelectionStyleNone;

        }
        return cell;
    }
   
   else if (indexPath.section == 1) {
        if (cel == nil) {
            cel = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:sel];
            cel.textLabel.text = @"认证资料";
            cel.layer.masksToBounds = YES;
            cel.layer.cornerRadius = 5.0;
            cel.backgroundColor = [UIColor greenColor];
            cel.selectionStyle = UITableViewCellSelectionStyleNone;
           
        }
       return cel;
    }
    else if  (indexPath.section == 2) {
        if (cell1 == nil) {
            cell1 = [[Second_TeacherDetail_cell1 alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:sell1];
            
            cell1.headImage.image = [UIImage imageNamed:@"cellimg"];
            cell1.className.text = @"健身";
            cell1.money.text = @"300.0";
            cell1.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        return cell1;
    }
    
    return nil;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat hight;
    if (indexPath.section == 0) {
        hight = 170;
    }else if (indexPath.section == 1){
        hight = 44;
    }else{
        hight = 80;
    }
    return hight;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
