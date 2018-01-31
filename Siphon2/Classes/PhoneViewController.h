/**
 *  Siphon SIP-VoIP for iPhone and iPod Touch
 *  Copyright (C) 2008-2010 Samuel <samuelv0304@gmail.com>
 *
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License along
 *  with this program; if not, write to the Free Software Foundation, Inc.,
 *  51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 */

#import <UIKit/UIKit.h>
#import <AddressBookUI/AddressBookUI.h>

#import "PhoneCallDelegate.h"
#import "DialerPhonePad.h"
#import "AbsLCDView.h"
#import "AccountViewController.h"
#import "ContactViewController.h"
#import "addressViewController.h"
#import "puchViewController.h"
#import "NSData+AES.h"
#import "NSString+hex.h"

// extern AbsLCDView *_lcd;
#define SPECIFIC_ADD_PERSON 1


@interface PhoneViewController : UIViewController <
UITextFieldDelegate,
#if SPECIFIC_ADD_PERSON
UIActionSheetDelegate,
ABNewPersonViewControllerDelegate,
ABPeoplePickerNavigationControllerDelegate,
#else
ABUnknownPersonViewControllerDelegate,
#endif
PhonePadDelegate>
{
    UITextField *_label;
    UILabel *shwBal;
    UILabel *shwColordBal;
 //   UILabel *shwColordRate;

    UIView      *_container;
    
    UIAlertView *alert1;
    DialerPhonePad *_pad;
    UIImageView *contnr;
    UIButton *_addContactButton;
    /////////////////////////////////
    UIButton *_callButton1;
    ////////////////////////////////
    UIButton *_gsmCallButton;
    UIButton *_callButton;
    UIButton *_deleteButton;
    UIButton *addcont;
    UIButton *deli;
    NSString *did1;
    NSString *did2;
    NSString *did3;
    NSString *text1;
    NSString *didWithoutComma;
    NSString *newDid;
    NSArray *chunks;
    AbsLCDView *_lcd;
    NSString *didNumber;
    NSString *pinbase;
    NSString *dtmf;
    NSInteger dtm;
    
    int      _deletedChar;
    NSTimer *_deleteTimer;
    
    NSString *_lastNumber;
    NSString *theXML;
    id<PhoneCallDelegate> phoneCallDelegate;
#if SPECIFIC_ADD_PERSON
    ABPeoplePickerNavigationController *peoplePickerCtrl;
#endif
}

//-(IBAction)alertView1:(id)sender;


@property (nonatomic, retain)   id<PhoneCallDelegate> phoneCallDelegate;
//@property(strong,nonatomic) NSString   *theXML;
//@property (nonatomic , strong)NSMutableArray *DidRate;
@property (atomic, strong ) NSString *curr_sign;
- (void)processRegState:(NSNotification *)notification;
@end

//-(IBAction)alertView1:(id)sender;


//@property (nonatomic, retain)   id<PhoneCallDelegate> phoneCallDelegate;
////@property(strong,nonatomic) NSString   *theXML;
//- (void)processRegState:(NSNotification *)notification;
//@end
