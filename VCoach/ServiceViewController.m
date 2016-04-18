//
//  ServiceViewController.m
//  VCoach
//
//  Created by apple on 15/4/27.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ServiceViewController.h"
#import "tuijianViewCell.h"
#import "ClassinfoViewController.h"
#import "DejalActivityView.h"
#import "CoachViewController.h"
#import "PostClass.h"
#import "Constants.h"
#import "VTeacher.pch"
#import "PellTableViewSelect.h"
@interface ServiceViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>{

    UIImageView *imageView;
    NSMutableArray *array;
    NSTimer *Timer;
    int t ;
    NSMutableArray *_statuss;
    
    NSMutableArray *buttonsData;
    UIImageView *imageView1;

}


@end

@implementation ServiceViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated{
       hiddenTabbar(NO);
    self.navigationController.navigationBar.hidden = YES;
    NSThread *getdata = [[NSThread alloc]initWithTarget:self selector:@selector(getDataClassName) object:nil];
    [getdata start];
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    //导航栏
    _NovView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 64);
    _NovImageView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 64);
    _leftButtonText.frame = CGRectMake(8*PW, 28*PH, 43*PW, 33*PH);
    _leftButtonText.font = [UIFont systemFontOfSize:18*PW];
    _NovLableImage.frame = CGRectMake(49*PW, 42*PH, 10*PW, 7*PH);
    _NovButton.frame = CGRectMake(8*PW, 23*PH, 58*PW, 33*PH);
    [self viewsLayout];
    
    NSString*wlzt=[[NSUserDefaults standardUserDefaults]stringForKey:@"WLZT"];
    if ([wlzt isEqualToString:@"no_net"]) {
        UIAlertView *ba = [[UIAlertView alloc]initWithTitle:@"蜂窝移动数据已关闭" message:@"启用蜂窝移动数据或无线局域网来访问数据" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
        [ba show];
    }else{
        [self initdata:@"0"];
        [self banner:[_leftButtonText.text stringByAppendingString:@"市"]];
    }

    
    
   
    
    //关闭回弹效果
    _scrollview.bounces = NO;
    [[NSUserDefaults standardUserDefaults]setObject:[_leftButtonText.text stringByAppendingString:@"市"] forKey:@"cityName"];
    [[NSUserDefaults standardUserDefaults]synchronize];
   
    
    [self creatTableview];
   
    
    
//    [self.pagecontrol addTarget:self action:@selector(changeImage) forControlEvents:UIControlEventValueChanged];
    
   
  
    
    _statuss = [NSMutableArray array];
 
    
    [self.classBtn1 addTarget:self action:@selector(select1) forControlEvents:UIControlEventTouchDown];
    [self.classBtn2 addTarget:self action:@selector(select2) forControlEvents:UIControlEventTouchDown];
    [self.classBtn3 addTarget:self action:@selector(select3) forControlEvents:UIControlEventTouchDown];
    [self.classBtn4 addTarget:self action:@selector(select4) forControlEvents:UIControlEventTouchDown];    
    
    //_tableView.separatorStyle = NO;
   
    
    
}
-(void)creatBanner{
    //_showimage.backgroundColor = [UIColor redColor];
   //轮播
    //图片宽
    CGFloat imageW = self.showimage.frame.size.width;
    //高
    CGFloat imageH = self.showimage.frame.size.height;
    //Y
    CGFloat imageY = 0;
    //图片数
   // NSInteger images = 4;
    for ( int i = 0; i<array.count+1; i++) {
        if (i == array.count) {
        imageView1 = [[UIImageView alloc]init];
        //CGFloat imageX = i*imageW;
        imageView1.frame = CGRectMake(0, imageY, imageW, imageH);
         NSString *stt = [[array objectAtIndex:i-1]objectForKey:@"banner_src"];

        if ([[stt substringToIndex:4]isEqualToString:@"http"]) {
              [imageView1 sd_setImageWithURL:[NSURL URLWithString:stt]];
        }else{
            [imageView1 sd_setImageWithURL:[NSURL URLWithString:[ImageUrl stringByAppendingString:stt]]];
        }
        }else{
            imageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(_showimage.frame.origin.x+_showimage.frame.size.width*(i+1), imageY, imageW, imageH)];
             NSString *stt = [[array objectAtIndex:i]objectForKey:@"banner_src"];
            if ([[stt substringToIndex:4]isEqualToString:@"http"]) {
                 [imageView1 sd_setImageWithURL:[NSURL URLWithString:stt]];
            }else{
                [imageView1 sd_setImageWithURL:[NSURL URLWithString:[ImageUrl stringByAppendingString:stt]]];
            }
        }
       // imageView1.backgroundColor = [UIColor redColor];
       //隐藏指示条
        self.showimage.showsHorizontalScrollIndicator = NO;
        [self.showimage addSubview:imageView1];
    }
    self.pagecontrol.numberOfPages = array.count;
    
    //2.设置滚动范围
    CGFloat contentW = (array.count+1)*imageW;
    //禁止垂直方向进行滚动
    self.showimage.contentSize = CGSizeMake(contentW, 0);
    //设置分页
    self.showimage.pagingEnabled = YES;
  
    self.showimage.delegate = self;
    
    [self addTimer];
}
/**
 *开启定时器
 *
 */
