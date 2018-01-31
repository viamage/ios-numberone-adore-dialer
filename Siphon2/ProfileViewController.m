//
//  ProfileViewController.m
//  Siphon
//
//  Created by mac on 15/12/15.
//
//

#import "ProfileViewController.h"
#import "AccountViewController.h"
#import "NSData+AES.h"
#import "NSString+hex.h"

NSString *koyy= @"hdjdtie36457jdit";

NSString *data1;
NSString *data2;
NSString *data3;
NSString *data4;
NSString *data5;

NSString *data12;

@interface ProfileViewController ()

@end

@implementation ProfileViewController



@synthesize first;
@synthesize tf1;
@synthesize second;
@synthesize tf2;
@synthesize third;
@synthesize tf3;
@synthesize fourth;
@synthesize tf4;
@synthesize fifth;
@synthesize tf5;
@synthesize exit;
@synthesize update;
@synthesize checkProf;
@synthesize phoneCallDelegate;

- (void)viewDidLoad {
    [super viewDidLoad];
  UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backgroundTap)];
  gestureRecognizer.cancelsTouchesInView = NO;
  [self.view addGestureRecognizer:gestureRecognizer];
  [gestureRecognizer release];

    // Do any additional setup after loading the view.
    UIImageView *ImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0, 350, 700)]; //create ImageView
    
    ImgView.image = [UIImage imageNamed:@"background.png"];
  
    [self.view addSubview:ImgView];

}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    /****************************FIRST NAME*********************/
    
    first=[[UILabel alloc]initWithFrame:CGRectMake(15, 70, 150, 40)];
    first.text=@"First Name   :";
    [first setTextColor:[UIColor blackColor]];
    //first.hidden=YES;
    [self.view addSubview:first];
    
    
    
    tf1 = [[UITextField alloc] initWithFrame:CGRectMake(120, 70, 180, 40)];
    tf1.textColor = [UIColor lightGrayColor];
    tf1.borderStyle = UITextBorderStyleRoundedRect;
    tf1.font = [UIFont systemFontOfSize:15];
    tf1.layer.cornerRadius= 12.0f;
 //   tf1.placeholder = @"";
    tf1.layer.borderWidth= 1.0f;
//    tf1.text = @"";
    tf3.autocorrectionType = UITextAutocorrectionTypeNo;
    tf1.keyboardType = UIKeyboardTypeDefault;
    tf1.returnKeyType = UIReturnKeyDone;
    if(self.tf1.placeholder!=nil)
    {
        self.tf1.clearsOnBeginEditing = NO;
    }
    tf1.layer.borderColor = [UIColor colorWithRed:0.71 green:0.09 blue:0.10 alpha:1.0].CGColor;
    tf1.delegate = self;

    [self.view addSubview:tf1];
    
    
    
    
    
    second=[[UILabel alloc]initWithFrame:CGRectMake(15, 120, 150, 40)];
    second.text=@"Phone No.    :";
    [second setTextColor:[UIColor blackColor]];
    //third.hidden=YES;
    [self.view addSubview:second];
    
    
    
    tf2 = [[UITextField alloc] initWithFrame:CGRectMake(120, 120, 180, 40)];
    tf2.textColor = [UIColor lightGrayColor];
    tf2.borderStyle = UITextBorderStyleRoundedRect;
    tf2.font = [UIFont systemFontOfSize:15];
    tf2.layer.cornerRadius= 12.0f;
  //  tf2.placeholder = @"";
    tf2.layer.borderWidth= 1.0f;
