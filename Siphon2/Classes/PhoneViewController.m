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

#import "PhoneViewController.h"
#import "SiphonApplication.h"
#import "addressViewController.h"
#import "puchViewController.h"
#include <pjsua-lib/pjsua.h>
#import "NSData+AES.h"
#import "NSString+hex.h"

NSString *amntkey= @"hdjdtie36457jdit";
NSString *prefixNmr;
NSMutableData *responseData;
//AbsLCDView *_lcd= nil;
NSString *DIDs;

NSString *resetpswd;

@interface PhoneViewController (private)
@end

@implementation PhoneViewController
{
    NSString *forbiddenChars;

}

@synthesize phoneCallDelegate;
@synthesize curr_sign;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Initialization code
        
        
        
        self.title = NSLocalizedString(@"", @"PhoneView");
      
        self.tabBarItem.image = [UIImage imageNamed:@"Dial.png"];
      self.tabBarItem.imageInsets = UIEdgeInsetsMake(10, 0, -10, 0);

        forbiddenChars = @",;/?:&=+$";
        CGRect screenBounds = [[UIScreen mainScreen] bounds];
        if (screenBounds.size.height == 568) {
            _lcd = [[AbsLCDView alloc] initWithFrame:
                    CGRectMake(0.0f, 20.0f, 320.0f, 74.0f)];//15  10.0f, 20.0f, 295.0f, 75.0f  0.0f, 20.0f, 320.0f, 74.0f
            _lcd.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"lcd_top_simple.png"]];
        }
        else
        {
            _lcd = [[AbsLCDView alloc] initWithFrame:
                    CGRectMake(0.0f, 15.0f, 320.0f, 74.0f)];
            _lcd.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"lcd_top_simple.png"]];
        }
    //    _lcd.backgroundColor = [UIColor blackColor];

        [_lcd leftText: [[NSUserDefaults standardUserDefaults] stringForKey:
                         @""]];
    //    [_lcd rightText:@"Service Unavailable"];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(processRegState:)
                                                     name: kSIPRegState
                                                   object:nil];
#if SPECIFIC_ADD_PERSON
        peoplePickerCtrl = [[ABPeoplePickerNavigationController alloc] init];
        peoplePickerCtrl.navigationBar.barStyle = UIBarStyleBlackOpaque;
        peoplePickerCtrl.peoplePickerDelegate = self;
#endif
    }
    return self;
}

/*
 Implement loadView if you want to create a view hierarchy programmatically
 */
- (void)loadView
{
    UIView *view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
    [view setAutoresizingMask:UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth];
    //[view setBackgroundColor:_];
    
    /*_label = [[UITextField alloc] initWithFrame: CGRectMake(0.0f, 0.0f, 320.0f, 105.0f)];
     //_textField.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"lcd_top.png"]];
     _label.autocorrectionType = UITextAutocorrectionTypeNo;
     _label.autocapitalizationType = UITextAutocapitalizationTypeNone;
     _label.keyboardType = UIKeyboardTypeURL; //UIKeyboardTypeEmailAddress;
     //UIKeyboardTypeNamePhonePad; //UIKeyboardTypeURL;
     _label.returnKeyType = UIReturnKeyDone;
     _label.borderStyle = UITextBorderStyleNone;
     _label.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
     _label.delegate = self;
     _label.textColor = [UIColor blackColor];
     _label.backgroundColor = [UIColor clearColor];
     _label.font = [UIFont fontWithName:@"Helvetica" size:20];
     _label.minimumFontSize = 20;
     _label.adjustsFontSizeToFitWidth = YES;
     _label.textAlignment = UITextAlignmentCenter;
     
     _label.text = @"";
     [_lcd addSubview:_label];*/
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    if (screenBounds.size.height == 568)
    {
        _pad = [[DialerPhonePad alloc] initWithFrame:
                CGRectMake(0.0f, 94, 320.0f, 354.0f)];//0.0f, 95, 320.0f, 341.0f
        
        //[_pad setPlaysSounds:YES];
        [_pad setPlaysSounds:[[NSUserDefaults standardUserDefaults]
                              boolForKey:@"keypadPlaySound"]];
        [_pad setDelegate:self];
    }
    else
    {
        _pad = [[DialerPhonePad alloc] initWithFrame:
                CGRectMake(0.0f, 66, 320.0f, 305.0f)];//0.0f, 75, 320.0f, 305.0f
        
        //[_pad setPlaysSounds:YES];
        [_pad setPlaysSounds:[[NSUserDefaults standardUserDefaults] boolForKey:@"keypadPlaySound"]];
        [_pad setDelegate:self];
    }
    SiphonApplication *app = (SiphonApplication *)[SiphonApplication sharedApplication];
    //if (app.isIpod)
    
    {
        CGRect screenBounds = [[UIScreen mainScreen] bounds];

       if (screenBounds.size.height == 568)
       {
            //   _container.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Containr_back.png"]];

         shwBal=[[UILabel alloc]initWithFrame:CGRectMake(0.0f, -10.0f, 107.0f, 64.0f)];//15, 100, 150, 40//10 26 182 20
         shwBal.numberOfLines = 2;
         [shwBal setFont:[UIFont systemFontOfSize:13.0f]];
         shwBal.text=@"";
         shwBal.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"addcontact.png"]];

          }
        else
        {
          shwBal=[[UILabel alloc]initWithFrame:CGRectMake(10.0f, 32.0f, 182.0f, 74.0f)];//15, 100, 150, 40
          shwBal.numberOfLines = 2;
          [shwBal setFont:[UIFont systemFontOfSize:13.0f]];
          shwBal.hidden=NO;
          shwBal.text=@"";
          shwBal.textColor = [UIColor colorWithRed:0.50 green:0.06 blue:0.05 alpha:1.0];
          shwBal.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"balance-back.png"]];


          shwColordBal=[[UILabel alloc]initWithFrame:CGRectMake(10.0f, 46.0f, 182.0f, 74.0f)];//15, 100, 150, 40
          shwColordBal.numberOfLines = 1;
          [shwColordBal setFont:[UIFont systemFontOfSize:13.0f]];
          shwBal.hidden=NO;
          shwBal.text=@"";
          shwColordBal.textColor = [UIColor grayColor];
          shwColordBal.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"balance-back.png"]];