-(void)addTimer{
    _Timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(timerr) userInfo:nil repeats:YES];
    
}
-(void)timerr{
    //获取当前偏移量
    CGFloat x = self.showimage.contentOffset.x;
    CGFloat width = _showimage.frame.size.width;
    //偏移量加上scrollview宽度超过scrollview的contentSize
    if (x + width >= self.showimage.contentSize.width) {
        [self.showimage setContentOffset:CGPointMake(0, 0) animated:NO];
    } else {
        [self.showimage setContentOffset:CGPointMake(x + width, 0) animated:YES];
    }
    //获取当前pagecontrol的位置
    NSInteger index = x / width ;
    if (index < 0) {
        _pagecontrol.currentPage = array.count - 1;
    } else {
        _pagecontrol.currentPage = index;
    }



}

/**
 *关闭定时器
 *
 */
-(void)removeTimer{
    [_Timer invalidate];
}
#pragma Banner-delegate
//实现手动循环滚动
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat x = scrollView.contentOffset.x;
    CGFloat width = scrollView.bounds.size.width;
    if (x > array.count * width) {
        [_showimage setContentOffset:CGPointMake(0, 0) animated:NO];
    }
    if (x < 0) {
        [_showimage setContentOffset:CGPointMake(array.count * width, 0) animated:NO];
    }
    
}
//滑动结束后计算pageControl的位置
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    //获取当前偏移量
    CGFloat x = scrollView.contentOffset.x;
    CGFloat width = _showimage.frame.size.width;
    NSInteger index = x / width - 1;
    if (index < 0) {
        _pagecontrol.currentPage = array.count - 1;
    } else {
        _pagecontrol.currentPage = index;
    }
    
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    [self addTimer];
}
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self.Timer invalidate];
}



-(void)creatTableview{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 259*PH, SCREEN_WIDTH, 312*PH) style:UITableViewStylePlain];
    //_tableView.backgroundColor = [UIColor redColor];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.scrollEnabled = NO;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_scrollview addSubview:_tableView];
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma tableviewDatasource


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _statuss.count;
}

//cell的数据源
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    tuijianViewCell *Cell = [tableView dequeueReusableCellWithIdentifier:@"tuijianViewCell"];
    
    if (Cell == nil) {
        
        Cell = [[[NSBundle mainBundle]loadNibNamed:@"tuijianViewCell" owner:self options:nil] lastObject];
        
    }
    Cell.classtitle.text = [[_statuss objectAtIndex:indexPath.row]objectForKey:@"title"];
    Cell.price.text = [[_statuss objectAtIndex:indexPath.row]objectForKey:@"price"];
    NSString *url = [[_statuss objectAtIndex:indexPath.row]objectForKey:@"ad_image_url"];
    if ([[url substringToIndex:4]isEqualToString:@"http"]) {
        [Cell.classimg sd_setImageWithURL:[NSURL URLWithString:url]];
    }else{
        
        [Cell.classimg sd_setImageWithURL:[NSURL URLWithString:[MainUrl stringByAppendingString:url]]];
    }
    Cell.jianjie.text = [[_statuss objectAtIndex:indexPath.row]objectForKey:@"simple_introduce"];
    Cell.postorderBtn.layer.borderWidth = 1;
    Cell.postorderBtn.layer.borderColor = [[UIColor redColor]CGColor];
   
    [Cell ViewsLayout];
   
    
    return Cell;
}


#pragma mark TableView Delegate Methods
//获取cell的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    return 134*PH;
}


//cell跳转页面
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    ClassinfoViewController *view = [[ClassinfoViewController alloc]initWithNibName:@"ClassinfoViewController" bundle:nil];
    view.classID = [[_statuss objectAtIndex:indexPath.row]objectForKey:@"class_id"];
    NSLog(@"首页界面课程ID=%@",view.classID);
    [self.navigationController pushViewController:view animated:YES];
}

