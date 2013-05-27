//
//  CheckUpdate.m
//  NUAA
//
//  Created by 何 振东 on 12-9-19.
//  Copyright (c) 2012年 何 振东. All rights reserved.
//

#import "CheckUpdate.h"

//此APP id为程序申请时得到。更改相应的id查询App的信息
#define kAPPID      @"593499239"

//应用名字，若需要更改，可自行设置。
#define kAPPName    [infoDict objectForKey:@"CFBundleDisplayName"]

//此链接为苹果官方查询App的接口。
#define kAPPURL     @"http://itunes.apple.com/lookup?id="


@interface CheckUpdate ()
{
    NSString *_updateURL;
}

@end


@implementation CheckUpdate

+ (CheckUpdate *)shareInstance
{
    static CheckUpdate *update = nil;
    if (!update)
    {
        update = [[CheckUpdate alloc] init];
    }

    return update;
}

- (void)checkUpdate
{
    NSString *urlStr = [NSString stringWithFormat:@"%@%@",kAPPURL, kAPPID];
    NSURL *url = [NSURL URLWithString:urlStr];
    
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url ];
    [request setDidFinishSelector:@selector(checkUpdateFinished:)];
    [request setDidFailSelector:@selector(checkUpdateFailed:)];
    [request setDelegate:self];
    [request startAsynchronous];
}

- (void)checkUpdateFinished:(ASIHTTPRequest *)request
{
    if (request.responseStatusCode == 200)
    {
        NSDictionary *infoDict   = [[NSBundle mainBundle]infoDictionary];
        NSString *currentVersion = [infoDict objectForKey:@"CFBundleVersion"];
        NSDictionary *jsonData   = request.responseString.JSONValue;
        NSArray      *infoArray  = [jsonData objectForKey:@"results"];
        
        if (infoArray.count >= 1)
        {
            NSDictionary *releaseInfo   = [infoArray objectAtIndex:0];
            NSString     *latestVersion = [releaseInfo objectForKey:@"version"];
            NSString     *releaseNotes  = [releaseInfo objectForKey:@"releaseNotes"];
            NSString     *title         = [NSString stringWithFormat:@"%@%@版本", kAPPName, latestVersion];
            _updateURL = [releaseInfo objectForKey:@"trackViewUrl"];

            if ([latestVersion compare:currentVersion] == NSOrderedDescending)
            {
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:releaseNotes delegate:self cancelButtonTitle:@"忽略" otherButtonTitles:@"去App Store下载", nil];
                [alertView show];
                [alertView release];
            }
            else
            {
                if ([self.delegate respondsToSelector:@selector(currentVersionHasNewest)])
                {
                    [self.delegate currentVersionHasNewest];
                }
            }
        }
        else
        {
            if ([self.delegate respondsToSelector:@selector(currentVersionHasNewest)])
            {
                [self.delegate currentVersionHasNewest];
            }
        }
    }
    else
        if ([self.delegate respondsToSelector:@selector(currentVersionHasNewest)])
        {
            [self.delegate currentVersionHasNewest];
        }
}

- (void)checkUpdateFailed:(ASIHTTPRequest *)request
{
//    NSLog(@"data:%@", request.responseString.JSONValue);
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1)
    {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:_updateURL]];
    }
}


@end
