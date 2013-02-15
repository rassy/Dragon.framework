//
//  DRAlertView.m
//  Dragon
//
//  Created by Tomohiro Ryumura on 2013/02/15.
//  Copyright (c) 2013年 Tomohiro Ryumura. All rights reserved.
//

#import "DRAlertView.h"
@interface DRAlertView()<UIAlertViewDelegate>
@property (strong, nonatomic) NSMutableArray *buttonBlocks;
@end
@implementation DRAlertView
@synthesize buttonBlocks;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}
- (id)initWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle
{
    self = [super initWithTitle:title message:message delegate:nil cancelButtonTitle:cancelButtonTitle otherButtonTitles:nil];
    if (self) {
        self.delegate = self;
        self.buttonBlocks = [NSMutableArray array];
    }
    return self;
}
- (void)addButtonWithTitle:(NSString *)title blocks:(void (^)(DRAlertView *alertView))blocks
{
    [self addButtonWithTitle:title];
    [self.buttonBlocks addObject:blocks];
}
- (void)setCancelButtonBlocks:(void (^)(DRAlertView *alertView))blocks {
    if (self.cancelButtonIndex == 0) {
        [self.buttonBlocks insertObject:blocks atIndex:0];
    }
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    id blocks = [self.buttonBlocks objectAtIndex:buttonIndex];
    if (blocks != nil) {
        ((DRAlertViewButtonBlocks)blocks)((DRAlertView *)alertView, buttonIndex);
    }
}
- (void)alertViewCancel:(UIAlertView *)alertView
{
    id blocks = [self.buttonBlocks objectAtIndex:0];
    if (self.cancelButtonIndex == 0) {
        ((DRAlertViewButtonBlocks)blocks)((DRAlertView *)alertView, 0);
    }
}
@end