//按钮选择
- (void)select1{
   [self removeObj];
    self.gongfutext1.textColor = [UIColor orangeColor];
    self.gongfutext2.textColor = [UIColor grayColor];
    self.gongfutext3.textColor = [UIColor grayColor];
    self.gongfutext4.textColor = [UIColor grayColor];
    [self initdata:@"1"];
    [_tableView reloadData];
}
- (void)select2{
    [self removeObj];
    self.gongfutext1.textColor = [UIColor grayColor];
    self.gongfutext2.textColor = [UIColor orangeColor];
    self.gongfutext3.textColor = [UIColor grayColor];
    self.gongfutext4.textColor = [UIColor grayColor];
        [self initdata:@"2"];
    [_tableView reloadData];
}
- (void)select3{
    [self removeObj];
    self.gongfutext1.textColor = [UIColor grayColor];
    self.gongfutext2.textColor = [UIColor grayColor];
    self.gongfutext3.textColor = [UIColor orangeColor];
    self.gongfutext4.textColor = [UIColor grayColor];
   
    [self initdata:@"3"];
    [_tableView reloadData];
}
- (void)select4{
    [self removeObj];
    self.gongfutext1.textColor = [UIColor grayColor];
    self.gongfutext2.textColor = [UIColor grayColor];
    self.gongfutext3.textColor = [UIColor grayColor];
    self.gongfutext4.textColor = [UIColor orangeColor];
    
    [self initdata:@"4"];
    [_tableView reloadData];
}
-(void)removeObj{
     _statuss = [NSMutableArray array];
}
#pragma GetData
-(NSMutableArray*)returnData:(NSMutableArray*)dicc{
    buttonsData = dicc;
    NSString *imageurl;
    NSMutableArray *imageArray = [NSMutableArray array];
    for (int i = 0; i<buttonsData.count; i++) {
        if ([[[[buttonsData objectAtIndex:i]objectForKey:@"icon_src"]substringToIndex:4]isEqualToString:@"http"]) {
            imageurl = [[buttonsData objectAtIndex:i]objectForKey:@"icon_src"];
            [imageArray addObject:imageurl];

        }else{
            imageurl = [ImageUrl stringByAppendingString:[[buttonsData objectAtIndex:i]objectForKey:@"icon_src"]];
            [imageArray addObject:imageurl];

        }
    
    }
    for (int i = 0; i<imageArray.count; i++) {
        [self.gongfuimg1 sd_setImageWithURL:[NSURL URLWithString:[imageArray objectAtIndex:0]]];
         [self.gongfuimg2 sd_setImageWithURL:[NSURL URLWithString:[imageArray objectAtIndex:1]]];
         [self.gongfuimg3 sd_setImageWithURL:[NSURL URLWithString:[imageArray objectAtIndex:2]]];
         [self.gongfuimg4 sd_setImageWithURL:[NSURL URLWithString:[imageArray objectAtIndex:3]]];
    }
    for (int i = 0; i<buttonsData.count; i++) {
        self.gongfutext1.text = [[buttonsData objectAtIndex:0]objectForKey:@"navigation_name"];
        self.gongfutext2.text = [[buttonsData objectAtIndex:1]objectForKey:@"navigation_name"];
        self.gongfutext3.text = [[buttonsData objectAtIndex:2]objectForKey:@"navigation_name"];
        self.gongfutext4.text = [[buttonsData objectAtIndex:3]objectForKey:@"navigation_name"];
    }
    return buttonsData;
}
//四个选项的名字/图片
-(void)getDataClassName{
   
    if ([[NSUserDefaults standardUserDefaults]objectForKey:@"topData"]==nil) {
         [SVProgressHUD show];
        NSString *finaUrl = [MainUrl stringByAppendingString:MainGetClassName];
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
        [manager POST:finaUrl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSMutableDictionary *data = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
            if ([[data objectForKey:@"message"]isEqualToString:@"success"]) {
                // NSLog(@"%@",data);
                NSMutableArray *dataL = [data objectForKey:@"results"];
                [[NSUserDefaults standardUserDefaults]setObject:dataL forKey:@"topData"];
                [self returnData:dataL];
            }else{
                NSLog(@"课程名获取失败");
            }
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"%@",error);
        }];
 
    }else{
        NSMutableArray*warray =[[NSUserDefaults standardUserDefaults]objectForKey:@"topData"];
        [self returnData:warray];
    }
}

-(NSMutableArray*)classList:(NSMutableArray*)arrayy{
    _statuss = arrayy;
  
    _tableView.frame = CGRectMake(0, 253*PH, SCREEN_WIDTH, _statuss.count*(134*PH)+10);
      NSLog(@"%f",_tableView.frame.size.height);

       _scrollview.contentSize = CGSizeMake(SCREEN_WIDTH,254*PH+_tableView.frame.size.height);

    [_tableView reloadData];
    [SVProgressHUD dismiss];
    return _statuss;
}
//根据课程种类nx来选择请求数据源
- (void)initdata:(NSString *)nx
{
   
        NSString *finaUrl = [MainUrl stringByAppendingString:MainClassList];
        NSString *city = [_leftButtonText.text stringByAppendingString:@"市"];
        NSLog(@"%@,%@",city,nx);
        NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:nx,@"type",city,@"city_name", nil];
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
        
        
        [manager POST:finaUrl parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSMutableDictionary *data = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
            if ([[data objectForKey:@"message"]isEqualToString:@"success"]) {
                NSMutableArray *dataArray = [data objectForKey:@"results"];
                [self classList:dataArray];
            }else{
                NSLog(@"首页课程列表获取失败");
            }
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"%@",error);
        }];

    
    
}


