//
//  DRSampleViewController.m
//  DragonSample
//
//  Created by Tomohiro Ryumura on 2013/02/15.
//  Copyright (c) 2013年 dragon-village.net. All rights reserved.
//

#import "DRSampleViewController.h"
#import <Dragon/DRAlertView.h>

@interface DRSampleViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSArray *list;
@end

@implementation DRSampleViewController
@synthesize tableView = _tableView;
@synthesize list = _list;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"DragonSample";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGSize size = [[UIScreen mainScreen] bounds].size;
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    self.list = [NSArray arrayWithObjects:
                 @"DRAlertViewBlocks",
                 nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table View
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = [self.list objectAtIndex:indexPath.row];
    return cell;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.list count];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *methodName = [NSString stringWithFormat:@"%@WithIndex:",[self.list objectAtIndex:indexPath.row]];
    SEL selector = NSSelectorFromString(methodName);
    [self performSelector:selector withObject:[NSNumber numberWithInteger:indexPath.row] afterDelay:0];
}
#pragma mark - Sample Action
- (void)DRAlertViewBlocksWithIndex:(NSNumber *)index {
    DRAlertView *alertView = [[DRAlertView alloc] initWithTitle:@"Confirm" message:@"Are you ready ?" cancelButtonTitle:@"Cancel"];
    [alertView addButtonWithTitle:@"OK" blocks:^(DRAlertView *alertView){
        NSLog(@"OK Clicked.");
    }];
    [alertView setCancelButtonBlocks:^(DRAlertView *alertView){
        NSLog(@"Cancel Clicked.");
    }];
    [alertView addButtonWithTitle:@"ELSE" blocks:^(DRAlertView *alertView){
        NSLog(@"Else Clicked.");
    }];
    [alertView show];
}
@end
