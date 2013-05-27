//
//  StoreProductController.m
//  Line0New
//
//  Created by line0 on 13-5-2.
//  Copyright (c) 2013年 makeLaugh. All rights reserved.
//

#import "StoreProductController.h"
#import "UIDevice+DeviceInfo.h"

@implementation StoreProductController

+ (StoreProductController *)sharedInstance
{
    static StoreProductController *storeProductController = nil;
    if (!storeProductController)
    {
        storeProductController = [[StoreProductController alloc] init];
    }
    
    return storeProductController;
}

- (void)openAppInAppStoreWithAppId:(NSString *)appId
{
    NSString *osVersion = [UIDevice systemVersion];
    if ([osVersion compare:@"6.0"] == NSOrderedAscending)
    {
        NSString *appUrl = [NSString stringWithFormat:@"itms-apps://ax.itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=%@",appId];
        NSURL *url = [NSURL URLWithString:appUrl];
        [[UIApplication sharedApplication] openURL:url];
        
        return;
    }
    
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    
    SKStoreProductViewController *storeProductViewContorller = [[SKStoreProductViewController alloc] init];
    storeProductViewContorller.delegate = self;
    NSDictionary *param = @{SKStoreProductParameterITunesItemIdentifier : appId};
    [storeProductViewContorller loadProductWithParameters:param
                                          completionBlock:^(BOOL result, NSError *error)
     {
         if(error)
         {
             NSLog(@"error %@ with userInfo %@", error, [error userInfo]);
         }
         else
         {
             [self.rootViewController presentViewController:storeProductViewContorller
                                                   animated:YES
                                                 completion:^
             {
//                 [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
             }];
         }
     }];
}

- (void)productViewControllerDidFinish:(SKStoreProductViewController *)viewController
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    [self.rootViewController dismissModalViewControllerAnimated:YES];
}

@end
