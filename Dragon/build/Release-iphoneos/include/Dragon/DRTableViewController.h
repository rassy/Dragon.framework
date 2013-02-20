//
//  DRTableViewController.h
//  Dragon
//
//  Created by Tomohiro Ryumura on 2013/02/19.
//  Copyright (c) 2013年 Tomohiro Ryumura. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol DRTableViewDelegate
- (void)didTappedNextButton:(id)sender;
@end
@interface DRTableViewController : UITableViewController
@property (weak, nonatomic) id<DRTableViewDelegate> nextIndicatorDelegate;
- (void)startIndicatorWithActivityIndicatorStyle:(UIActivityIndicatorViewStyle)style;
- (void)stopIndicator;
@end
