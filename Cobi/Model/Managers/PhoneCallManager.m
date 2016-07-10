//
// Created by Nickolay Sheika on 7/10/16.
// Copyright (c) 2016 Nickolay Sheika. All rights reserved.
//

#import "PhoneCallManager.h"



@interface PhoneCallManager ()


@property(nonatomic, strong) UIApplication *application;
@end



@implementation PhoneCallManager


#pragma mark - Init

+ (instancetype)defaultManager
{
    return [[self alloc] initWithApplication:[UIApplication sharedApplication]];
}

- (instancetype)initWithApplication:(UIApplication *)application
{
    NSParameterAssert(application);
    self = [super init];
    if (self) {
        self.application = application;
    }
    return self;
}

- (instancetype)init
{
    return nil;
}

#pragma mark - Public

- (void)makePhoneCallWithPhoneNumber:(NSString *)phoneNumber
{
    NSString *urlString = [NSString stringWithFormat:@"tel:%@", phoneNumber];
    NSURL *url = [NSURL URLWithString:urlString];
    [self.application openURL:url];
}

@end