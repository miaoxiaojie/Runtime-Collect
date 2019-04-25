//
//  ViewController.m
//  Runtime-Collect
//
//  Created by miao on 2019/3/28.
//  Copyright © 2019年 miao. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"
#import "UIControl+Collect.h"
#import "CollectManager.h"
#import "CollectConfig.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"统计";
    [self p_setRightBarButton];
    [self P_drawViews];
    
}

-(void)p_setRightBarButton{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"下一个页面"
                      style:UIBarButtonItemStylePlain
                     target:self
                     action:@selector(p_popToRootView)] ;
    
}

-(void)p_popToRootView
{
    [CollectManager postEvent:KEventIdRightBarButton json:@"RightBarButton"];
    DetailViewController *VC = [[DetailViewController alloc]init];
    [self.navigationController pushViewController:VC animated:YES];
}

-(void)P_drawViews
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0,100,self.view.frame.size.width,44);
    [btn setTitle:@"button点击" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn.titleLabel setFont:[UIFont boldSystemFontOfSize:18.0f]];
    [btn.titleLabel setTextAlignment:NSTextAlignmentCenter];
    [btn setBackgroundColor:[UIColor blackColor]];
    [btn addTarget:self action:@selector(p_ensureButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}
-(void)p_ensureButtonClicked:(UIButton *)sender
{
    [CollectManager postEvent:KEventIdButtonClick json:@"button点击"];
}

-(void)collectWithEventId:(NSString *)eventId
                     json:(NSString *)jsonStr
{
    
}

@end
