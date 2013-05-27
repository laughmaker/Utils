//
//  EmailVerify.h
//  TongRenTang
//
//  Created by 振东 何 on 12-6-8.
//  Copyright (c) 2012年 开趣. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RegularExpression : NSObject

+ (BOOL)isValidateEmail:(NSString *)email;//邮箱符合性验证。
+ (BOOL)isNumber:(NSString *)string;//全是数字。
+ (BOOL)isEnglishWords:(NSString *)string;//验证英文字母。
+ (BOOL)isValidatePassword:(NSString *)string;//验证密码：6—16位，只能包含字符、数字和 下划线。
+ (BOOL)isChineseWords:(NSString *)string;//验证是否为汉字。
+ (BOOL)isInternetUrl:(NSString *)string;//验证是否为网络链接。

//正确格式为：XXXX-XXXXXXX，XXXX-XXXXXXXX，XXX-XXXXXXX，XXX-XXXXXXXX，XXXXXXX，XXXXXXXX
+ (BOOL)isPhoneNumber:(NSString *)string;//验证是否为电话号码。
+ (BOOL)isElevenDigitNum:(NSString *)string;
+ (BOOL)isIdentifyCardNumber:(NSString *)string;//验证15或18位身份证。

@end
