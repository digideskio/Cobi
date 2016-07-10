//
// Created by Nickolay Sheika on 7/10/16.
// Copyright (c) 2016 Nickolay Sheika. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface PhoneCallManager : NSObject


#pragma mark - Init
- (instancetype)initWithApplication:(UIApplication *)application NS_DESIGNATED_INITIALIZER;
+ (instancetype)defaultManager;

#pragma mark - Public
- (void)makePhoneCallWithPhoneNumber:(NSString *)phoneNumber;

@end



@interface PhoneCallManager (Unavailable)


- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

@end