//
// Created by Nickolay Sheika on 7/9/16.
// Copyright (c) 2016 Nickolay Sheika. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APCDController/APCDController.h"
#import "CoreDataStackInjector.h"



@interface BaseViewController : UIViewController <CoreDataStackInjectable>

@property(nonatomic, strong) APCDController *coreDataStack;

@end