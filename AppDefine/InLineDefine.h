
#import "AppDelegate.h"
#import <UIKit/UIKit.h>

/*－－－－－－－－－－－－－－－－－－－－－－－－常用内联函数定义－－－－－－－－－－－－－－－－－－*/


//获取appDelegate实例。
UIKIT_STATIC_INLINE AppDelegate *appDelegate()
{
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

////单例
//UIKIT_STATIC_INLINE id sharedInstance(ClassName)
//{
//    static Class *sharedInstance = nil;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^
//                  {
//                      sharedInstance = [[ClassName alloc] init];
//                  });
//    
//    return sharedInstance;
//}