//    tf2.text = @"";
    tf2.layer.borderColor = [UIColor colorWithRed:0.71 green:0.09 blue:0.10 alpha:1.0].CGColor;
    tf2.autocorrectionType = UITextAutocorrectionTypeNo;
    tf2.keyboardType = UIKeyboardTypeDefault;
    tf2.returnKeyType = UIReturnKeyDone;
    if (self.tf2.placeholder != nil) {
        self.tf2.clearsOnBeginEditing = NO;
    }
    tf2.delegate = self;
    [self.view addSubview:tf2];
  [tf2 setEnabled:NO];

    /******************************Pin No*************************/
    
    third=[[UILabel alloc]initWithFrame:CGRectMake(15, 170, 150, 40)];
    third.text=@"Pin No           :";
    [third setTextColor:[UIColor blackColor]];
    //third.hidden=YES;
    [self.view addSubview:third];
    
    
    
    tf3 = [[UITextField alloc] initWithFrame:CGRectMake(120, 170, 180, 40)];
    tf3.textColor = [UIColor lightGrayColor];
    tf3.borderStyle = UITextBorderStyleRoundedRect;
    tf3.font = [UIFont systemFontOfSize:15];
    tf3.layer.cornerRadius= 12.0f;
    //    tf3.placeholder = @"";
    tf3.layer.borderWidth= 1.0f;
    //  tf3.text = @"";
    tf3.layer.borderColor = [UIColor colorWithRed:0.71 green:0.09 blue:0.10 alpha:1.0].CGColor;
    tf3.autocorrectionType = UITextAutocorrectionTypeNo;
    tf3.keyboardType = UIKeyboardTypeDefault;
    tf3.returnKeyType = UIReturnKeyDone;
    if (self.tf3.placeholder != nil) {
        self.tf3.clearsOnBeginEditing = NO;
    }
    tf3.delegate = self;
    [self.view addSubview:tf3];
    [tf3 setEnabled:NO];
    /*******************************Email ID******************************/
    
    fourth=[[UILabel alloc]initWithFrame:CGRectMake(15, 220, 150, 40)];//15, 100, 150, 40
    fourth.text=@"Email Id         :";
    [fourth setTextColor:[UIColor blackColor]];
    //fourth.hidden=YES;
    [self.view addSubview:fourth];
    
    
    
    tf4 = [[UITextField alloc] initWithFrame:CGRectMake(120, 220, 180, 40)];//120, 100, 180, 40
    tf4.textColor = [UIColor lightGrayColor];
    tf4.borderStyle = UITextBorderStyleRoundedRect;
    tf4.font = [UIFont systemFontOfSize:15];
    tf4.layer.cornerRadius= 12.0f;
    //    tf4.placeholder = @"";
    tf4.layer.borderWidth= 1.0f;
    // tf4.text = @"";
    tf4.layer.borderColor = [UIColor colorWithRed:0.71 green:0.09 blue:0.10 alpha:1.0].CGColor;
    tf4.autocorrectionType = UITextAutocorrectionTypeNo;
    tf4.keyboardType = UIKeyboardTypeDefault;
    tf4.returnKeyType = UIReturnKeyDone;
    if (self.tf4.placeholder != nil) {
        self.tf4.clearsOnBeginEditing = NO;
    }
    tf4.delegate = self;
    [self.view addSubview:tf4];
    
    /***********************************FIFTH**************************/
    
//    fifth=[[UILabel alloc]initWithFrame:CGRectMake(15, 270, 150, 40)];//15, 150, 150, 40
//    fifth.text=@"Pin No.         :";
//    [fifth setTextColor:[UIColor blackColor]];
//    //fifth.hidden=YES;
//    [self.view addSubview:fifth];
//    
//    
//    
//    tf5 = [[UITextField alloc] initWithFrame:CGRectMake(120, 270, 180, 40)];//120, 150, 180, 40
//    tf5.textColor = [UIColor lightGrayColor];
//    tf5.borderStyle = UITextBorderStyleRoundedRect;
//    tf5.font = [UIFont systemFontOfSize:15];
//    tf5.layer.cornerRadius= 12.0f;
//    tf5.placeholder = @"";
//    tf5.layer.borderWidth= 1.0f;
//    tf5.text = @"";
//    tf5.layer.borderColor = [UIColor blackColor].CGColor;
//    tf5.delegate = self;
//    [tf5 setEnabled:NO];
//    [self.view addSubview:tf5];
//    [tf5 setEnabled:NO];
    
    
    checkProf = [[UIButton alloc]initWithFrame:CGRectMake(60, 300, 200, 40)];
    [checkProf addTarget:self action:@selector(checkProfile) forControlEvents:UIControlEventTouchUpInside];
    [checkProf setBackgroundColor:[UIColor colorWithRed:0.71 green:0.09 blue:0.10 alpha:1.0]];
    checkProf.layer.cornerRadius=18;
    checkProf.layer.borderWidth= 0.0f;
    [checkProf setTitle:@"Check Profile" forState:UIControlStateNormal];
    [self.view addSubview:checkProf];
    
    
    update = [[UIButton alloc]initWithFrame:CGRectMake(60, 370, 200, 40)];
    [update addTarget:self action:@selector(updatee) forControlEvents:UIControlEventTouchUpInside];
    update.layer.cornerRadius = 18;
    update.layer.borderWidth = 0.0f;
    [update setBackgroundColor:[UIColor colorWithRed:0.71 green:0.09 blue:0.10 alpha:1.0]];
    [update setTitle:@"Update" forState:UIControlStateNormal];
    [self.view addSubview:update];
    
    exit = [[UIButton alloc] initWithFrame:CGRectMake(60, 440, 200, 40)];
    exit.layer.cornerRadius=18;
    exit.clipsToBounds= YES;
    exit.layer.borderWidth=0.0f;
    exit.backgroundColor= [UIColor colorWithRed:0.71 green:0.09 blue:0.10 alpha:1.0];
    [exit setTitle:@"Back" forState:UIControlStateNormal];
    [exit addTarget:self action:@selector(remove) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:exit];

}