- (IBAction)leftButton:(id)sender {
    
    NSArray*province = [NSArray arrayWithObjects:@"广州",@"北京",@"深圳",@"南京",@"武汉", nil];
    [PellTableViewSelect addPellTableViewSelectWithWindowFrame:CGRectMake(100*PW, 64*PH, 100*PW, 100*PH) selectData:province images:nil action:^(NSInteger index) {
        _leftButtonText.text = [province objectAtIndex:index];
        NSString  *ser = [_leftButtonText.text stringByAppendingString:@"市"];
        
        [[NSUserDefaults standardUserDefaults]setObject:ser forKey:@"cityName"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        [self banner:ser];
    } animated:YES];
}

-(void)bannerdata:(NSMutableArray *)arr{
    array = arr;
    NSLog(@"+++%@",array);
    [self creatBanner];
   
    
}
//bannerData
-(void)banner:(NSString *)srt{
    NSString *finaUrl = [MainUrl stringByAppendingString:ScrollerData];
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:srt,@"city_name", nil];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    [manager POST:finaUrl parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSMutableDictionary*data = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
        //NSLog(@"!!!%@",data);
        if ([[data objectForKey:@"message"]isEqualToString:@"success"]) {
            NSMutableArray *arraf = [data objectForKey:@"results"];
            [self bannerdata:arraf];
        }else{
            NSLog(@"获取滚动视图数据失败");
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
}
-(void)viewsLayout{
    self.gongfutext1.textColor = [UIColor grayColor];
    self.gongfutext2.textColor = [UIColor grayColor];
    self.gongfutext3.textColor = [UIColor grayColor];
    self.gongfutext4.textColor = [UIColor grayColor];
    
    //scrollerView
    _scrollview.frame = CGRectMake(0, _NovView.frame.origin.y+_NovView.frame.size.height-25*PH, 375*PW, 634*PH);
    _showimage.frame = CGRectMake(0, 0, 375*PW, 165*PH);
    _pagecontrol.frame = CGRectMake(168*PW, 120*PH, 39*PW, 37*PH);
    
    //classNameButton
    _ClassVieW.frame = CGRectMake(0, 163*PH, 375*PW, 57*PH);
    
    _classBtn1.frame = CGRectMake(0, 11*PH, 93*PW, 41*PH);
    _gongfutext1.frame = CGRectMake(45*PW, 10*PH, 52*PW, 21*PH);
   _gongfutext1 .font = [UIFont systemFontOfSize:12*PW];
    _gongfuimg1.frame = CGRectMake(8*PW, 7*PH, 26*PW, 26*PW);
    
    _classBtn2.frame = CGRectMake(94*PW, 11*PH, 93*PW, 41*PH);
    _gongfuimg2.frame = CGRectMake(9*PW, 6*PH, 26*PW, 26*PW );
    _gongfutext2.frame = CGRectMake(45*PW, 10*PH, 52*PW, 21*PH);
     _gongfutext2 .font = [UIFont systemFontOfSize:12*PW];
    _classBtn3.frame = CGRectMake(188*PW, 11*PH, 93*PW, 41*PH);
    _gongfutext3.frame = CGRectMake(45*PW, 10*PH, 52*PW, 21*PH);
     _gongfutext3 .font = [UIFont systemFontOfSize:12*PW];
    _gongfuimg3.frame = CGRectMake(7*PW, 6*PH, 26*PW, 26*PW);
    
    _classBtn4.frame = CGRectMake(282*PW, 11*PH, 93*PW, 41*PH);
    _gongfuimg4.frame = CGRectMake(7*PW, 6*PH, 26*PW, 26*PW);
    _gongfutext4.frame = CGRectMake(45*PW, 10*PH, 52*PW, 21*PH);
     _gongfutext4 .font = [UIFont systemFontOfSize:12*PW];
    _TuijianView.frame = CGRectMake(5*PW, 221*PH, 364*PW, 32*PH);
    _TuijianLable.frame = CGRectMake(31*PW, 5*PH, 60*PW, 21*PH);
    _TuijianImage.frame = CGRectMake(11*PW, 6*PH, 17*PW, 17*PW);
    
}
-(void)viewDidAppear:(BOOL)animated{
    [SVProgressHUD dismiss];
}

@end