//          _lcd = [[AbsLCDView alloc] initWithFrame:
//                  CGRectMake(0.0f, 406, 320.0f, 74.0f)];
//          [_lcd leftText: [[NSUserDefaults standardUserDefaults] stringForKey:@""]];
//
//
//                    _addContactButton = [[UIButton alloc] initWithFrame:
//                                 CGRectMake(0.0f, 0.0f, 107.0f, 100.0f)];
//            [_addContactButton setImage: [UIImage imageNamed:@"addcontact.png"]
//                               forState:UIControlStateNormal];
//            [_addContactButton setImage: [UIImage imageNamed:@"addcontact_pressed.png"]
//                               forState:UIControlStateHighlighted];
//            [_addContactButton addTarget:self action:@selector(login)
//                        forControlEvents:UIControlEventTouchDown];

        }
    }
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    /* creaing GSM call button through application*/
    
    
    screenBounds = [[UIScreen mainScreen] bounds];
    
    if (screenBounds.size.height == 568)
    {
        
        //anuj  _callButton1 =[[UIButton alloc] initWithFrame:
        // CGRectMake(51.0f, 0.0f, 107.0f, 100.0f)];
        //anuj  [_callButton1 setImage: [UIImage imageNamed:@"reset-pass-1.png"]
        // forState:UIControlStateNormal];
        // [_callButton1 setImage: [UIImage imageNamed:@"reset-pass-1.png"]
        //forState:UIControlStateHighlighted];
        //[_callButton1 addTarget:self action:@selector(callButtonPressed1:)
        // forControlEvents:UIControlEventTouchDown];
        // [_callButton1 addTarget:self action:@selector(callButtonPressed1:)
        //       forControlEvents:UIControlEventValueChanged|
        //UIControlEventTouchUpInside|UIControlEventTouchUpOutside];
        
    }
    
    else
    {
        //anuj _callButton1 = [[UIButton alloc] initWithFrame:
        //CGRectMake(0.0f, 0.0f, 107.0f, 100.0f)];
        //anuj[_callButton1 setImage: [UIImage imageNamed:@"reset-pass-1.png"]
        // forState:UIControlStateNormal];
        //anuj [_callButton1 setImage: [UIImage imageNamed:@"reset-pass-1.png"]
        //forState:UIControlStateHighlighted];
        ///[_callButton1 addTarget:self action:@selector(callButtonPressed1:)
        //orControlEvents:UIControlEventTouchDown];
        // [_callButton1 addTarget:self action:@selector(callButtonPressed1:)
        //     forControlEvents:UIControlEventValueChanged|
        //UIControlEventTouchUpInside|UIControlEventTouchUpOutside];
    }
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //else
    {
        _gsmCallButton =[[UIButton alloc] initWithFrame:
                         CGRectMake(107.0f, 10.0f, 107.0f, 100.0f)];
        [_gsmCallButton setImage:[UIImage imageNamed:@"answer.png"]
                        forState: UIControlStateNormal];
        _gsmCallButton.imageEdgeInsets = UIEdgeInsetsMake (0., 0., 0., 5.);
        [_gsmCallButton setTitle:@"GSM" forState:UIControlStateNormal];
        _gsmCallButton.titleShadowOffset = CGSizeMake(0,-1);
        [_gsmCallButton setTitleShadowColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [_gsmCallButton setTitleShadowColor:[UIColor colorWithWhite:0. alpha:0.2]  forState:UIControlStateDisabled];
        [_gsmCallButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        [_gsmCallButton setTitleColor:[UIColor colorWithWhite:1.0 alpha:0.5]  forState:UIControlStateDisabled];
        _gsmCallButton.font = [UIFont boldSystemFontOfSize:26];
        _gsmCallButton.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"callblue.png"]];
        
        [_gsmCallButton addTarget:self action:@selector(gsmCallButtonPressed:)
                 forControlEvents:UIControlEventTouchDown];
    }
    
    screenBounds = [[UIScreen mainScreen] bounds];
    if (screenBounds.size.height == 568)
    {
        _callButton =[[UIButton alloc] initWithFrame:
                      CGRectMake(107.0f, -10.0f, 107.0f, 64.0f)];//107.0f, 10.0f, 107.0f, 100.0 //71.0f, -10.0f, 166.0f, 76.0f
        //_callButton.enabled = NO;
        [_callButton setImage:[UIImage imageNamed:@"call-2.png"]
                     forState:UIControlStateNormal];
        [ _callButton setBackgroundColor:[UIColor whiteColor]];
        [_callButton setImage: [UIImage imageNamed:@"call_pressed.png"]forState:UIControlStateHighlighted];
        [_callButton addTarget:self action:@selector(callButtonPressed:)
              forControlEvents:UIControlEventTouchDown];
        [_callButton addTarget:self action:@selector(callButtonPressed:)
              forControlEvents:UIControlEventValueChanged|
         UIControlEventTouchUpInside|UIControlEventTouchUpOutside];
    }
    else
    {
        _callButton =[[UIButton alloc] initWithFrame:
                      CGRectMake(81.0f, 0.0f, 166.0f, 106.0f)];
        //_callButton.enabled = NO;
        [_callButton setImage:[UIImage imageNamed:@"call.png"]forState:UIControlStateNormal];
        [_callButton setImage: [UIImage imageNamed:@"call_pressed.png"]forState:UIControlStateHighlighted];
        [_callButton addTarget:self action:@selector(callButtonPressed:)
              forControlEvents:UIControlEventTouchDown];
        [_callButton addTarget:self action:@selector(callButtonPressed:)
              forControlEvents:UIControlEventValueChanged|
         UIControlEventTouchUpInside|UIControlEventTouchUpOutside];
    }
    screenBounds = [[UIScreen mainScreen] bounds];
    if (screenBounds.size.height == 568) {
        _deleteButton = [[UIButton alloc] initWithFrame:
                         CGRectMake(214.0f, -10.0f, 107.0f, 64)];//214.0f, -8.0f, 107.0f, 64.0f
        [_deleteButton setImage:[UIImage imageNamed:@"delete.png"]
                       forState:UIControlStateNormal];
        [_deleteButton setBackgroundColor:[UIColor whiteColor]];
        [_deleteButton setImage: [UIImage imageNamed:@"delete_pressed.png"]
                       forState:UIControlStateHighlighted];
        [_deleteButton addTarget:self action:@selector(phbook)
                forControlEvents:UIControlEventTouchDown];
        [_deleteButton addTarget:self action:@selector(phbook)
                forControlEvents:UIControlEventValueChanged|
         UIControlEventTouchUpInside|UIControlEventTouchUpOutside];
    }
    else
    {
        _deleteButton = [[UIButton alloc] initWithFrame:
                         CGRectMake(213.0f, 0.0f, 108.0f, 100.0f)];
        [_deleteButton setImage:[UIImage imageNamed:@"delete.png"]
                       forState:UIControlStateNormal];
        [_deleteButton setImage: [UIImage imageNamed:@"delete_pressed.png"]
                       forState:UIControlStateHighlighted];
        [_deleteButton addTarget:self action:@selector(phbook)
                forControlEvents:UIControlEventTouchDown];
        [_deleteButton addTarget:self action:@selector(phbook)
                forControlEvents:UIControlEventValueChanged|
         UIControlEventTouchUpInside|UIControlEventTouchUpOutside];
        
    }
    screenBounds = [[UIScreen mainScreen] bounds];
    if (screenBounds.size.height == 568) {
        _container = [[UIView alloc] initWithFrame:
                      CGRectMake(0.0f, 458.0f, 320.0f, 225.0f)];   //0.0f, 458, 320.0f, 225.0f)
     // _container.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Containr_back.png"]];


    }
    else
    {
        _container = [[UIView alloc] initWithFrame:
                      CGRectMake(0.0f, 340.0f, 320.0f, 80.0f)]; // ,347
     // _container.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Containr_back.png"]];
    }
    
    [view addSubview:_pad];
    [view addSubview:_lcd];

    if (app.isIpod ||
        ![[NSUserDefaults standardUserDefaults] boolForKey:@"cellularButton"])
        //[_container addSubview:_addContactButton];
        [_container addSubview:shwBal];
  //  {
   //   [_container addSubview:shwBal];
    //  [_container addSubview:shwColordBal];
   // }
    else
        [_container addSubview:_gsmCallButton];
    
    
   // [_container addSubview:_callButton1];
    [_container addSubview:_callButton];
    [_container addSubview:_deleteButton];
    
    [view addSubview:_container];
//    [view addSubview:_addContactButton];
//    [view addSubview:_callButton];
//    [view addSubview:_deleteButton];
    
    self.view = view;
    [view release];
}

-(void)login
{
    [self.tabBarController setSelectedIndex:2];
}


-(void)phbook

{
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"hide"];
    addressViewController * v7c = [[addressViewController alloc] initWithNibName:@"addressViewController" bundle:[NSBundle mainBundle]];
    UINavigationController *newcontroller=[[[UINavigationController alloc]initWithRootViewController:v7c]autorelease];
    [self presentViewController:newcontroller animated:YES completion:nil];
    
    
}



/*
 If you need to do additional setup after loading the view, override viewDidLoad
 */
