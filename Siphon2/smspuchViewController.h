//
//  puchViewController.h
//  Siphon
//
//  Created by karnail_dhull on 27/01/16.
//
//

#import <UIKit/UIKit.h>
#import "PhoneCallDelegate.h"
#import <AddressBook/ABAddressBook.h>
#import <AddressBookUI/AddressBookUI.h>



NSString *phoneNumber;

@interface smspuchViewController : UIViewController
{
    
    NSMutableArray *contactList;
    
    
    NSArray *modified;
 
    
}
@property (retain, nonatomic) IBOutlet UIImageView *imagesView;

@property (retain, nonatomic) IBOutlet UILabel *nameLabel;
@property (retain, nonatomic) IBOutlet UILabel *phoneLabel;

@property (retain, nonatomic) IBOutlet UIButton *onClickAction;


@property(nonatomic,retain) NSString *name;

- (IBAction)onClickCallAction:(id)sender;

- (IBAction)button0:(id)sender;

- (IBAction)button1:(id)sender;

- (IBAction)button3:(id)sender;

- (IBAction)button4:(id)sender;








-(void)fun:(NSString*)name phone:(NSString*)phonenumber;
@property (nonatomic, retain)  id<PhoneCallDelegate> phoneCallDelegate;
@property (retain, nonatomic) IBOutlet UILabel *lineLabel1;
@property (retain, nonatomic) IBOutlet UILabel *homeLabel;
@property (retain, nonatomic) IBOutlet UILabel *workLabel;
@property (retain, nonatomic) IBOutlet UILabel *iphoneLabel;
@property (retain, nonatomic) IBOutlet UILabel *lineLabel5;
@property (retain, nonatomic) IBOutlet UILabel *lineLabel6;

@property (retain, nonatomic) IBOutlet UILabel *mainLabel;

@property (retain, nonatomic) IBOutlet UILabel *lineLabel2;
@property (retain, nonatomic) IBOutlet UILabel *lineLabel3;
@property (retain, nonatomic) IBOutlet UILabel *lineLabel4;

@property(nonatomic,retain)NSString *mainPhonenumber;
@property(nonatomic,retain)NSString *homePhoneNumber;
@property(nonatomic,retain)NSString *workPhoneNumber;
@property(nonatomic,retain)NSString *iphonePhoneNumber;

@property(nonatomic,retain)NSString *phoneNumber;

@property (retain, nonatomic) IBOutlet UILabel *hLabel0;
@property (retain, nonatomic) IBOutlet UILabel *hLabel1;
@property (retain, nonatomic) IBOutlet UILabel *hLabel2;
@property (retain, nonatomic) IBOutlet UILabel *hLabel3;

@property (retain, nonatomic) IBOutlet UILabel *hLabel4;


@end
