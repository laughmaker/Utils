//
//  StoreProductController.h
//  Line0New
//
//  Created by line0 on 13-5-2.
//  Copyright (c) 2013年 makeLaugh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StoreKit/SKStoreProductViewController.h"

/*------打开app在Appstore中的地址，若是6.0以上OS，则在程序内打开，否则跳转到APPStore－－－－－－－*/

@interface StoreProductController : NSObject <SKStoreProductViewControllerDelegate>

//必须设置，用于推现SKStoreProductViewController。
@property (nonatomic, retain) UIViewController *rootViewController;

+ (StoreProductController *)sharedInstance;

- (void)openAppInAppStoreWithAppId:(NSString *)appId;


@end
