#import "CNAppDelegate.h"

@implementation CNAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [Chain sharedInstanceWithToken:@""];
    return YES;
}
							

@end
