//
//  SMCViewController.m
//  Siphon
//
//  Created by mac on 28/12/15.
//
//

#import "SMCViewController.h"
//#import "PhoneViewController.h"
#import "smsViewController.h"
NSString *phoneee=nil;


@interface ABPeoplePickerNavigationController ()

//- (void)setAllowsCardEditing:(BOOL)allowCardEditing;
//- (void)setAllowsCancel:(BOOL)allowsCancel;

@end


@implementation SMCViewController



@synthesize phoneCallDelegate;

- (id)init
{
    self = [super init];
    if (self)
    {
        // Initialization code
        //    self.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:
        //                       UITabBarSystemItemContacts tag:3];
        self.peoplePickerDelegate = self;
        //    self.navigationBar.barStyle = UIBarStyleBlackOpaque;
//        self.title = NSLocalizedString(@"Contacts", @"ContactView");
//        self.tabBarItem.image = [UIImage imageNamed:@"contact1.png"];
        
        
        //    [self setAllowsCardEditing:YES];
        //    [self setAllowsCancel:NO];
    }
    return self;
}

/*
 If you need to do additional setup after loading the view, override viewDidLoad.
 - (void)viewDidLoad {
 }
 */


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc
{
    [super dealloc];
}

#pragma mark ABPeoplePickerNavigationControllerDelegate
- (void)peoplePickerNavigationControllerDidCancel:
(ABPeoplePickerNavigationController *)peoplePicker
{
     [self dismissViewControllerAnimated:NO completion:nil];
}

- (BOOL)peoplePickerNavigationController:
(ABPeoplePickerNavigationController *)peoplePicker
      shouldContinueAfterSelectingPerson:(ABRecordRef)person
{
    return YES;
}

//- (BOOL)peoplePickerNavigationController:
//(ABPeoplePickerNavigationController *)peoplePicker
//      shouldContinueAfterSelectingPerson:(ABRecordRef)person
//                                property:(ABPropertyID)property
//                              identifier:(ABMultiValueIdentifier)identifier
//{
//    CFTypeRef multiValue;
//    CFIndex valueIdx;
//    
//    // FIXME duplicate code from FavoritesListController.personViewController
//    if (kABPersonPhoneProperty == property)
//    {
//        multiValue = ABRecordCopyValue(person, property);
//        valueIdx = ABMultiValueGetIndexForIdentifier(multiValue,identifier);
//        phoneNumber = (NSString *)ABMultiValueCopyValueAtIndex(multiValue, valueIdx);
//        phoneNumber = [phoneNumber stringByReplacingOccurrencesOfString:@"\\s"
//                                                             withString:@""
//                                                                options:NSRegularExpressionSearch
//                                                                  range:NSMakeRange(0, [phoneNumber length])];
//        
//        phoneNumber = [phoneNumber stringByReplacingOccurrencesOfString:@"-"
//                                                             withString:@""
//                                                                options:NSRegularExpressionSearch
//                                                                  range:NSMakeRange(0, [phoneNumber length])];
//        
//        
//        self.tabBarController.selectedIndex=0;
//        //if (phoneNumber &&
//        // [phoneCallDelegate respondsToSelector:@selector(dialup:number:)])
//        //{
//        //[phoneCallDelegate dialup: phoneNumber number:YES];
//        //}
//        
//        return NO;
//    }
//    
//    return YES;
//}

-(void)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker didSelectPerson:(ABRecordRef)person property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifier
{
    CFTypeRef multiValue;
    CFIndex valueIdx;
    
    // FIXME duplicate code from FavoritesListController.personViewController
    if (kABPersonPhoneProperty == property)
    {
       // NSString *abc101= [[NSUserDefaults standardUserDefaults] stringForKey:@"sms"];
        
        multiValue = ABRecordCopyValue(person, property);
        valueIdx = ABMultiValueGetIndexForIdentifier(multiValue,identifier);
        phoneee = (NSString *)ABMultiValueCopyValueAtIndex(multiValue, valueIdx);
        phoneee = [phoneee stringByReplacingOccurrencesOfString:@"\\s"
                                                             withString:@""
                                                                options:NSRegularExpressionSearch
                                                                  range:NSMakeRange(0, [phoneee length])];
        
        phoneee = [phoneee stringByReplacingOccurrencesOfString:@"-"
                                                             withString:@""
                                                                options:NSRegularExpressionSearch
                                                                  range:NSMakeRange(0, [phoneee length])];
        
        
        
        
        
        
        NSUserDefaults *userDef = [NSUserDefaults standardUserDefaults];
        
        [userDef setObject:[NSString stringWithFormat:@"%@",phoneee] forKey:@"sms"];
        
        [userDef synchronize];
        
        
        [self dismissViewControllerAnimated:NO completion:nil];
        
        
        
    }
    
}

- (void)setEditing:(BOOL)flag animated:(BOOL)animated
{
    [super setEditing:flag animated:animated];
    if (flag == YES){
        // change view to an editable view
    }
    else {
        // save the changes if needed and change view to noneditable
    }
}

@end
