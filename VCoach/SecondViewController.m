//
//  SecondViewController.m
//  VCoach
//
//  Created by Moon on 16/1/8.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "SecondViewController.h"
#import "VTeacher.pch"
#import "Second_teacher_cell.h"
#import "SecondView_Search.h"
#import "Second-TeacherDetail.h"
@interface SecondViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation SecondViewController
-(void)viewWillAppear:(BOOL)animated{
    viewBackColor;
    self.tabBarController.tabBar.hidden = NO;
}
-(void)search{
//    UISearchBar  *search = [[UISearchBar alloc]initWithFrame:CGRectMake(10, self.navigationController.navigationBar.frame.origin.y+2, 200, self.navigationController.navigationBar.frame.size.height)];
//   
//    //search.backgroundColor = [UIColor grayColor];
//    
//    [self.navigationController.view addSubview:search];

}
-(void)creatTableView{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-115) style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor lightGrayColor];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = 155;
    [self.view addSubview:_tableView];
    self.automaticallyAdjustsScrollViewInsets = false;
//    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(10,10, SCREEN_WIDTH-5, 40)];
//    view.backgroundColor = [UIColor whiteColor];
//    
//    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:view.bounds byRoundingCorners:UIRectCornerTopLeft| UIRectCornerTopRight  cornerRadii:CGSizeMake(5, 5)];
//    CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];
//    maskLayer.frame = view.bounds;
//    maskLayer.path = maskPath.CGPath;
//    view.layer.mask = maskLayer;
//    _tableView.tableHeaderView = view;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
   [self search];
    [self creatTableView];
    
   
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cell = @"1qwe";
    Second_teacher_cell *Second_cell = [tableView dequeueReusableCellWithIdentifier:cell];
    if (Second_cell == nil) {
        Second_cell = [[Second_teacher_cell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cell];
        
    }
    //Second_cell.headImage.image = [UIImage imageNamed:@"cellimg.png"];
    Second_cell.name.text = @"教练1";
    Second_cell.sex.text = @"男";
    Second_cell.number.text =@"87单";
    Second_cell.specialty.text = @"跆拳道，空手道，气功";
    Second_cell.Work_experience.text =@"已经有四年的工作经验啦";
    Second_cell.arera.text = @"洪山区";
    Second_cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return Second_cell;
    
}

-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
    image.backgroundColor = [UIColor redColor];
    return image;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Second_TeacherDetail *Detail = [[Second_TeacherDetail alloc]init];
    Detail.title = @"教练详情";
    [self.navigationController pushViewController:Detail animated:YES];
    
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