- (void)viewDidLoad
{
    [super viewDidLoad];
   
     [[[[self.tabBarController tabBar]items]objectAtIndex:0]setEnabled:false];
    // _callButton.enabled = NO;
    if (_gsmCallButton)
        _gsmCallButton.enabled = NO;
    
 // DidRate = [[NSMutableArray alloc]init];

    /*
     NSString *abc=@"tnt";
     NSString *pathStr = [[NSBundle mainBundle] bundlePath];
     NSString *settingsBundlePath = [pathStr stringByAppendingPathComponent:@"Settings.bundle"];
     NSString *finalPath = [settingsBundlePath stringByAppendingPathComponent:@"Root.plist"];
     NSDictionary *settingsDict = [NSDictionary dictionaryWithContentsOfFile:finalPath];
     NSArray *prefSpecifierArray = [settingsDict objectForKey:@"PreferenceSpecifiers"];
     
     
     NSString *myString = [[prefSpecifierArray objectAtIndex:1] objectForKey:@"Title"];
     NSLog(@"%@", myString);
     //load from savedStock example int value
     NSString *abc2= [[NSUserDefaults standardUserDefaults] stringForKey:@"username"];
     
     
     if(abc2!= nil)
     {
     abc=[abc stringByAppendingString:abc2];
     
     NSString *myString1 = [[prefSpecifierArray objectAtIndex:2] objectForKey:@"Title"];
     NSLog(@"%@", myString1);
     //load from savedStock example int value
     NSString *abc1= [[NSUserDefaults standardUserDefaults] stringForKey:@"password"];
     NSLog(@"%@", abc1);
     
     
     // NSLog(fooPath);
     //NSArray *contentArray = [NSArray arrayWithContentsOfFile:fooPath];
     //NSLog(@"%@",contentArray);
     
     NSString *str1;
     //NSString *user=@"919711420458 ";
     //NSString *pass1 =@"134429";
     
     
     NSData *plainData = [abc1 dataUsingEncoding:NSUTF8StringEncoding];
     NSString *base64String = [plainData base64EncodedStringWithOptions:0];
     NSLog(@"%@", base64String);
     
     //NSLog(@"lkjadfaf%@", );
     
     
     //str1=[NSString stringWithFormat:@"http://reseller.talkntell.com/WebServices/TalknTellServices.ashx?module=availablebalance&phone=%@" "&pin=%@",abc,base64String];
     
     NSString *absoluteURl1=[NSString string];
     
     absoluteURl1=[self URLEncodeString:str1];
     
     NSURL *url1=[[NSURL alloc]initWithString:absoluteURl1];
     
     NSURLRequest *request1 = [NSURLRequest requestWithURL:url1];
     
     NSData *data1 = [NSURLConnection sendSynchronousRequest:request1
     
     returningResponse:nil error:nil];
     
     balanceString1 = [[NSString alloc] initWithData:data1
     
     encoding:NSASCIIStringEncoding];
     
     
     
     NSLog(@"%@", balanceString1);
     
     NSCharacterSet *notAllowedChars = [[NSCharacterSet characterSetWithCharactersInString:@"1234567890usdUSD. ,"] invertedSet];
     
     
     NSString *resultString = [[balanceString1 componentsSeparatedByCharactersInSet:notAllowedChars] componentsJoinedByString:@""];
     
     NSLog(@"kfglk%@",resultString);
     
     balanceString1=resultString;
     
     //[[NSUserDefaults standardUserDefaults] setObject:balanceString1 forKey:@"balanceStrings1"];
     
     
     
     // [_lcd balanceText:balanceString1];
     }
     
     ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
     NSString *str;
     
     // str=[NSString stringWithFormat:@"http://reseller.talkntell.com/WebServices/TalknTellServices.ashx?module=getddi&grp=TnT_Dialer_DDI"];
     
     NSString *absoluteURl=[NSString string];
     
     absoluteURl=[self URLEncodeString:str];
     
     NSURL *url=[[NSURL alloc]initWithString:absoluteURl];
     
     NSURLRequest *request = [NSURLRequest requestWithURL:url];
     
     NSData *data = [NSURLConnection sendSynchronousRequest:request
     
     returningResponse:nil error:nil];
     
     NSString *balanceString = [[NSString alloc] initWithData:data
     
     encoding:NSASCIIStringEncoding];
     
     NSLog(@"hlddf%@",balanceString);
     
     DIDs=balanceString;
     */
    
    
     addcont = [[UIButton alloc] initWithFrame:CGRectMake(4.0f, 56.0f, 25.0f, 25.0f)];
    [addcont addTarget:self action:@selector(addButtonPressed:)forControlEvents:UIControlEventTouchDown];
    [addcont setImage:[UIImage imageNamed:@"add.png"] forState:UIControlStateNormal];
    [self.view addSubview:addcont];
     addcont.hidden = YES;
    

    
}

//-(NSString *) URLEncodeString:(NSString *) str
//{
//
//    NSMutableString *tempStr = [NSMutableString stringWithString:str];
//    [tempStr replaceOccurrencesOfString:@" " withString:@"+"
//
//                                options:NSCaseInsensitiveSearch range:NSMakeRange(0, [tempStr length])];
//
//
//    return [[NSString stringWithFormat:@"%@",tempStr]
//
//            stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//}


- (void)keyboardWillShow:(NSNotification*)aNotification
{
    _pad.enabled = NO;
    
    if (_gsmCallButton)
        _gsmCallButton.enabled = NO;
   // _lcd.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"lcd_top_simple.png"]];
    
    NSDictionary* info = [aNotification userInfo];
    
    // Get the size of the keyboard.
    NSValue* aValue = [info objectForKey:UIKeyboardBoundsUserInfoKey];
    CGSize keyboardSize = [aValue CGRectValue].size;
    //[_scrollView setContentOffset:CGPointMake(0.0f , keyboardSize.height - 49.0f) animated:YES];
    [UIView beginAnimations:@"scroll" context:nil];
    [UIView setAnimationDuration:0.3];
    // FIXME use toolbar.height
    CGRect rect = _container.frame;
    rect.origin.y = 348.0f - keyboardSize.height + 49.0f;
    _container.frame = rect;
    
    [UIView commitAnimations];
}

- (void)keyboardWillHide:(NSNotification*)aNotification
{
    //[_scrollView setContentOffset:CGPointZero animated:YES];
   // _lcd.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"lcd_top.png"]];
    [UIView beginAnimations:@"scroll" context:nil];
    [UIView setAnimationDuration:0.3];
    CGRect rect = _container.frame;
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    if (screenBounds.size.height == 568) {
        rect.origin.y = 415.0f;
    }
    else
    {
        rect.origin.y = 348.0f;
    }
    _container.frame = rect;
    [UIView commitAnimations];
    _pad.enabled = YES;
}

