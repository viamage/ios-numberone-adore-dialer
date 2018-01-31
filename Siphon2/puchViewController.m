//
//  puchViewController.m
//  Siphon
//
//  Created by karnail_dhull on 27/01/16.
//
//

#import "puchViewController.h"
#import "SiphonApplication.h"


NSString *phoneNumber;

@interface puchViewController ()

@end

@implementation puchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    

    
//    UIImageView *ImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0,340,300 ,350)];
//    ImgView.image=[UIImage imageNamed:@"splash.png"];
//    [self.view addSubview:ImgView];

//    UIImageView *ImgView1 = [[UIImageView alloc] initWithFrame:CGRectMake(2,10,15 ,40)];
//    ImgView1.image=[UIImage imageNamed:@"backk.png"];
//    [self.view addSubview:ImgView1];
//    

    
    self.nameLabel.text=self.name;
    self.phoneLabel.text=self.phoneNumber;
    self.homeLabel.text=self.homePhoneNumber;
    self.workLabel.text=self.workPhoneNumber;
    self.iphoneLabel.text=self.iphonePhoneNumber;
    self.mainLabel.text=self.mainPhonenumber;
    self.pphoneLabel.text=self.pphonePhoneNumber;
 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    [self viewDidLoad];
    
    
    UIImageView *ImgView = [[UIImageView alloc] initWithFrame:CGRectMake(2,76,45 ,45)];//2,76,45 ,45
    ImgView.image=[UIImage imageNamed:@"oval.png"];
    [self.view addSubview:ImgView];

    
//    UIImageView *ImgView1 = [[UIImageView alloc] initWithFrame:CGRectMake(2,76,45 ,45)];
//    ImgView1.image=[UIImage imageNamed:@"backk.png"];
//    [self.view addSubview:ImgView1];
    

    
    NSString *qwert= [[NSUserDefaults standardUserDefaults] stringForKey:@"deduct"];

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (IBAction)onClickCallAction:(id)sender {
    if (self.phoneLabel.text!=nil ) {
     phoneNumber=[[NSString alloc]initWithString:self.phoneLabel.text];
        
        NSCharacterSet *trim = [NSCharacterSet characterSetWithCharactersInString:@"- "];
        phoneNumber = [[phoneNumber componentsSeparatedByCharactersInSet:trim] componentsJoinedByString:@""];
        NSLog(@"%@", phoneNumber);
        
     [[NSUserDefaults standardUserDefaults] setObject:phoneNumber forKey:@"phn"];
      [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"hide"];
     [self.navigationController  popToRootViewControllerAnimated:NO];
     
    }
}

- (IBAction)button0:(id)sender {
    
    if (self.homeLabel.text!=nil ) {
      phoneNumber=[[NSString alloc]initWithString:self.homeLabel.text];
        
        NSCharacterSet *trim = [NSCharacterSet characterSetWithCharactersInString:@"- "];
        phoneNumber = [[phoneNumber componentsSeparatedByCharactersInSet:trim] componentsJoinedByString:@""];
        NSLog(@"%@", phoneNumber);
        
     [[NSUserDefaults standardUserDefaults] setObject:phoneNumber forKey:@"phn"];
     [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"hide"];
     [self.navigationController  popToRootViewControllerAnimated:NO];
    }
}

- (IBAction)button1:(id)sender {
    
    if (self.workLabel.text!=nil ) {
      phoneNumber=[[NSString alloc]initWithString:self.workLabel.text];
        
        NSCharacterSet *trim = [NSCharacterSet characterSetWithCharactersInString:@"- "];
        phoneNumber = [[phoneNumber componentsSeparatedByCharactersInSet:trim] componentsJoinedByString:@""];
        NSLog(@"%@", phoneNumber);
        
     [[NSUserDefaults standardUserDefaults] setObject:phoneNumber forKey:@"phn"];
     [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"hide"];
     [self.navigationController  popToRootViewControllerAnimated:NO];

   }
}

