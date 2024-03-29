//
//  Chain.h
//
//  Copyright (c) 2014 Chain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Chain : NSObject

+ (instancetype)sharedInstanceWithToken:(NSString *)token;
+ (instancetype)sharedInstance;

- (void)getAddress:(NSString *)address completionHandler:(void (^)(NSDictionary *dictionary, NSError *error))completionHandler;
- (void)getUnspents:(NSString *)address completionHandler:(void (^)(NSDictionary *dictionary, NSError *error))completionHandler;
- (void)sendTransaction:(NSString *)transaction completionHandler:(void (^)(NSDictionary *dictionary, NSError *error))completionHandler;

@end
