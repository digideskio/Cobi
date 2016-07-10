//
//  main.m
//  Cobi
//
//  Created by Nickolay Sheika on 7/9/16.
//  Copyright © 2016 Nickolay Sheika. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

static bool isRunningTests()
{
    return NSStringFromClass(NSClassFromString(@"XCTestCase")) != nil;
}

int main(int argc, char * argv[]) {
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, isRunningTests() ? nil : NSStringFromClass([AppDelegate class]));
    }
}
