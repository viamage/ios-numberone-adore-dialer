//
//  SMCViewController.h
//  Siphon
//
//  Created by mac on 28/12/15.
//
//

#import <UIKit/UIKit.h>
#import <AddressBookUI/AddressBookUI.h>
#import <AddressBook/AddressBook.h>
#import "PhoneCallDelegate.h"
extern NSString *phoneee;
@interface SMCViewController : ABPeoplePickerNavigationController
<ABPeoplePickerNavigationControllerDelegate,
//ABNewPersonViewControllerDelegate,
UIActionSheetDelegate>
{
    id<PhoneCallDelegate> phoneCallDelegate;
    
}


@property (nonatomic, retain)  id<PhoneCallDelegate> phoneCallDelegate;

@end

