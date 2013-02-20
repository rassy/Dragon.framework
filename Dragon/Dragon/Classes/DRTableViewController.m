//
//  DRTableViewController.m
//  Dragon
//
//  Created by Tomohiro Ryumura on 2013/02/19.
//  Copyright (c) 2013年 Tomohiro Ryumura. All rights reserved.
//

#import "DRTableViewController.h"

@interface DRTableViewController ()
@property (strong, nonatomic) UIActivityIndicatorView *loadingIndicator;
@property (strong, nonatomic) UIButton *nextButton;
@property (strong, nonatomic) UIView *footerView;
@end

@implementation DRTableViewController
@synthesize loadingIndicator = _loadingIndicator;
@synthesize nextButton = _nextButton;
@synthesize footerView = _footerView;
@synthesize nextIndicatorDelegate = _nextIndicatorDelegate;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    CGSize size = self.view.bounds.size;
    
	// footerView
	UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, size.width, 60)];
	self.nextButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, size.width, 60)];
	[self.nextButton setTitle:@"さらに読み込む..." forState:UIControlStateNormal];
	[[self.nextButton titleLabel] setFont:[UIFont systemFontOfSize:15.0f]];
	[self.nextButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
	[self.nextButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
	[self.nextButton addTarget:self action:@selector(nextButtonAction:) forControlEvents:UIControlEventTouchUpInside];
	[footerView addSubview:self.nextButton];
	self.tableView.tableFooterView = footerView;
}
#pragma mark - Indicator
- (void)startIndicatorWithActivityIndicatorStyle:(UIActivityIndicatorViewStyle)style
{
    if (!self.loadingIndicator) {
		self.loadingIndicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:style];
		[self.loadingIndicator setCenter:CGPointMake(self.tableView.tableFooterView.bounds.size.width * 0.5f, self.tableView.tableFooterView.bounds.size.height * 0.5f)];
		[self.tableView.tableFooterView addSubview:self.loadingIndicator];
	}
	self.nextButton.hidden = YES;
	[self.loadingIndicator startAnimating];
}
- (void)stopIndicator {
	[self.loadingIndicator stopAnimating];
	self.nextButton.hidden = NO;
}
- (void)nextButtonAction:(id)sender
{
    if (self.nextIndicatorDelegate && [self respondsToSelector:@selector(didTappedNextButton:)]) {
        [self.nextIndicatorDelegate didTappedNextButton:sender];
    }
}
@end