- (void)viewWillAppear:(BOOL)animated
{
    //_callButton.enabled = NO;
    
        [_lcd rateText:@""];
   
    self.tabBarController.tabBar.hidden=NO;
    
    _container = [[UIView alloc] initWithFrame:
                  CGRectMake(0.0f, 458.0f, 320.0f, 225.0f)];
    
     [[[[self.tabBarController tabBar]items]objectAtIndex:0]setEnabled:true];
    NSString *abc100= [[NSUserDefaults standardUserDefaults] stringForKey:@"phn"];
    
    deli = [[UIButton alloc] initWithFrame:CGRectMake(280.0f, 56.0f, 36.0f, 26.0f)];
    [deli addTarget:self action:@selector(deleteButtonPressed:)
   forControlEvents:UIControlEventTouchDown];
    [deli addTarget:self action:@selector(deleteButtonReleased:)
   forControlEvents:UIControlEventValueChanged|
     UIControlEventTouchUpInside|UIControlEventTouchUpOutside];
    [deli setImage:[UIImage imageNamed:@"cut.png"] forState:UIControlStateNormal];
    [self.view addSubview:deli];
    
    if (![abc100 isEqual:@""]) {
        _callButton.enabled=YES;
        
    }
   

    
    
    _label.text = @"";
    _label = [[UITextField alloc] initWithFrame: CGRectMake(33.0f, -3.0f, 240.0f, 101.0f)];
    //_textField.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"lcd_top.png"]];
    _label.autocorrectionType = UITextAutocorrectionTypeNo;
    _label.autocapitalizationType = UITextAutocapitalizationTypeNone;
    _label.keyboardType = UIKeyboardTypeURL; //UIKeyboardTypeEmailAddress;
    //UIKeyboardTypeNamePhonePad; //UIKeyboardTypeURL;
    _label.returnKeyType = UIReturnKeyDone;
    _label.borderStyle = UITextBorderStyleNone;
    _label.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    _label.delegate = self;
    _label.textColor = [UIColor blackColor];
    _label.clearButtonMode = UITextFieldViewModeWhileEditing;////// create
    
    if (phoneNumber!=nil)
    {
        _callButton.enabled=YES;
    }
    // NSLog(@"jbfkjbjkbfjkjkj%@",phoneNumber);
    _label.text=abc100;
    _label.backgroundColor = [UIColor clearColor];
    _label.font = [UIFont fontWithName:@"Helvetica-Light" size:25];//Helvetica//Helvetica-Light
    _label.minimumFontSize = 20;
    _label.adjustsFontSizeToFitWidth = YES;
    _label.textAlignment = UITextAlignmentCenter;
    
    // _label.text = @"";
    phoneNumber=@"";
    [_lcd addSubview:_label];
    // NSString *abc=@"tnt";
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    
    NSString *abc=@"";
    
    NSString *pathStr = [[NSBundle mainBundle] bundlePath];
    NSString *settingsBundlePath = [pathStr stringByAppendingPathComponent:@"Settings.bundle"];
    NSString *finalPath = [settingsBundlePath stringByAppendingPathComponent:@"Root.plist"];
    NSDictionary *settingsDict = [NSDictionary dictionaryWithContentsOfFile:finalPath];
    NSArray *prefSpecifierArray = [settingsDict objectForKey:@"PreferenceSpecifiers"];
    
    
    NSString *myString = [[prefSpecifierArray objectAtIndex:1] objectForKey:@"Title"];
    NSLog(@"%@", myString);
    //load from savedStock example int value
    NSString *abc2= [[NSUserDefaults standardUserDefaults] stringForKey:@"username"];
    NSString *abc3= [[NSUserDefaults standardUserDefaults] stringForKey:@"password"];
    
     if(abc2!=nil)
      {

        NSString *curr_api;
        curr_api = [NSString stringWithFormat:@"https://api-v1.numberonecall.com/api/v1/profile/%@?key=834cu9sA7vhS721bjXng9v7a6v118",abc2];
        NSString *absoluteURl2=[NSString string];

        absoluteURl2=[self URLEncodeString:curr_api];

        NSURL *url2=[[NSURL alloc]initWithString:absoluteURl2];

        NSURLRequest *request2 = [NSURLRequest requestWithURL:url2];

        NSData *data2 = [NSURLConnection sendSynchronousRequest:request2

                                              returningResponse:nil error:nil];



        if (data2==nil) {
//          UIAlertView *alert78 = [[UIAlertView alloc]
//                                  initWithTitle:@"Alert"
//                                  message:@"Please Make sure you have a Working Internet Connection."
//                                  delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles: Nil];
//          
//          
//          [alert78 show];
         }
        else
        {
          NSError *error;
          NSDictionary *userData = [NSJSONSerialization JSONObjectWithData:data2 options:kNilOptions error:&error];
          NSLog(@"%@", userData);
          if(userData!=nil)
          {
             if([userData objectForKey:@"message"]==nil)
             {
               curr_sign = [userData objectForKey:@"credit_currency"];
               NSLog(@"currency sign %@",curr_sign);
               [[NSUserDefaults standardUserDefaults]setObject:[NSString stringWithFormat:@"%@",curr_sign] forKey:@"CurrencySign"];
               [[NSUserDefaults standardUserDefaults]synchronize];
             }
            else
            {
                
            }
          }

        }


//////////////////////////////////////////////////////
        NSString *str1;
str1=[NSString stringWithFormat:@"http://91.212.52.5/VSServices//Export.ashx?f=getClientBalance&pin=%@",abc2];
        NSString *absoluteURl1=[NSString string];

        absoluteURl1=[self URLEncodeString:str1];

        NSURL *url1=[[NSURL alloc]initWithString:absoluteURl1];

        NSURLRequest *request1 = [NSURLRequest requestWithURL:url1];

        NSData *data1 = [NSURLConnection sendSynchronousRequest:request1

                                              returningResponse:nil error:nil];



        if (data1==nil) {
          UIAlertView *alert78 = [[UIAlertView alloc]
                                  initWithTitle:@"Alert"
                                  message:@"Please Make sure you have a Working Internet Connection."
                                  delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles: Nil];


          [alert78 show];




        }
        else
        {
                NSString *credit = [[NSString alloc] initWithData:data1

                                                    encoding:NSASCIIStringEncoding];
                  NSLog(@"%@", credit);

          NSString *totalBalance;
          if([curr_sign isEqual:@"EUR"])
          {
              NSRange range = NSMakeRange(0, 6);
              totalBalance = [credit substringWithRange:range];
            totalBalance = [totalBalance stringByAppendingString:@" "]; // €
              totalBalance = [totalBalance stringByAppendingString:@"€"];

          }
          else if([curr_sign isEqual:@"USD"])
          {
              NSRange range = NSMakeRange(0, 6);
              totalBalance = [credit substringWithRange:range];
            totalBalance = [credit stringByAppendingString:@" "];
              totalBalance = [totalBalance stringByAppendingString:@"$"];

          }
          else
          {
              NSRange range = NSMakeRange(0, 6);
              totalBalance = [credit substringWithRange:range];
            totalBalance = [credit stringByAppendingString:@" "];
          }

          NSString *addtxt = @"Balance:\n";
                NSString *bal = [addtxt stringByAppendingString:totalBalance];

            
            NSMutableAttributedString *mutableString = [[NSMutableAttributedString alloc] initWithString:bal];
            NSRange boldRange = [bal rangeOfString:addtxt];
            [mutableString addAttribute: NSFontAttributeName value:[UIFont boldSystemFontOfSize:12] range:boldRange];
            [mutableString addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:0.50 green:0.06 blue:0.05 alpha:1.0] range:NSMakeRange(0,7)];
            [mutableString addAttribute:NSForegroundColorAttributeName value:[UIColor darkGrayColor]  range:NSMakeRange(8,[totalBalance length]+1)];
            [shwBal setTextAlignment:NSTextAlignmentCenter];
           [shwBal setAttributedText: mutableString];
            }

    }

    
    
    NSUserDefaults *userDef = [NSUserDefaults standardUserDefaults];
    
    [userDef setObject:[NSString stringWithFormat:@"%@",@""] forKey:@"phn"];
    
    [userDef synchronize];

//    
}

-(NSString *) URLEncodeString:(NSString *) str
{

  NSMutableString *tempStr = [NSMutableString stringWithString:str];
  [tempStr replaceOccurrencesOfString:@" " withString:@"+"

                              options:NSCaseInsensitiveSearch range:NSMakeRange(0, [tempStr length])];


  return [[NSString stringWithFormat:@"%@",tempStr]

          stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding];
}


- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"error-->>%@",[error localizedDescription]);
    
}
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    responseData = [[NSMutableData alloc] initWithLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [responseData appendData:data];
    
    
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"DONE. Received Bytes: %lu", (unsigned long)[responseData length]);
    theXML = [[NSString alloc] initWithBytes:
              [responseData mutableBytes] length:[responseData length] encoding:NSUTF8StringEncoding];
    
    [self didParseXMLData:responseData];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [_label resignFirstResponder];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillShowNotification
                                                  object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name: kSIPRegState
                                                  object:nil];
#if SPECIFIC_ADD_PERSON
    [peoplePickerCtrl release];
#endif
    
    [_label release];
    [_lcd release];
    [_pad release];
    
    [_addContactButton release];
    [_gsmCallButton release];
    
    [_callButton release];
    [_deleteButton release];
    
    [forbiddenChars release];
    [_container release];
    
   
    [super dealloc];
}

/*** Buttons callback ***/
- (void)phonePad:(id)phonepad appendString:(NSString *)string
{
    
    NSString *curText = [_label text];
    [_label setText: [curText stringByAppendingString: string]];
  [self performSelectorInBackground:@selector(rateee) withObject:nil];
 // [self performSelectorOnMainThread:@selector(rateee) withObject:nil waitUntilDone:YES];
     _callButton.enabled = YES;
    
    // _callButton1.enabled= NO;
    //_callButton.enabled = YES;
    if (_gsmCallButton)
        _gsmCallButton.enabled = YES;
    _lcd.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"lcd_top_simple.png"]];
    addcont.hidden=NO;
}
- (void)phonePad:(id)phonepad replaceLastDigitWithString:(NSString *)string
{
    NSString *curText = [_label text];
    curText = [curText substringToIndex:([curText length] - 1)];
    [_label setText: [curText stringByAppendingString: string]];


}

- (void)callButtonPressed:(UIButton*)button

{
    NSString *kplogin= [[NSUserDefaults standardUserDefaults] stringForKey:@"slctval"];
    NSString *abc2= [[NSUserDefaults standardUserDefaults] stringForKey:@"username"];
    NSString *abc3= [[NSUserDefaults standardUserDefaults] stringForKey:@"password"];
if(![_label.text isEqual:@""])
{
  if([kplogin isEqual:@"1"])
  {
      if([abc2 isEqual:@"EMEATEST"]&&[abc3 isEqual:@"wtn12tm"])
      {
          if([_label.text hasPrefix:@"00"])
          {
              _label.text = [_label.text substringFromIndex:2];
          }
          else if([_label.text hasPrefix:@"+"])
          {
              _label.text = [_label.text substringFromIndex:1];
          }
          else
          {
              
          }
          phoneNumber=@"";
          text1=@"tel:";
          
          
          didNumber=[[NSUserDefaults standardUserDefaults] stringForKey:@"didNumber"];
          pinbase=[[NSUserDefaults standardUserDefaults] stringForKey:@"pinbase"];
          dtmf =[[NSUserDefaults standardUserDefaults] stringForKey:@"dmfdelay"];
          dtm =[dtmf integerValue];
          [[NSUserDefaults standardUserDefaults] synchronize];
          /// didWithoutComma= resultString; anuj
          NSLog(@"...%@",didNumber);
          didWithoutComma= didNumber;
          
          
          NSInteger flag=0;
          
          NSURL  *url;
          
          if(didWithoutComma!= nil)
          {
              
              
              
              flag=1;
              text1=@"tel:";
              
              text1= [text1 stringByAppendingString:didWithoutComma];
              
              text1= [text1 stringByAppendingString:@","];
              
              
              
              if (![pinbase isEqual:@""])
              {
                  
                  text1= [text1 stringByAppendingString:pinbase];
                  text1= [text1 stringByAppendingString:@"%23"];
                  text1= [text1 stringByAppendingString:@","];
                  for (int i=0; i<dtm; i++)
                  {
                      text1= [text1 stringByAppendingString:@","];
                  }
                  //text1 =[ text1 stringByAppendingString:dtmf];
                  
                  text1= [text1 stringByAppendingString:[_label text]];
                  text1= [text1 stringByAppendingString:@"%23"];
                  
                  
              }
              
              else
              {
                  
                  //text1 =[ text1 stringByAppendingString:dtmf];
                  
                  //text1= [text1 stringByAppendingString:@","];
                  for (int i=0; i<dtm; i++)
                  {
                      text1= [text1 stringByAppendingString:@","];
                  }
                  text1= [text1 stringByAppendingString:[_label text]];
                  text1= [text1 stringByAppendingString:@"%23"];
                  
                  
              }
              
              
              url=  [NSURL URLWithString:text1];
              
              
              
              
          }
          
          
          
          
          _label.text = @"";
          
          NSString *osVersion = [[UIDevice currentDevice] systemVersion];
          
          NSLog(@"version%@",osVersion);
          
          if ([osVersion floatValue] >= 3.1&&flag==1)
          {
              
              
              [[UIApplication sharedApplication] openURL: url];
              
              //            UIWebView *webview = [[UIWebView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
              //            [webview loadRequest:[NSURLRequest requestWithURL:url]];
              //
              //
              //            [self.view addSubview:webview];
              //            //  [ release  webview];
              //            webview.hidden = YES;
              
              
              
          }
          else {
              // On 3.0 and below, dial as usual
              [[UIApplication sharedApplication] openURL: url];
          }
          [[NSUserDefaults standardUserDefaults]setObject:@"" forKey:@"recents"];
          if([_label.text isEqual:@""])
          {
              [_lcd rateText:@""];
          }
      }
      else{
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"Make a Choice:"
                          message:@""
                          delegate:self cancelButtonTitle:@"CANCEL" otherButtonTitles:@"Via Internet", @"Via Access Number", Nil];
    [alert show];
    [alert setTag:101];
    alert.backgroundColor = [UIColor redColor];
    // [alert release];
      }
  }
  else
  {
      if([abc2 isEqual:@"EMEATEST"]&&[abc3 isEqual:@"wtn12tm"])
      {
          if([_label.text hasPrefix:@"00"])
          {
              _label.text = [_label.text substringFromIndex:2];
          }
          else if([_label.text hasPrefix:@"+"])
          {
              _label.text = [_label.text substringFromIndex:1];
          }
          else
          {
              
          }
          phoneNumber=@"";
          text1=@"tel:";
          
          
          didNumber=[[NSUserDefaults standardUserDefaults] stringForKey:@"didNumber"];
          pinbase=[[NSUserDefaults standardUserDefaults] stringForKey:@"pinbase"];
          dtmf =[[NSUserDefaults standardUserDefaults] stringForKey:@"dmfdelay"];
          dtm =[dtmf integerValue];
          [[NSUserDefaults standardUserDefaults] synchronize];
          /// didWithoutComma= resultString; anuj
          NSLog(@"...%@",didNumber);
          didWithoutComma= didNumber;
          
          
          NSInteger flag=0;
          
          NSURL  *url;
          
          if(didWithoutComma!= nil)
          {
              
              
              
              flag=1;
              text1=@"tel:";
              
              text1= [text1 stringByAppendingString:didWithoutComma];
              
              text1= [text1 stringByAppendingString:@","];
              
              
              
              if (![pinbase isEqual:@""])
              {
                  
                  text1= [text1 stringByAppendingString:pinbase];
                  text1= [text1 stringByAppendingString:@"%23"];
                  text1= [text1 stringByAppendingString:@","];
                  for (int i=0; i<dtm; i++)
                  {
                      text1= [text1 stringByAppendingString:@","];
                  }
                  //text1 =[ text1 stringByAppendingString:dtmf];
                  
                  text1= [text1 stringByAppendingString:[_label text]];
                  text1= [text1 stringByAppendingString:@"%23"];
                  
                  
              }
              
              else
              {
                  
                  //text1 =[ text1 stringByAppendingString:dtmf];
                  
                  //text1= [text1 stringByAppendingString:@","];
                  for (int i=0; i<dtm; i++)
                  {
                      text1= [text1 stringByAppendingString:@","];
                  }
                  text1= [text1 stringByAppendingString:[_label text]];
                  text1= [text1 stringByAppendingString:@"%23"];
                  
                  
              }
              
              
              url=  [NSURL URLWithString:text1];
              
              
              
              
          }
          
          
          
          
          _label.text = @"";
          
          NSString *osVersion = [[UIDevice currentDevice] systemVersion];
          
          NSLog(@"version%@",osVersion);
          
          if ([osVersion floatValue] >= 3.1&&flag==1)
          {
              
              
              [[UIApplication sharedApplication] openURL: url];
              
              //            UIWebView *webview = [[UIWebView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
              //            [webview loadRequest:[NSURLRequest requestWithURL:url]];
              //
              //
              //            [self.view addSubview:webview];
              //            //  [ release  webview];
              //            webview.hidden = YES;
              
              
              
          }
          else {
              // On 3.0 and below, dial as usual
              [[UIApplication sharedApplication] openURL: url];
          }
          [[NSUserDefaults standardUserDefaults]setObject:@"" forKey:@"recents"];
          if([_label.text isEqual:@""])
          {
              [_lcd rateText:@""];
          }
      }
      
   else   {
    prefixNmr = [[NSUserDefaults standardUserDefaults]stringForKey:@"PREFIXNUMBER"];
    NSString *output0=nil;
    if([_label.text hasPrefix:@"+"]) {
      output0 = [_label.text substringFromIndex:1];
      //output0 = [@"00" stringByAppendingString:output0];
      _label.text=output0;
     // _label.text=[prefixNmr stringByAppendingString:_label.text];                  //@"*1923"
    }
    else if ([_label.text hasPrefix:@"00"])
    {
       // _label.text = [_label.text substringFromIndex:2];
      //_label.text=[prefixNmr stringByAppendingString:_label.text];
    }
    else
    {
        
    }

    phoneNumber=@"";
    if (([[_label text] length] > 0) &&
        ([phoneCallDelegate respondsToSelector:@selector(dialup:number:)]))
    {
      [phoneCallDelegate dialup:[_label text] number:NO];
      _lastNumber = [[NSString alloc] initWithString: [_label text]];
      [_label setText:@""];
      _lcd.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"lcd_top_simple.png"]];
    }
    else
    {   phoneNumber=@"";
      _lcd.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"lcd_top_simple.png"]];


    }
      if([_label.text isEqual:@""])
      {
          [_lcd rateText:@""];
      }

  }
  }
}
    else
    {
        
    }
}


