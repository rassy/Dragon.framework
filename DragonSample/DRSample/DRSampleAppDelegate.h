//
//  DRSampleAppDelegate.h
//  DragonSample
//
//  Created by Tomohiro Ryumura on 2013/02/15.
//  Copyright (c) 2013年 dragon-village.net. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DRSampleViewController;
@interface DRSampleAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController *navigationController;
@property (strong, nonatomic) DRSampleViewController *sampleViewController;
@end