- (void)backgroundTap
{
  // resign the first responder of all your textfields
  [tf1 resignFirstResponder];
  [tf2 resignFirstResponder];
  [tf3 resignFirstResponder];
  [tf4 resignFirstResponder];
  [tf5 resignFirstResponder];
}


-(void)checkProfile
{
    NSString *abc= [[NSUserDefaults standardUserDefaults] stringForKey:@"username"];
    NSString *abc1= [[NSUserDefaults standardUserDefaults] stringForKey:@"password"];
    
    if (abc!= nil) {
        ////////////////Encrption of username////////////////
        NSData *plain = [abc dataUsingEncoding:NSUTF8StringEncoding];
        NSData *cipher = [plain AES128EncryptedDataWithKey:koyy];
        printf("%s\n", [[cipher description] UTF8String]);
        NSString *base64Encoded = [cipher base64EncodedStringWithOptions:0];
        NSLog(@"Encoded: %@",base64Encoded);
        NSString *hexUsername = [base64Encoded stringToHex:base64Encoded];
        NSLog(@"HexValue : %@",hexUsername);
        NSString *UserfrmHex = [hexUsername stringFromHex:hexUsername];
        NSLog(@"StringValue : %@",UserfrmHex);
        
        /////////////Decryption of username///////////////////////
        NSData *nsdataFromBase64String = [[NSData alloc]initWithBase64EncodedString:base64Encoded options:0];
        plain = [nsdataFromBase64String AES128DecryptedDataWithKey:koyy];
        printf("%s\n", [[plain description] UTF8String]);
        NSString *base64Decoded = [[NSString alloc]initWithData:plain encoding:NSUTF8StringEncoding];
        NSLog(@"Decoded: %@", base64Decoded);

        ///////////////Encrption of password////////////////
        NSData *plain1 = [abc1 dataUsingEncoding:NSUTF8StringEncoding];
        NSData *cipher1 = [plain1 AES128EncryptedDataWithKey:koyy];
        printf("%s\n", [[cipher1 description] UTF8String]);
        NSString *base64Encoded1 = [cipher1 base64EncodedStringWithOptions:0];
        NSLog(@"Encoded: %@",base64Encoded1);
        NSString *hexPass = [base64Encoded1 stringToHex:base64Encoded1];
        NSLog(@"HexValue : %@",hexPass);
        NSString *PassfrmHex = [hexPass stringFromHex:hexPass];
        NSLog(@"StringValue : %@",PassfrmHex);
        
        ///////////////Decryption of password////////////////
        NSData *nsdataFromBase64String1 = [[NSData alloc]initWithBase64EncodedString:base64Encoded1 options:0];
        plain1 = [nsdataFromBase64String1 AES128DecryptedDataWithKey:koyy];
        printf("%s\n", [[plain1 description] UTF8String]);
        NSString *base64Decoded1 = [[NSString alloc]initWithData:plain1 encoding:NSUTF8StringEncoding];
        NSLog(@"Decoded: %@", base64Decoded1);
        /////////////////////////////////////////////////////////////
        
        
        NSString *post = [NSString stringWithFormat:@"username=%@&password=%@",hexUsername,hexPass];
        NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
        NSString *postLength = [NSString stringWithFormat:@"%lu",(unsigned long)[postData length]];
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
        [request setURL:[NSURL URLWithString:@"https://mobiglobe.com/vibgyor_4700/billing_user_details/get_user_details.php"]];
        [request setHTTPMethod:@"POST"];
        [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
        [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        [request setHTTPBody:postData];
        
        
//        NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
//        if(conn) {
//            NSLog(@"Connection Successful");
//        } else {
//            NSLog(@"Connection could not be made");
//        }

        
        NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
        [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            NSString *requestReply = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
            NSLog(@"requestReply: %@", requestReply);
            
            
            if(data==nil||[data isEqual:@""])
            {
                dispatch_async(dispatch_get_main_queue(), ^(void){
                    
                    UIAlertView *alrt = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Please check your internet connection." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    [alrt show];
                    
                });
            }
            else
            {
                if(requestReply!=nil)
                {
                
                    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                    NSLog(@"%@",json);
                    if(json!=nil)
                    {
                        data12 = [json objectForKey:@"result"];
                        if([data12 isEqual:@"success"])
                        {
                            NSDictionary *msgJson = [json objectForKey:@"data"];
                            data1 = [msgJson objectForKey:@"firstname"];
                            data2 = [msgJson objectForKey:@"username"];
                            data3 = [msgJson objectForKey:@"uipass"];
                            data4 = [msgJson objectForKey:@"email"];

                        }
                        else
                        {
                            dispatch_async(dispatch_get_main_queue(), ^(void){
                                
                                UIAlertView *alrt = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"No data found." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                                
                                [alrt show];
                                
                            });

                        }
                    }
                    else
                    {
                    
                    }
                }
                else
                {
                    
                    dispatch_async(dispatch_get_main_queue(), ^(void){
                            
                    UIAlertView *alrt = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"No response." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                            
                        [alrt show];
                            
                    });
                    

                }
            }
            dispatch_async(dispatch_get_main_queue(), ^{

                tf1.text = data1;
                tf2.text = data2;
                tf3.text = data3;
                tf4.text = data4;
            });

        }] resume];
     }
 }