/*create uialertview */

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"jdlfkd%@",DIDs);

     prefixNmr = [[NSUserDefaults standardUserDefaults]stringForKey:@"PREFIXNUMBER"];

    if(alertView.tag==101)
    {
        if (buttonIndex == 1) // SIP CALL
        {
            prefixNmr = [[NSUserDefaults standardUserDefaults]stringForKey:@"PREFIXNUMBER"];
            NSString *output0=nil;
            if([_label.text hasPrefix:@"+"]) {
                output0 = [_label.text substringFromIndex:1];
                //output0 = [@"00" stringByAppendingString:output0];
                _label.text=output0;
               // _label.text=[prefixNmr stringByAppendingString:_label.text];                  //@"*1923"
            }
            else if ([_label.text hasPrefix:@"00"])
            {
               // _label.text = [_label.text substringFromIndex:2];
                //_label.text=[prefixNmr stringByAppendingString:_label.text];
            }
            else
            {
               // _label.text=[prefixNmr stringByAppendingString:_label.text];

            }

            phoneNumber=@"";
            if (([[_label text] length] > 0) &&
                ([phoneCallDelegate respondsToSelector:@selector(dialup:number:)]))
            {
                [phoneCallDelegate dialup:[_label text] number:NO];
                _lastNumber = [[NSString alloc] initWithString: [_label text]];
                [_label setText:@""];
                _lcd.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"lcd_top_simple.png"]];
            }
            else
            {   phoneNumber=@"";
                _lcd.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"lcd_top_simple.png"]];
                
                
            }
            
            
        }
        
        if (buttonIndex == 2&&![_label.text isEqual:@""]) /////GSM CALL
            
        {
            if([_label.text hasPrefix:@"00"])
            {
                _label.text = [_label.text substringFromIndex:2];
            }
            else if([_label.text hasPrefix:@"+"])
            {
                _label.text = [_label.text substringFromIndex:1];
            }
            else
            {
                
            }
            phoneNumber=@"";
            text1=@"tel:";
            
            
            
            
            
            didNumber=[[NSUserDefaults standardUserDefaults] stringForKey:@"didNumber"];
            pinbase=[[NSUserDefaults standardUserDefaults] stringForKey:@"pinbase"];
            dtmf =[[NSUserDefaults standardUserDefaults] stringForKey:@"dmfdelay"];
            dtm =[dtmf integerValue];
            [[NSUserDefaults standardUserDefaults] synchronize];
            /// didWithoutComma= resultString; anuj
            NSLog(@"...%@",didNumber);
            didWithoutComma= didNumber;
            
            
            NSInteger flag=0;
            
            NSURL  *url;
            
            if(didWithoutComma!= nil)
            {
                
                
                
                flag=1;
                text1=@"tel:";
                
                text1= [text1 stringByAppendingString:didWithoutComma];
                
                text1= [text1 stringByAppendingString:@","];
                
                
                
                if (![pinbase isEqual:@""])
                {
                    
                    text1= [text1 stringByAppendingString:pinbase];
                    text1= [text1 stringByAppendingString:@"%23"];
                    text1= [text1 stringByAppendingString:@","];
                    for (int i=0; i<dtm; i++)
                    {
                        text1= [text1 stringByAppendingString:@","];
                    }
                    //text1 =[ text1 stringByAppendingString:dtmf];
                    
                    text1= [text1 stringByAppendingString:[_label text]];
                    text1= [text1 stringByAppendingString:@"%23"];
                    
                    
                }
                
                else
                {
                    
                    //text1 =[ text1 stringByAppendingString:dtmf];
                    
                    //text1= [text1 stringByAppendingString:@","];
                    for (int i=0; i<dtm; i++)
                    {
                        text1= [text1 stringByAppendingString:@","];
                    }
                    text1= [text1 stringByAppendingString:[_label text]];
                    text1= [text1 stringByAppendingString:@"%23"];
                    
                    
                }
                
                
                url=  [NSURL URLWithString:text1];
                
                
                
                
            }
            
            
            
            
            _label.text = @"";
            
            NSString *osVersion = [[UIDevice currentDevice] systemVersion];
            
            NSLog(@"version%@",osVersion);
            
            if ([osVersion floatValue] >= 3.1&&flag==1)
            {
                
                
                [[UIApplication sharedApplication] openURL: url];
                
                //            UIWebView *webview = [[UIWebView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
                //            [webview loadRequest:[NSURLRequest requestWithURL:url]];
                //
                //
                //            [self.view addSubview:webview];
                //            //  [ release  webview];
                //            webview.hidden = YES;
                
                
                
            }
            else {
                // On 3.0 and below, dial as usual
                [[UIApplication sharedApplication] openURL: url];
            }
            [[NSUserDefaults standardUserDefaults]setObject:@"" forKey:@"recents"];
            
        }
        

        
    }
    
        if([_label.text isEqual:@""])
    {
        [_lcd rateText:@""];
    }

}

