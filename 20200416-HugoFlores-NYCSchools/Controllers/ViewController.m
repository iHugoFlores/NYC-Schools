//
//  ViewController.m
//  20200416-HugoFlores-NYCSchools
//
//  Created by Hugo Flores Perez on 4/16/20.
//  Copyright © 2020 Hugo Flores Perez. All rights reserved.
//

#import "ViewController.h"
#import "SchoolsAPI.h"
#import "SchoolTableCell.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@end

@implementation ViewController

NSMutableArray<School *> *data;
UITableView *tableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpTableView];
    data = [NSMutableArray<School *> new];
    [SchoolsAPI getSchoolsWithHandler:^(NSMutableArray<School *> *schools) {
        data = schools;
        dispatch_async(dispatch_get_main_queue(), ^{
            [tableView reloadData];
        });
    }];
}

- (void) setUpTableView {
    tableView = [[UITableView alloc] init];
    tableView.rowHeight = UITableViewAutomaticDimension;
    tableView.estimatedRowHeight = 100;

    tableView.delegate = self;
    tableView.dataSource = self;

    [tableView registerClass:SchoolTableCell.class forCellReuseIdentifier:@"cell"];

    tableView.translatesAutoresizingMaskIntoConstraints = false;
    
    [self.view addSubview:tableView];

    [[tableView.leftAnchor constraintEqualToAnchor: self.view.leftAnchor] setActive:true];
    [[tableView.rightAnchor constraintEqualToAnchor: self.view.rightAnchor] setActive:true];
    [[tableView.topAnchor constraintEqualToAnchor: self.view.topAnchor] setActive:true];
    [[tableView.bottomAnchor constraintEqualToAnchor: self.view.bottomAnchor] setActive:true];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = [NSString stringWithFormat:@"Number: %ld", (long)indexPath.row];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return data.count;
}

@end
