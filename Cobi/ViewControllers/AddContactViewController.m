//
// Created by Nickolay Sheika on 7/9/16.
// Copyright (c) 2016 Nickolay Sheika. All rights reserved.
//

#import "AddContactViewController.h"
#import "APBlockValidator.h"
#import "PhoneNumberFormatter.h"
#import "APCompoundValidator.h"
#import "UIViewController+Alerts.h"
#import "NSManagedObjectContext+SaveToStore.h"
#import "Contact.h"



@interface AddContactViewController ()


#pragma mark - Outlets
@property(nonatomic, weak) IBOutlet UITextField *firstNameTextField;
@property(nonatomic, weak) IBOutlet UITextField *lastNameTextField;
@property(nonatomic, weak) IBOutlet UITextField *phoneNumberTextField;
@property(strong, nonatomic) IBOutlet APCompoundValidator *formValidator;

@end



@implementation AddContactViewController

#pragma mark - Actions

- (IBAction)cancelButtonTap:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)doneButtonTap:(id)sender
{
    [self.formValidator validate];

    if (self.formValidator.isValid) {
        [self createContactWithCompletion:^{
            [self dismissViewControllerAnimated:YES completion:nil];
        }];
    }
    else {
        [self presentValidationAlertWithErrorMessages:self.formValidator.errorMessages];
    }
}

#pragma mark - Private

- (void)createContactWithCompletion:(void (^)())completion
{
    NSManagedObjectContext *context = self.coreDataStack.mainMOC;
    [context performBlockAndSave:^{
        Contact *contact = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([Contact class])
                                                         inManagedObjectContext:context];
        contact.firstName = self.firstNameTextField.text;
        contact.lastName = self.lastNameTextField.text;
        contact.phone = self.phoneNumberTextField.text;
    } completion:^(NSError *error) {
        if (completion) {
            completion();
        }
    }];
}

@end