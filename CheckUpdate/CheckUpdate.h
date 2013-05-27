//
//  CheckUpdate.h
//  NUAA
//
//  Created by 何 振东 on 12-9-19.
//  Copyright (c) 2012年 何 振东. All rights reserved.
//

/**
 *  用于检查app是否有更新。
 */


#import <Foundation/Foundation.h>
#import "ASIRequest.h"
#import "json.h"

@protocol CheckUpdateDelegate <NSObject>

@optional
- (void)currentVersionHasNewest;

@end

@interface CheckUpdate : NSObject <UIAlertViewDelegate>
@property (assign, nonatomic) id <CheckUpdateDelegate>  delegate;

+ (CheckUpdate *)shareInstance;
- (void)checkUpdate;

@end