- (IBAction)button3:(id)sender {
    
    if (self.iphoneLabel.text!=nil ) {
     phoneNumber=[[NSString alloc]initWithString:self.iphoneLabel.text];
        
        NSCharacterSet *trim = [NSCharacterSet characterSetWithCharactersInString:@"- "];
        phoneNumber = [[phoneNumber componentsSeparatedByCharactersInSet:trim] componentsJoinedByString:@""];
        NSLog(@"%@", phoneNumber);
        
     [[NSUserDefaults standardUserDefaults] setObject:phoneNumber forKey:@"phn"];
     [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"hide"];
     [self.navigationController  popToRootViewControllerAnimated:NO];
    }
}

- (IBAction)button4:(id)sender {
   if (self.mainLabel.text!=nil ) {
     phoneNumber=[[NSString alloc]initWithString:self.mainLabel.text];
       
       NSCharacterSet *trim = [NSCharacterSet characterSetWithCharactersInString:@"- "];
       phoneNumber = [[phoneNumber componentsSeparatedByCharactersInSet:trim] componentsJoinedByString:@""];
       NSLog(@"%@", phoneNumber);
       
     [[NSUserDefaults standardUserDefaults] setObject:phoneNumber forKey:@"phn"];
     [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"hide"];
     [self.navigationController  popToRootViewControllerAnimated:NO];
;
    }
}

- (IBAction)button5:(id)sender {
    if (self.pphoneLabel.text!=nil ) {
        phoneNumber=[[NSString alloc]initWithString:self.pphoneLabel.text];
        
        NSCharacterSet *trim = [NSCharacterSet characterSetWithCharactersInString:@"- "];
        phoneNumber = [[phoneNumber componentsSeparatedByCharactersInSet:trim] componentsJoinedByString:@""];
        NSLog(@"%@", phoneNumber);
        
        [[NSUserDefaults standardUserDefaults] setObject:phoneNumber forKey:@"phn"];
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"hide"];
        [self.navigationController  popToRootViewControllerAnimated:NO];
        ;
    }
}

