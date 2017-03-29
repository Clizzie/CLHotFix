//
//  ViewController.m
//  HotFix
//
//  Created by 陈立谦 on 2017/3/17.
//  Copyright © 2017年 陈立谦. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *mytableView;
@property (nonatomic,strong)NSArray *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *tv = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.mytableView = tv;
    self.mytableView.dataSource = self;
    self.mytableView.delegate = self;
    [self.view addSubview:self.mytableView];
   
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *i = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:i];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:i];
    }
    cell.textLabel.text = @"嘿嘿";
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.dataSource = @[@"1",@"2"];
    //cell有三行，当我点击第三行的时候肯定会数组越界导致crash
    //还好我在JS里弥补了这个BUG，详情请看JS里的处理
    NSString *content = self.dataSource[indexPath.row];
    NSLog(@"content = %",content);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
