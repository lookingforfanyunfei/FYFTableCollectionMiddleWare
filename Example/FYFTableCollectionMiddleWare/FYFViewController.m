//
//  FYFViewController.m
//  FYFTableCollectionMiddleWare
//
//  Created by 786452470@qq.com on 09/27/2021.
//  Copyright (c) 2021 786452470@qq.com. All rights reserved.
//

#import "FYFViewController.h"
#import "FYFTableViewController.h"
#import "FYFCollectionViewController.h"

#import "Masonry.h"

@interface FYFViewController ()

@end

@implementation FYFViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *tableButton = [[UIButton alloc] initWithFrame:CGRectZero];
    [tableButton setTitle:@"table" forState:UIControlStateNormal];
    [tableButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [tableButton addTarget:self action:@selector(tableClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:tableButton];
    [tableButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(80, 30));
    }];
    
    
    UIButton *collectionButton = [[UIButton alloc] initWithFrame:CGRectZero];
    [collectionButton setTitle:@"collection" forState:UIControlStateNormal];
    [collectionButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [collectionButton addTarget:self action:@selector(collectionClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:collectionButton];
    [collectionButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(tableButton.mas_bottom).offset(30);
        make.centerX.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(80, 30));
    }];
}

- (void)tableClick:(UIButton *)sender {
    FYFTableViewController *tableVC =  [[FYFTableViewController alloc] init];
    [self.navigationController pushViewController:tableVC animated:YES];
}

- (void)collectionClick:(UIButton *)sender {
    FYFCollectionViewController *collectionVC = [[FYFCollectionViewController alloc] init];
    [self.navigationController pushViewController:collectionVC animated:YES];
}


@end