-(void)fun:(NSString *)name phone:(NSString *)phonenumber{
    
    self.name=name;
    self.phoneNumber=phonenumber;
    ABAddressBookRef addressBook = ABAddressBookCreate();
    
    __block BOOL accessGranted = NO;
    
    if (&ABAddressBookRequestAccessWithCompletion != NULL) { // We are on iOS 6
        dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
        
        ABAddressBookRequestAccessWithCompletion(addressBook, ^(bool granted, CFErrorRef error) {
            accessGranted = granted;
            dispatch_semaphore_signal(semaphore);
        });
        
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        // dispatch_release(semaphore);
    }
    
    else { // We are on iOS 5 or Older
        accessGranted = YES;
        [self getContactsWithAddressBook:addressBook];
    }
    
    if (accessGranted) {
        [self getContactsWithAddressBook:addressBook];
    }
    
    
    [self giveConatctNames:name];
    
    

}
- (void)getContactsWithAddressBook:(ABAddressBookRef )addressBook {
    
    contactList = [[NSMutableArray alloc] init];
    CFArrayRef allPeople = ABAddressBookCopyArrayOfAllPeople(addressBook);
    CFIndex nPeople = ABAddressBookGetPersonCount(addressBook);
    

    
    for (int i=0;i < nPeople;i++) {
        NSMutableDictionary *dOfPerson=[NSMutableDictionary dictionary];
        
        ABRecordRef ref = CFArrayGetValueAtIndex(allPeople,i);
        
        //For username and surname
        ABMultiValueRef phones =(__bridge ABMultiValueRef)((__bridge NSString*)ABRecordCopyValue(ref, kABPersonPhoneProperty));
        
       
        CFStringRef phoneID = ABMultiValueCopyValueAtIndex(phones, 0);
       NSString *str = [NSString stringWithFormat:@"%@", phoneID];
        
        CFStringRef firstName, lastName;
        firstName = ABRecordCopyValue(ref, kABPersonFirstNameProperty);
        lastName  = ABRecordCopyValue(ref, kABPersonLastNameProperty);
        
        
        [dOfPerson setObject:[NSString stringWithFormat:@"%@", firstName] forKey:@"name"];
        
        
        
        if (lastName!=nil) {
            [dOfPerson setObject:[NSString stringWithFormat:@"%@ %@", firstName,lastName] forKey:@"name"];
        }
        
        
        NSString* mobileLabel;
        
        int a=ABMultiValueGetCount(phones);
               for(CFIndex j = 0; j < ABMultiValueGetCount(phones); j++) {
            mobileLabel = (__bridge NSString*)ABMultiValueCopyLabelAtIndex(phones, j);
            
            // NSString *temp=(__bridge NSString *)kABPersonPhoneMobileLabel;
                   if(j==0)
                   {
                       if([mobileLabel isEqualToString:(__bridge NSString *)kABPersonPhoneMobileLabel])
                       {
                           [dOfPerson setObject:(__bridge  NSString*)
                            ABMultiValueCopyValueAtIndex(phones, j) forKey:@"Mobile" ];
                       }
                       else if([mobileLabel isEqualToString:(__bridge NSString *)kABPersonPhoneIPhoneLabel])
                       {
                           [dOfPerson setObject:(__bridge  NSString*)
                            ABMultiValueCopyValueAtIndex(phones, j) forKey:@"IPhone" ];
                       }
                       else  if([mobileLabel isEqualToString:(__bridge NSString *)kABPersonPhoneMainLabel])
                       {
                           [dOfPerson setObject:(__bridge  NSString*)
                            ABMultiValueCopyValueAtIndex(phones, j) forKey:@"Main" ];
                       }
                       else  if([mobileLabel isEqualToString:(__bridge NSString *)kABWorkLabel])
                       {
                           [dOfPerson setObject:(__bridge  NSString*)
                            ABMultiValueCopyValueAtIndex(phones, j) forKey:@"Work" ];
                       }
                       else   if([mobileLabel isEqualToString:(__bridge NSString *)kABHomeLabel])
                       {
                           [dOfPerson setObject:(__bridge  NSString*)
                            ABMultiValueCopyValueAtIndex(phones, j) forKey:@"Home" ];
                       }
                       else
                       {
                           [dOfPerson setObject:(__bridge  NSString*)
                            ABMultiValueCopyValueAtIndex(phones, j) forKey:@"PPhone" ];
                       }
                   }
                   if(j==1)
                   {
                       //              [dOfPerson setObject:(__bridge  NSString*)
                       //               ABMultiValueCopyValueAtIndex(phones, j) forKey:@"Mobile" ];
                       if([mobileLabel isEqualToString:(__bridge NSString *)kABPersonPhoneMobileLabel])
                       {
                           [dOfPerson setObject:(__bridge  NSString*)
                            ABMultiValueCopyValueAtIndex(phones, j) forKey:@"Mobile" ];
                       }
                       else   if([mobileLabel isEqualToString:(__bridge NSString *)kABPersonPhoneIPhoneLabel])
                       {
                           [dOfPerson setObject:(__bridge  NSString*)
                            ABMultiValueCopyValueAtIndex(phones, j) forKey:@"IPhone" ];
                       }
                       else   if([mobileLabel isEqualToString:(__bridge NSString *)kABPersonPhoneMainLabel])
                       {
                           [dOfPerson setObject:(__bridge  NSString*)
                            ABMultiValueCopyValueAtIndex(phones, j) forKey:@"Main" ];
                       }
                       else   if([mobileLabel isEqualToString:(__bridge NSString *)kABWorkLabel])
                       {
                           [dOfPerson setObject:(__bridge  NSString*)
                            ABMultiValueCopyValueAtIndex(phones, j) forKey:@"Work" ];
                       }
                       else   if([mobileLabel isEqualToString:(__bridge NSString *)kABHomeLabel])
                       {
                           [dOfPerson setObject:(__bridge  NSString*)
                            ABMultiValueCopyValueAtIndex(phones, j) forKey:@"Home" ];
                       }
                       else
                       {
                           [dOfPerson setObject:(__bridge  NSString*)
                            ABMultiValueCopyValueAtIndex(phones, j) forKey:@"PPhone" ];
                       }
                       
                   }
                   if(j==2)
                   {
                       //                   [dOfPerson setObject:(__bridge  NSString*)
                       //                     ABMultiValueCopyValueAtIndex(phones, j) forKey:@"IPhone" ];
                       if([mobileLabel isEqualToString:(__bridge NSString *)kABPersonPhoneMobileLabel])
                       {
                           [dOfPerson setObject:(__bridge  NSString*)
                            ABMultiValueCopyValueAtIndex(phones, j) forKey:@"Mobile" ];
                       }
                       else    if([mobileLabel isEqualToString:(__bridge NSString *)kABPersonPhoneIPhoneLabel])
                       {
                           [dOfPerson setObject:(__bridge  NSString*)
                            ABMultiValueCopyValueAtIndex(phones, j) forKey:@"IPhone" ];
                       }
                       else    if([mobileLabel isEqualToString:(__bridge NSString *)kABPersonPhoneMainLabel])
                       {
                           [dOfPerson setObject:(__bridge  NSString*)
                            ABMultiValueCopyValueAtIndex(phones, j) forKey:@"Main" ];
                       }
                       else    if([mobileLabel isEqualToString:(__bridge NSString *)kABWorkLabel])
                       {
                           [dOfPerson setObject:(__bridge  NSString*)
                            ABMultiValueCopyValueAtIndex(phones, j) forKey:@"Work" ];
                       }
                       else     if([mobileLabel isEqualToString:(__bridge NSString *)kABHomeLabel])
                       {
                           [dOfPerson setObject:(__bridge  NSString*)
                            ABMultiValueCopyValueAtIndex(phones, j) forKey:@"Home" ];
                       }
                       else
                       {
                           [dOfPerson setObject:(__bridge  NSString*)
                            ABMultiValueCopyValueAtIndex(phones, j) forKey:@"PPhone" ];
                       }
                       
                   }
                   if(j==3)
                   {
                       //                    [dOfPerson setObject:(__bridge  NSString*)
                       //                     ABMultiValueCopyValueAtIndex(phones, j) forKey:@"Main" ];
                       if([mobileLabel isEqualToString:(__bridge NSString *)kABPersonPhoneMobileLabel])
                       {
                           [dOfPerson setObject:(__bridge  NSString*)
                            ABMultiValueCopyValueAtIndex(phones, j) forKey:@"Mobile" ];
                       }
                       else     if([mobileLabel isEqualToString:(__bridge NSString *)kABPersonPhoneIPhoneLabel])
                       {
                           [dOfPerson setObject:(__bridge  NSString*)
                            ABMultiValueCopyValueAtIndex(phones, j) forKey:@"IPhone" ];
                       }
                       else    if([mobileLabel isEqualToString:(__bridge NSString *)kABPersonPhoneMainLabel])
                       {
                           [dOfPerson setObject:(__bridge  NSString*)
                            ABMultiValueCopyValueAtIndex(phones, j) forKey:@"Main" ];
                       }
                       else     if([mobileLabel isEqualToString:(__bridge NSString *)kABWorkLabel])
                       {
                           [dOfPerson setObject:(__bridge  NSString*)
                            ABMultiValueCopyValueAtIndex(phones, j) forKey:@"Work" ];
                       }
                       else     if([mobileLabel isEqualToString:(__bridge NSString *)kABHomeLabel])
                       {
                           [dOfPerson setObject:(__bridge  NSString*)
                            ABMultiValueCopyValueAtIndex(phones, j) forKey:@"Home" ];
                       }
                       else
                       {
                           [dOfPerson setObject:(__bridge  NSString*)
                            ABMultiValueCopyValueAtIndex(phones, j) forKey:@"PPhone" ];
                       }
                       
                   }
                   if(j==4)
                   {
                       //                    [dOfPerson setObject:(__bridge  NSString*)
                       //                     ABMultiValueCopyValueAtIndex(phones, j) forKey:@"Work" ];
                       if([mobileLabel isEqualToString:(__bridge NSString *)kABPersonPhoneMobileLabel])
                       {
                           [dOfPerson setObject:(__bridge  NSString*)
                            ABMultiValueCopyValueAtIndex(phones, j) forKey:@"Mobile" ];
                       }
                       else     if([mobileLabel isEqualToString:(__bridge NSString *)kABPersonPhoneIPhoneLabel])
                       {
                           [dOfPerson setObject:(__bridge  NSString*)
                            ABMultiValueCopyValueAtIndex(phones, j) forKey:@"IPhone" ];
                       }
                       else     if([mobileLabel isEqualToString:(__bridge NSString *)kABPersonPhoneMainLabel])
                       {
                           [dOfPerson setObject:(__bridge  NSString*)
                            ABMultiValueCopyValueAtIndex(phones, j) forKey:@"Main" ];
                       }
                       else      if([mobileLabel isEqualToString:(__bridge NSString *)kABWorkLabel])
                       {
                           [dOfPerson setObject:(__bridge  NSString*)
                            ABMultiValueCopyValueAtIndex(phones, j) forKey:@"Work" ];
                       }
                       else     if([mobileLabel isEqualToString:(__bridge NSString *)kABHomeLabel])
                       {
                           [dOfPerson setObject:(__bridge  NSString*)
                            ABMultiValueCopyValueAtIndex(phones, j) forKey:@"Home" ];
                       }
                       else
                       {
                           [dOfPerson setObject:(__bridge  NSString*)
                            ABMultiValueCopyValueAtIndex(phones, j) forKey:@"PPhone" ];
                       }
                       
                   }
                   if(j==5)
                   {
                       //                    [dOfPerson setObject:(__bridge  NSString*)
                       //                     ABMultiValueCopyValueAtIndex(phones, j) forKey:@"Home" ];
                       if([mobileLabel isEqualToString:(__bridge NSString *)kABPersonPhoneMobileLabel])
                       {
                           [dOfPerson setObject:(__bridge  NSString*)
                            ABMultiValueCopyValueAtIndex(phones, j) forKey:@"Mobile" ];
                       }
                       else     if([mobileLabel isEqualToString:(__bridge NSString *)kABPersonPhoneIPhoneLabel])
                       {
                           [dOfPerson setObject:(__bridge  NSString*)
                            ABMultiValueCopyValueAtIndex(phones, j) forKey:@"IPhone" ];
                       }
                       else      if([mobileLabel isEqualToString:(__bridge NSString *)kABPersonPhoneMainLabel])
                       {
                           [dOfPerson setObject:(__bridge  NSString*)
                            ABMultiValueCopyValueAtIndex(phones, j) forKey:@"Main" ];
                       }
                       else      if([mobileLabel isEqualToString:(__bridge NSString *)kABWorkLabel])
                       {
                           [dOfPerson setObject:(__bridge  NSString*)
                            ABMultiValueCopyValueAtIndex(phones, j) forKey:@"Work" ];
                       }
                       else      if([mobileLabel isEqualToString:(__bridge NSString *)kABHomeLabel])
                       {
                           [dOfPerson setObject:(__bridge  NSString*)
                            ABMultiValueCopyValueAtIndex(phones, j) forKey:@"Home" ];
                       }
                       else
                       {
                           [dOfPerson setObject:(__bridge  NSString*)
                            ABMultiValueCopyValueAtIndex(phones, j) forKey:@"PPhone" ];
                       }
                       
                   }

//            if([mobileLabel isEqualToString:(__bridge NSString *)kABPersonPhoneMobileLabel])
//                
//                
//            {
//                [dOfPerson setObject:(__bridge NSString*)ABMultiValueCopyValueAtIndex(phones, j) forKey:@"Mobile"];
//            }
//             if ([mobileLabel isEqualToString:(NSString*)kABPersonPhoneIPhoneLabel])
//            {
//                [dOfPerson setObject:(__bridge NSString*)ABMultiValueCopyValueAtIndex(phones, j) forKey:@"IPhone"];
//               
//            }
//            
//            
//            if ([mobileLabel isEqualToString:(NSString*)kABPersonPhoneMainLabel])
//            {
//                [dOfPerson setObject:(__bridge NSString*)ABMultiValueCopyValueAtIndex(phones, j) forKey:@"Main"];
//                
//            }
//            if ([mobileLabel isEqualToString:(NSString*)kABWorkLabel])
//            {
//                [dOfPerson setObject:(__bridge NSString*)ABMultiValueCopyValueAtIndex(phones, j) forKey:@"Work"];
//                
//            }
//            if ([mobileLabel isEqualToString:(NSString*)kABHomeLabel])
//            {
//                [dOfPerson setObject:(__bridge NSString*)ABMultiValueCopyValueAtIndex(phones, j) forKey:@"Home"];
//                
//            }
            
                                     


            
        }
        
       
        
        
        [contactList addObject:dOfPerson];
        
    }
    
    NSSortDescriptor * brandDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    NSArray * sortedArray = [contactList sortedArrayUsingDescriptors:@[brandDescriptor]];
    
    
    modified=[[NSArray alloc ]initWithArray:sortedArray];
    
    
}