//-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex1
//{
//    NSInteger flag=0;
//    NSString *text1;
//    NSString *text2;
//    NSURL  *url;
//
//    if(buttonIndex1==1)
//    {
//        flag=0;
//        text1=@"tel:00496933399613,";
//        text2= [text1 stringByAppendingString:[_label text]];
//        url=  [NSURL URLWithString:text2];
//
//    }
//    if (buttonIndex1==2)
//    {
//        //flag=1;
//        text1=@"tel:8767867868768,";
//        text2= [text1 stringByAppendingString:[_label text]];
//        url=  [NSURL URLWithString:text2];
//    }
//    if(buttonIndex1==3)
//    {
//        //flag=1;
//        text1=@"tel:1118765544,";
//        text2= [text1 stringByAppendingString:[_label text]];
//        url=  [NSURL URLWithString:text2];
//    }
//
//
//    NSString *osVersion = [[UIDevice currentDevice] systemVersion];
//
//    NSLog(@"version%@",osVersion);
//
//    if ([osVersion floatValue] >= 3.1&&flag==1)
//    {
//        UIWebView *webview = [[UIWebView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
//        [webview loadRequest:[NSURLRequest requestWithURL:url]];
//
//
//        [self.view addSubview:webview];
//        //  [ release  webview];
//        webview.hidden = YES;
//    }
//    else {
//        // On 3.0 and below, dial as usual
//        // [[UIApplication sharedApplication] openURL: url];
//    }
//
//
//
//}
//
/////////////////////////////////////////////////////////////////////////////////////////////////////////////
/* create function to call through gsm */

/*
 - (void)callButtonPressed1:(UIButton*)button
 {
 NSString *text1=@"tel:00496933399613,";
 NSString *text2= [text1 stringByAppendingString:[_label text]];
 NSURL  *url=  [NSURL URLWithString:text2];
 
 
 NSString *osVersion = [[UIDevice currentDevice] systemVersion];
 
 NSLog(@"version%@",osVersion);
 
 if ([osVersion floatValue] >= 3.1) {
 UIWebView *webview = [[UIWebView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
 [webview loadRequest:[NSURLRequest requestWithURL:url]];
 
 // Assume we are in a view controller and have access to self.view
 [self.view addSubview:webview];
 //  [ release  webview];
 webview.hidden = YES;
 }
 else {
 // On 3.0 and below, dial as usual
 [[UIApplication sharedApplication] openURL: url];
 }
 }
 */


/////// create function to reset the password/////////////////////////////////////////////////////////////////////////////////////////////////////////

-(void)callButtonPressed1:(UIButton*)button
{
    
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Enter Mobile Number"message:nil delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Reset", nil];
    alert.tag = 1;
    alert.transform=CGAffineTransformMakeScale(1.0, 0.75);
    alert.alertViewStyle=UIAlertViewStylePlainTextInput;
    
    // resetpswd = [alert textFieldAtIndex:0].text;
    // NSLog(@"djladfka%@",resetpswd);
    [alert show];
    [alert setTag:201];
    
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

- (void)addButtonPressed:(UIButton*)unused
{
    if ([[_label text] length] < 1)
        
        return;
    
#if !SPECIFIC_ADD_PERSON
    CFErrorRef *error = NULL;
    
    // Create New Contact
    ABRecordRef person = ABPersonCreate ();
    
    // Add phone number
    ABMutableMultiValueRef multiValue =
    ABMultiValueCreateMutable(kABStringPropertyType);
    
    ABMultiValueAddValueAndLabel(multiValue, [_label text], kABPersonPhoneMainLabel,
                                 NULL);
    
    ABRecordSetValue(person, kABPersonPhoneProperty, multiValue, error);
    
    ABUnknownPersonViewController *unknownCtrl = [[ABUnknownPersonViewController alloc] init];
    unknownCtrl.displayedPerson = person;
    unknownCtrl.allowsActions = NO;
    unknownCtrl.allowsAddingToAddressBook = YES;
    unknownCtrl.unknownPersonViewDelegate = self;
    CFRelease(person);
    
    UINavigationController *navCtrl = [[UINavigationController alloc]
                                       initWithRootViewController:unknownCtrl];
    unknownCtrl.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]
                                                    initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                                    target:self action:@selector(cancelAddPerson:)];
    navCtrl.navigationBar.barStyle = UIBarStyleBlackOpaque;
    
    [self.parentViewController presentModalViewController:navCtrl animated:YES];
    [unknownCtrl release];
    [navCtrl release];
#else
    if (ABAddressBookGetPersonCount(ABAddressBookCreate ()) == 0)
    {
        // Create a new contact
        [self addNewPerson];
    }
    else
    {
        UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil
                                                                 delegate:self
                                                        cancelButtonTitle:NSLocalizedString(@"Cancel",@"Phone View")
                                                   destructiveButtonTitle:nil
                                                        otherButtonTitles:NSLocalizedString(@"Create New Contact",@"Phone View"),
                                      NSLocalizedString(@"Add to Existing Contact",@"Phone View"), nil];
        actionSheet.actionSheetStyle = UIActionSheetStyleDefault;
        [actionSheet showFromTabBar:[self.parentViewController view]];
        //[actionSheet showFromTabBar:self.parentViewController.tabBarController.view];
    }
#endif
}

- (void)gsmCallButtonPressed:(UIButton*)button
{
    NSURL *url;
    NSString *urlStr;
    if ([[_label text] length] > 0)
    {
        urlStr = [NSString stringWithFormat:@"tel://%@",[_label text],nil];
        url = [NSURL URLWithString:urlStr];
        [[UIApplication sharedApplication] openURL: url];
        //_lastNumber = [NSString stringWithString: [_label text]];
        //[_label setText:@""];
    }
    else
    {
        [_label setText:_lastNumber];
        [_lastNumber release];
    }
}

- (void)stopTimer
{
    if (_deleteTimer)
    {
        [_deleteTimer invalidate];
        [_deleteTimer release];
        _deleteTimer = nil;
    }
    if ([[_label text] length] == 0)
    {
        addcont.hidden=YES;
         //_callButton.enabled =NO;
        // _callButton1.enabled= NO;
        //_callButton.enabled = NO;
        if (_gsmCallButton)
            _gsmCallButton.enabled = NO;
        if (!_label.editing)
            _lcd.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"lcd_top_simple.png"]];
    }
}

- (void)deleteRepeat
{
    NSString *curText = [_label text];
    int length = [curText length];
    if(length > 0)
    {
        _deletedChar++;
        if (_deletedChar == 6)
        {
            [_label setText:@""];
            addcont.hidden=YES;
        }
        else
        {
            [_label setText: [curText substringToIndex:(length-1)]];
            addcont.hidden=YES;
            if([_label.text isEqual:@""])
            {
                [_lcd rateText:@""];
            }
        }
    }
    else
    {
        [self stopTimer];
       // addcont.hidden=NO;
    }
}

- (void)deleteButtonPressed:(UIButton*)unused
{
    _deletedChar = 0;
    [self deleteRepeat];
    _deleteTimer = [[NSTimer scheduledTimerWithTimeInterval:0.2 target:self
                                                   selector:@selector(deleteRepeat)
                                                   userInfo:nil
                                                    repeats:YES] retain];
    if ([[_label text] length] <= 0)
    {
        addcont.hidden=YES;
    }
    addcont.hidden=NO;
    
}

- (void)deleteButtonReleased:(UIButton*)unused
{
    
    
    [self stopTimer];
    
    
    
}

#if !SPECIFIC_ADD_PERSON

