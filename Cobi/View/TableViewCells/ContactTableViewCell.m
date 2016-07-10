//
// Created by Nickolay Sheika on 7/9/16.
// Copyright (c) 2016 Nickolay Sheika. All rights reserved.
//

#import "ContactTableViewCell.h"
#import "Contact.h"
#import "ContactViewModel.h"



@interface ContactTableViewCell ()


@property(nonatomic, weak) IBOutlet UILabel *fullNameLabel;
@property(nonatomic, weak) IBOutlet UILabel *phoneNumberLabel;

@end



@implementation ContactTableViewCell


- (void)reloadWithModel:(id)model
            atIndexPath:(NSIndexPath *)indexPath
{
    ContactViewModel *contactViewModel = model;

    self.fullNameLabel.text = contactViewModel.fullName;
    self.phoneNumberLabel.text = contactViewModel.phoneNumberFormatted;
}


@end