-(void)giveConatctNames:(NSString *)name
{
    NSString *qwert= [[NSUserDefaults standardUserDefaults] stringForKey:@"deduct"];

    for( int i=0; i<modified.count; i++) {
        
        
        NSDictionary *temp=[modified objectAtIndex:i];
        NSString *toto = [temp objectForKey:@"name"];
        
        if ([qwert isEqual:@"1"]) {
            toto=[toto lowercaseString];
            
            if ([name isEqualToString:toto]) {
                
                self.mainPhonenumber=[temp objectForKey:@"Main"];
                self.homePhoneNumber=[temp objectForKey:@"Home"];
                self.iphonePhoneNumber=[temp objectForKey:@"IPhone"];
                self.workPhoneNumber=[temp objectForKey:@"Work"];
                self.phoneNumber=[temp objectForKey:@"Mobile"];
                self.pphonePhoneNumber=[temp objectForKey:@"PPhone"];
                NSUserDefaults *userDef = [NSUserDefaults standardUserDefaults];
                [userDef setObject:[NSString stringWithFormat:@"%@",@""] forKey:@"deduct"];
                [userDef synchronize];
                
            }

        }

        else
        {
        if ([name isEqualToString:toto]) {
            
            self.mainPhonenumber=[temp objectForKey:@"Main"];
            self.homePhoneNumber=[temp objectForKey:@"Home"];
            self.iphonePhoneNumber=[temp objectForKey:@"IPhone"];
            self.workPhoneNumber=[temp objectForKey:@"Work"];
            self.phoneNumber=[temp objectForKey:@"Mobile"];
            self.pphonePhoneNumber=[temp objectForKey:@"PPhone"];
            
        }
            
        }
    
    }
    
}




- (void)dealloc {
    [_imagesView release];
    [_nameLabel release];
    [_phoneLabel release];
    [_onClickAction release];
    [_lineLabel1 release];
    [_homeLabel release];
    [_workLabel release];
    [_iphoneLabel release];
    [_mainLabel release];
    [_lineLabel2 release];
    [_lineLabel3 release];
    [_lineLabel4 release];
    [_hLabel0 release];
    [_hLabel1 release];
    [_hLabel2 release];
    [_hLabel3 release];
    [_hLabel4 release];
    [_lineLabel5 release];
    [_lineLabel6 release];
    [_pphoneLabel release];
    [super dealloc];
}
@end
