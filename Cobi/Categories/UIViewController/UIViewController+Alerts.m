//
// Created by Nickolay Sheika on 7/10/16.
// Copyright (c) 2016 Nickolay Sheika. All rights reserved.
//

#import "UIViewController+Alerts.h"



@implementation UIViewController (Alerts)


- (void)presentValidationAlertWithErrorMessages:(NSArray *)errorMessages
{
    NSString *title = @"Failure";

    NSMutableString *message = [NSMutableString string];
    for (NSString *errorMessage in errorMessages) {
        [message appendFormat:@"%@\n", errorMessage];
    }

    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Ok"
                                                       style:UIAlertActionStyleDefault
                                                     handler:nil];
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title
                                                                             message:message
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:okAction];

    [self presentViewController:alertController animated:YES completion:nil];
}


@end