//
//  ViewController.m
//  UITableViewAdvanceDelegate
//
//  Created by Civet on 2019/5/24.
//  Copyright © 2019年 PandaTest. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    //自动调整子视图的大小
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    _tableView.tableHeaderView = nil;
    _tableView.tableFooterView = nil;
    
    [self.view addSubview:_tableView];
    
    _arrayData = [[NSMutableArray alloc] init];
    for (int i = 1; i < 20; i++) {
        NSString *str = [NSString stringWithFormat:@"A %d",i];
        [_arrayData addObject:str];
    }
    
    //当数据的数据源发生变化时，更新数据库视图，重新加载数据
    [_tableView reloadData];
    [self createBtn];
    
}

- (void) createBtn{
    _isEdit = NO;
    //创建功能按钮
    _editBtn = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(pressEdit)];
    _finishBtn = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(pressFinish)];
    _deleteBtn = [[UIBarButtonItem alloc] initWithTitle:@"删除" style:UIBarButtonItemStylePlain target:self action:@selector(pressDelete)];
    self.navigationItem.rightBarButtonItem = _editBtn;
}
- (void)pressEdit{
    _isEdit = YES;
    self.navigationItem.rightBarButtonItem = _finishBtn;
    [_tableView setEditing:YES];
    self.navigationItem.leftBarButtonItem = nil;
}

- (void)pressFinish{
    _isEdit = NO;
    self.navigationItem.rightBarButtonItem = _editBtn;
    [_tableView setEditing:NO];
    self.navigationItem.leftBarButtonItem = nil;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _arrayData.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *strID = @"ID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strID];
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strID];
    }
    cell.textLabel.text = [_arrayData objectAtIndex:indexPath.row];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
