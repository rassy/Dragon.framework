//
//  DRAlertView.h
//  Dragon
//
//  Created by Tomohiro Ryumura on 2013/02/15.
//  Copyright (c) 2013年 Tomohiro Ryumura. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DRAlertView;
typedef void (^DRAlertViewButtonBlocks)(DRAlertView *alertView, NSInteger index);

@interface DRAlertView : UIAlertView
- (id)initWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle;
- (void)addButtonWithTitle:(NSString *)title blocks:(void (^)(DRAlertView *alertView))blocks;
- (void)setCancelButtonBlocks:(void (^)(DRAlertView *alertView))blocks;
@end