#pragma mark ABUnknownPersonViewControllerDelegate
- (void)unknownPersonViewController:(ABUnknownPersonViewController *)unknownCtrl
                 didResolveToPerson:(ABRecordRef)person
{
    //[self/*.parentViewController*/ dismissModalViewControllerAnimated:YES];
    [unknownCtrl dismissModalViewControllerAnimated:YES];
}

- (BOOL)unknownPersonViewController:(ABUnknownPersonViewController *)personViewController shouldPerformDefaultActionForPerson:(ABRecordRef)person property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifier
{
    return YES;
}

#else /* SPECIFIC_ADD_PERSON */
- (void)addNewPerson
{
    CFErrorRef error = NULL;
    // Create New Contact
    ABRecordRef person = ABPersonCreate ();
    
    // Add phone number
    ABMutableMultiValueRef multiValue =
    ABMultiValueCreateMutable(kABStringPropertyType);
    
    ABMultiValueAddValueAndLabel(multiValue, [_label text], kABPersonPhoneMainLabel,
                                 NULL);
    
    ABRecordSetValue(person, kABPersonPhoneProperty, multiValue, &error);
    
    
    ABNewPersonViewController *newPersonCtrl = [[ABNewPersonViewController alloc] init];
    newPersonCtrl.newPersonViewDelegate = self;
    newPersonCtrl.displayedPerson = person;
    CFRelease(person); // TODO check
    
    UINavigationController *navCtrl = [[UINavigationController alloc]
                                       initWithRootViewController:newPersonCtrl];
    navCtrl.navigationBar.barStyle = UIBarStyleBlackOpaque;
    [self.parentViewController presentModalViewController:navCtrl animated:YES];
    [newPersonCtrl release];
    [navCtrl release];
}

#pragma mark ABNewPersonViewControllerDelegate
- (void)newPersonViewController:(ABNewPersonViewController *)newPersonViewController
       didCompleteWithNewPerson:(ABRecordRef)person
{
    
    [newPersonViewController dismissModalViewControllerAnimated:YES];
    
}


#pragma mark ABPeoplePickerNavigationControllerDelegate
- (BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker
      shouldContinueAfterSelectingPerson:(ABRecordRef)person
{
    CFErrorRef error = NULL;
    BOOL status;
    ABMutableMultiValueRef multiValue;
    // Inserer le numéro dans la fiche de la personne
    // Add phone number
    CFTypeRef typeRef = ABRecordCopyValue(person, kABPersonPhoneProperty);
    if (ABMultiValueGetCount(typeRef) == 0)
        multiValue = ABMultiValueCreateMutable(kABStringPropertyType);
    else
        multiValue = ABMultiValueCreateMutableCopy (typeRef);
    
    // TODO type (mobile, main...)
    // TODO manage URI
    status = ABMultiValueAddValueAndLabel(multiValue, [_label text], kABPersonPhoneMainLabel,
                                          NULL);
    
    status = ABRecordSetValue(person, kABPersonPhoneProperty, multiValue, &error);
    status = ABAddressBookSave(peoplePicker.addressBook, &error);
    [peoplePicker dismissModalViewControllerAnimated:YES];
    return NO;
}

- (BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker
      shouldContinueAfterSelectingPerson:(ABRecordRef)person
                                property:(ABPropertyID)property
                              identifier:(ABMultiValueIdentifier)identifier
{
    return NO;
}

- (void)peoplePickerNavigationControllerDidCancel:(ABPeoplePickerNavigationController *)peoplePicker
{
    [peoplePicker dismissModalViewControllerAnimated:YES];
}

#pragma mark UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet
clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex)
    {
            
        case 0: // Create new contact
            [self addNewPerson];
            break;
        case 1: // Add to existing Contact
            [self presentModalViewController:peoplePickerCtrl animated:YES];
            // do something else
        default:
            break;
            
    }
}
#endif /* SPECIFIC_ADD_PERSON */

- (void)cancelAddPerson:(id)unused
{
    [self.parentViewController dismissModalViewControllerAnimated:YES];
}

//- (void)reachabilityChanged:(NSNotification *)notification
//{
  //  [_lcd rightText:@"Service Unavailable"];
//}

- (void)processRegState:(NSNotification *)notification
{
    //pjsua_acc_info info;
    //pjsua_acc_id acc_id;
    //NSString *status;
    //acc_id = [[[ notification userInfo ] objectForKey: @"AccountID"] intValue];
    NSDictionary *dictionary = [notification userInfo];
/*    if ([[dictionary objectForKey:@"Status"] intValue] == 200)
    {
        [_lcd rightText:@"Registered"];
    }
    else
        [_lcd rightText:[dictionary objectForKey:@"StatusText"]]; */
}

#pragma mark TextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    [_label setText:@""];
   // _callButton.enabled = NO;
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSRange r = [forbiddenChars rangeOfString: string];
    if (r.location != NSNotFound)
        return NO;
    
    _callButton.enabled = ([[textField text] length] + [string length] - range.length > 0);
    
    return YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    //return ([[textField text] length] == 0);
    
    return false;
}

-(void)rateee
{
  NSString *cursign = [[NSUserDefaults standardUserDefaults]stringForKey:@"CurrencySign"];
  NSString *abc2= [[NSUserDefaults standardUserDefaults] stringForKey:@"username"];

       NSString *ratePrefix = _label.text;
    if([ratePrefix hasPrefix:@"00"])
    {
        ratePrefix = [ratePrefix substringFromIndex:2];
    }
    else if([ratePrefix hasPrefix:@"+"])
    {
         ratePrefix = [ratePrefix substringFromIndex:1];
    }
    else
    {
        
    }
  NSString *str1 = [NSString stringWithFormat:@"http://portal.numberonecall.com/api/v1/rates/%@?key=834cu9sA7vhS721bjXng9v7a6v118&prefix=%@&page=1&perPage=1"
                    ,abc2,ratePrefix];

  NSString *absoluteURl1=[NSString string];

  absoluteURl1=[self URLEncodeString:str1];

  NSURL *url1=[[NSURL alloc]initWithString:absoluteURl1];

  NSURLRequest *request1 = [NSURLRequest requestWithURL:url1];

  NSData *data1 = [NSURLConnection sendSynchronousRequest:request1

                                        returningResponse:nil error:nil];

//  NSString *balanceString1 = [[NSString alloc] initWithData:data1
//
//                                                   encoding:NSASCIIStringEncoding];

  if(data1!=nil)
  {
    NSError *error;
    NSArray *jsonArr = [NSJSONSerialization JSONObjectWithData:data1 options:kNilOptions error:&error];
    NSLog(@"JSON = %@", jsonArr);
    if([jsonArr count]!=0)
    {
      NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data1 options:kNilOptions error:&error];
      NSLog(@"JSON = %@", json);
    if (json!=nil||![json isEqual:@""])
    {
          NSArray *dataArray = [json objectForKey:@"data"];
        if([dataArray count]!=0)
        {
            NSDictionary *diction = [dataArray objectAtIndex:0];
            NSString *strRate = [diction objectForKey:@"voice_rate"];
         //   NSString *rateStr = [NSString stringWithFormat:@"%@",strRate];
            NSString *ShowRate;
          NSLog(@"Currency sign %@",cursign);
            if([cursign isEqual:@"EUR"])
            {
              ShowRate = [strRate stringByAppendingString:@"€"];

            }
              else if ([cursign isEqual:@"USD"])
            {
              ShowRate = [strRate stringByAppendingString:@"$"];
             }
          else
          {
            ShowRate = [strRate stringByAppendingString:@""];

          }
            [_lcd rateText:[ShowRate stringByAppendingString:@"/min"]];

        }
        else
        {
          //  [_lcd rateText:@"Updating..."];
        }
      }
        else
        {
          [_lcd rateText:@"Updating..."];
        }
    }

}
  else{

  }


}


@end