-(void)updatee
{
    NSString *abc= [[NSUserDefaults standardUserDefaults] stringForKey:@"username"];
    NSString *abc1= [[NSUserDefaults standardUserDefaults] stringForKey:@"password"];
    
    if (abc!= nil) {
        ////////////////Encryption of username/////////////////
        NSData *plain = [abc dataUsingEncoding:NSUTF8StringEncoding];
        NSData *cipher = [plain AES128EncryptedDataWithKey:koyy];
        printf("%s\n", [[cipher description] UTF8String]);
        NSString *base64Encoded = [cipher base64EncodedStringWithOptions:0];
        NSLog(@"Encoded: %@",base64Encoded);
        NSString *hexUsername = [base64Encoded stringToHex:base64Encoded];
        NSLog(@"HexValue : %@",hexUsername);
        NSString *UserfrmHex = [hexUsername stringFromHex:hexUsername];
        NSLog(@"StringValue : %@",UserfrmHex);
        
        ///////////Decryption of username///////////////////////
        NSData *nsdataFromBase64String = [[NSData alloc]initWithBase64EncodedString:base64Encoded options:0];
        plain = [nsdataFromBase64String AES128DecryptedDataWithKey:koyy];
        printf("%s\n", [[plain description] UTF8String]);
        NSString *base64Decoded = [[NSString alloc]initWithData:plain encoding:NSUTF8StringEncoding];
        NSLog(@"Decoded: %@", base64Decoded);
        
        ///////////////Encryption of password////////////////////
        NSData *plain1 = [abc1 dataUsingEncoding:NSUTF8StringEncoding];
        NSData *cipher1 = [plain1 AES128EncryptedDataWithKey:koyy];
        printf("%s\n", [[cipher1 description] UTF8String]);
        NSString *base64Encoded1 = [cipher1 base64EncodedStringWithOptions:0];
        NSLog(@"Encoded: %@",base64Encoded1);
        NSString *hexPass = [base64Encoded1 stringToHex:base64Encoded1];
        NSLog(@"HexValue : %@",hexPass);
        
        /////////////Decryption of password//////////////////
        NSString *PassfrmHex = [hexPass stringFromHex:hexPass];
        NSLog(@"StringValue : %@",PassfrmHex);
        NSData *nsdataFromBase64String1 = [[NSData alloc]initWithBase64EncodedString:base64Encoded1 options:0];
        plain1 = [nsdataFromBase64String1 AES128DecryptedDataWithKey:koyy];
        //      plain = [cipher AES128DecryptedDataWithKey:key];
        printf("%s\n", [[plain1 description] UTF8String]);
        NSString *base64Decoded1 = [[NSString alloc]initWithData:plain1 encoding:NSUTF8StringEncoding];
        NSLog(@"Decoded: %@", base64Decoded1);
        
        ///////////////Encryption of first name//////////////
        NSData *plain2 = [tf1.text dataUsingEncoding:NSUTF8StringEncoding];
        NSData *cipher2 = [plain2 AES128EncryptedDataWithKey:koyy];
        printf("%s\n", [[cipher2 description] UTF8String]);
        NSString *base64Encoded2 = [cipher2 base64EncodedStringWithOptions:0];
        NSLog(@"Encoded: %@",base64Encoded2);
        NSString *hexUsername2 = [base64Encoded2 stringToHex:base64Encoded2];
        NSLog(@"HexValue : %@",hexUsername2);
        NSString *UserfrmHex2 = [hexUsername2 stringFromHex:hexUsername2];
        NSLog(@"StringValue : %@",UserfrmHex2);
        
        
        ////////////////////Encryption of email////////////////////
        NSData *plain4 = [tf4.text dataUsingEncoding:NSUTF8StringEncoding];
        NSData *cipher4 = [plain4 AES128EncryptedDataWithKey:koyy];
        printf("%s\n", [[cipher4 description] UTF8String]);
        NSString *base64Encoded4 = [cipher4 base64EncodedStringWithOptions:0];
        NSLog(@"Encoded: %@",base64Encoded4);
        NSString *hexUsername4 = [base64Encoded4 stringToHex:base64Encoded4];
        NSLog(@"HexValue : %@",hexUsername4);
        NSString *UserfrmHex4 = [hexUsername4 stringFromHex:hexUsername4];
        NSLog(@"StringValue : %@",UserfrmHex4);
       ////////////////////////////////////////////////////////////////////
        
        
        NSString *post = [NSString stringWithFormat:@"username=%@&password=%@&firstname=%@&email=%@",hexUsername,hexPass,hexUsername2,hexUsername4];
        NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
        NSString *postLength = [NSString stringWithFormat:@"%lu",(unsigned long)[postData length]];
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
        [request setURL:[NSURL URLWithString:@"https://mobiglobe.com/vibgyor_4700/billing_user_edit/edit_user_details.php"]];
        [request setHTTPMethod:@"POST"];
        [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
        [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        [request setHTTPBody:postData];
        
        
//        NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
//        if(conn) {
//            NSLog(@"Connection Successful");
//        } else {
//            NSLog(@"Connection could not be made");
//        }

        
        NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
        [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            NSString *requestReply = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
            NSLog(@"requestReply: %@", requestReply);
            if(data==nil||[data isEqual:@""])
            {
            dispatch_async(dispatch_get_main_queue(), ^(void){
                
                UIAlertView *alrt = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Please check your internet connection." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                [alrt show];
                
            });
            }
            else
            {
            if(requestReply!=nil)
            {
                
                NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                NSLog(@"%@",json);
                if(json!=nil)
                {
                    dispatch_async(dispatch_get_main_queue(), ^(void){
                    NSLog(@"%@",[json objectForKey:@"result"]); //this is table column name
                    NSLog(@"%@",[json objectForKey:@"msg"]);
                    
                    NSString *messag = [json objectForKey:@"msg"];
                
                    UIAlertView *popup = [[UIAlertView alloc]initWithTitle:@"Status" message:messag delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                        
                    [popup show];
                        });
                }
                else
                {
                    
                }
            }
            else
            {
                dispatch_async(dispatch_get_main_queue(), ^(void){
                    
                    UIAlertView *alrt = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"No response." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    [alrt show];
                    
                });
 
            }
            }
          
        }] resume];
        
        
        
    }

}


-(void)remove{
    
    [self dismissViewControllerAnimated:NO completion:Nil];
    
}



- (void)keyboardDidShow:(NSNotification *)notification
{
    //Assign new frame to your view
    
    [ self.view setFrame:CGRectMake(0,-90,320,460)]; //here taken -20 for example i.e. your view will be scrolled to -20. change its value according to your requirement.
    
}

-(void)keyboardDidHide:(NSNotification *)notification
{
    [self.view  setFrame:CGRectMake(0,0,320,460)];
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
   
    [tf1 resignFirstResponder];
    [tf2 resignFirstResponder];
    [tf3 resignFirstResponder];
    [tf4 resignFirstResponder];
    [tf5 resignFirstResponder];
    return YES;
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    // Here You can do additional code or task instead of writing with keyboard
    return YES;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
