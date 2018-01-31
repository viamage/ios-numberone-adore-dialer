//
//  newUserViewController.m
//  Siphon
//
//  Created by Issac Newton on 18/04/17.
//
//

#import "newUserViewController.h"
#import "AccountViewController.h"
//NSString *kkeeyy= @"hdjdtie36457jdit";


@implementation newUserViewController

@synthesize alpinlabel;
@synthesize signLabel;
@synthesize signbutton;
@synthesize alpinbutton;
@synthesize entrtf;

-(id)init{
  self = [super init];
  if (self) {


  }
  return self;


}
-(void)viewDidLoad
{
  [super viewDidLoad];

  UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backgroundTap)];
  gestureRecognizer.cancelsTouchesInView = NO;
  [self.view addGestureRecognizer:gestureRecognizer];
  [gestureRecognizer release];


  entrtf = [[UITextField alloc] initWithFrame:CGRectMake(25, 212, 276, 40)];
  entrtf.textColor= [UIColor blackColor];
  entrtf.backgroundColor= [UIColor clearColor];
  entrtf.borderStyle = UITextBorderStyleRoundedRect;
  entrtf.font = [UIFont systemFontOfSize:15];
  entrtf.placeholder=@"Enter Mobile Number With Country Code";
  entrtf.textAlignment=NSTextAlignmentCenter;

  entrtf.layer.borderColor= [[UIColor colorWithRed:0.71 green:0.09 blue:0.10 alpha:1.0]CGColor];
  entrtf.layer.borderWidth=1.0f;
  entrtf.layer.cornerRadius=6.0f;
  entrtf.autocorrectionType = UITextAutocorrectionTypeNo;
  entrtf.keyboardType = UIKeyboardTypeDefault;
  entrtf.returnKeyType = UIReturnKeyDone;

  if (self.entrtf.placeholder != nil)
  {
    self.entrtf.clearsOnBeginEditing = NO;
  }
  entrtf.delegate = self;
  [entrtf resignFirstResponder];
  [self.view addSubview:entrtf];


  signbutton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  signbutton.frame= CGRectMake(100, 306, 110, 40);//320,y=500//490
  signbutton.layer.cornerRadius=18;
  signbutton.clipsToBounds= YES;
  signbutton.layer.borderColor=[UIColor colorWithRed:0.71 green:0.09 blue:0.10 alpha:1.0].CGColor;
  signbutton.layer.borderWidth=0.0f;
  signbutton.backgroundColor= [UIColor colorWithRed:0.71 green:0.09 blue:0.10 alpha:1.0];
  [signbutton setTitle:@"Sign up" forState:UIControlStateNormal];
  [signbutton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
  [signbutton.titleLabel setFont:[UIFont systemFontOfSize:20.0]];
  [signbutton addTarget:self action:@selector(go) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:signbutton];

  alpinbutton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  alpinbutton.frame= CGRectMake(25, 446, 266, 40);//320,y=500//490
  //
  alpinbutton.layer.cornerRadius=18;
  alpinbutton.clipsToBounds= YES;
  alpinbutton.layer.borderColor=[UIColor colorWithRed:0.71 green:0.09 blue:0.10 alpha:1.0].CGColor;
  alpinbutton.layer.borderWidth=0.0f;
  alpinbutton.backgroundColor= [UIColor colorWithRed:0.71 green:0.09 blue:0.10 alpha:1.0];
  [alpinbutton setTitle:@"Already have a PIN" forState:UIControlStateNormal];
  [alpinbutton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
  [alpinbutton.titleLabel setFont:[UIFont systemFontOfSize:20.0]];
  [alpinbutton addTarget:self action:@selector(logintoo) forControlEvents:UIControlEventTouchUpInside];
 [self.view addSubview:alpinbutton];

  UIImageView *imgvw = [[UIImageView alloc] initWithFrame:CGRectMake(10.0f, 90.0f, 295.0f, 75.0f)];//320
  imgvw.image= [UIImage imageNamed:@"lcd_top.png"];
  [self.view addSubview:imgvw];

}

- (void)backgroundTap
{
  // resign the first responder of all your textfields
  [entrtf resignFirstResponder];

}


-(void)logintoo
{
  [self dismissViewControllerAnimated:NO completion:nil];
}

-(NSString *)URLEncodeString:(NSString *)str
{
    NSMutableString *temstr = [NSMutableString stringWithString:str];
    [temstr replaceOccurrencesOfString:@" " withString:@"+" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [temstr length])];
    return  [[NSString stringWithFormat:@"%@",temstr]stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding];
}
- (void)go {


  if ([entrtf.text isEqual:@""]) {

    UIAlertView *alrt = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Please enter mobile number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];


    [alrt show];
  }
    else
    {
        NSString *stringurl = [NSString stringWithFormat:@",http://billing.adoreinfotech.co.in/web/user_registration_florin.php?phone=%@",entrtf.text];
        NSString *absoluteStr = [NSString string];
        absoluteStr = [self URLEncodeString:stringurl];
        NSURL *urlStr = [NSURL URLWithString:absoluteStr];
        NSURLRequest *requestStr = [NSURLRequest requestWithURL:urlStr];
        NSData *data1 = [NSURLConnection sendSynchronousRequest:requestStr returningResponse:nil error:nil];
        if(data1!=nil)
        {
            NSError *error;
            NSDictionary *json1 = [NSJSONSerialization JSONObjectWithData:data1 options:kNilOptions error:&error];
            if(json1!=nil||![json1 isEqual:@""])
            {
                NSString *status = [json1 objectForKey:@"result"];
                if([status isEqual:@"success"])
                {
                    NSString *msg = [json1 objectForKey:@"msg"];
                    if([msg isEqual:@"You are registered successfully. "])
                    {
                        NSDictionary *userinfo = [json1 objectForKey:@"userinfo"];
                        NSString *username = [userinfo objectForKey:@"username"];
                        NSString *password = [userinfo objectForKey:@"uipass"];
                        
                        NSUserDefaults *usrdef = [NSUserDefaults standardUserDefaults];
                        [usrdef setObject:[NSString stringWithFormat:@"%@",username] forKey:@"username"];
                        [usrdef setObject:[NSString stringWithFormat:@"%@",password] forKey:@"password"];
                        [usrdef synchronize];
                        
                    }
                    else
                    {
                        UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"Alert" message:msg preferredStyle:UIAlertControllerStyleAlert];
                        
                        UIAlertAction *alertaction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){NSLog(@"Alert Action Tabbed.");}];
                        
                        [controller addAction:alertaction];
                        [self presentViewController:controller animated:YES completion:nil];
                    }
                }
                else
                {
                    NSString *msg = [json1 objectForKey:@"msg"];
                    UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"Alert" message:msg preferredStyle:UIAlertControllerStyleAlert];
                    
                    UIAlertAction *alertaction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){NSLog(@"Alert Action Tabbed.");}];
                    
                    [controller addAction:alertaction];
                    [self presentViewController:controller animated:YES completion:nil];
                }
            }
            else
            {
                UIAlertController *contrlr1 = [UIAlertController alertControllerWithTitle:@"Alert" message:@"No Response." preferredStyle:UIAlertControllerStyleAlert];
                
                UIAlertAction *alrtcnt = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){NSLog(@"Alert Action tabbed.");}];
                
                [contrlr1 addAction:alrtcnt];
                [self presentViewController:contrlr1 animated:YES completion:nil];
            }
        }
        else
        {
            UIAlertController *contrlr1 = [UIAlertController alertControllerWithTitle:@"Alert" message:@"Please check your internet connection." preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *alrtcnt = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){NSLog(@"Alert Action tabbed.");}];
            
            [contrlr1 addAction:alrtcnt];
            [self presentViewController:contrlr1 animated:YES completion:nil];
        }
    }
/*  else{


    NSData *plain = [entrtf.text dataUsingEncoding:NSUTF8StringEncoding];
    NSData *cipher = [plain AES128EncryptedDataWithKey:kkeeyy];
    printf("%s\n", [[cipher description] UTF8String]);
    NSString *base64Encoded = [cipher base64EncodedStringWithOptions:0];
    NSLog(@"Encoded: %@",base64Encoded);
    NSString *hexphone = [base64Encoded stringToHex:base64Encoded];
    NSLog(@"HexValue : %@",hexphone);
    NSString *UserfrmHex = [hexphone stringFromHex:hexphone];
    NSLog(@"StringValue : %@",UserfrmHex);

    NSData *nsdataFromBase64String = [[NSData alloc]initWithBase64EncodedString:base64Encoded options:0];
    plain = [nsdataFromBase64String AES128DecryptedDataWithKey:kkeeyy];
    printf("%s\n", [[plain description] UTF8String]);
    NSString *base64Decoded = [[NSString alloc]initWithData:plain encoding:NSUTF8StringEncoding];
    NSLog(@"Decoded: %@", base64Decoded);



    NSString *post = [NSString stringWithFormat:@"phone=%@",hexphone];
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%lu",(unsigned long)[postData length]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
      [request setURL:[NSURL URLWithString:@"https://mobiglobe.com/vibgyor_4700/billing_registration/send_reg_phone_twilio.php"]];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];



    //    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    //    if(conn) {
    //        NSLog(@"Connection Successful");
    //    } else {
    //        NSLog(@"Connection could not be made");
    //    }

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
              
                        NSString *rslt = [json objectForKey:@"result"];
                        NSString *mesge = [json objectForKey:@"msg"];
              
                        if ([rslt isEqualToString:@"success"])
                        {
                            UIAlertView *alrt = [[UIAlertView alloc]initWithTitle:@"Status" message:mesge delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];

                            [alrt show];
                            NSUserDefaults *userDef = [NSUserDefaults standardUserDefaults];
                            [userDef setObject:[NSString stringWithFormat:@"%@",entrtf.text] forKey:@"username"];
                            [userDef synchronize];
                            [self dismissViewControllerAnimated:NO completion:Nil];
                        }
                        else
                        {
                            UIAlertView *alrt = [[UIAlertView alloc]initWithTitle:@"Alert" message:mesge delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                  
                            [alrt show];
 
                        }

                    });

                }

                else{

                }

        // [self dismissViewControllerAnimated:NO completion:Nil];

            }
            else
            {
                dispatch_async(dispatch_get_main_queue(), ^(void){
              
                    UIAlertView *alrt = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"No Response." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
              
                    [alrt show];

                });
            }
        }
    }]resume];

  }  */

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
    [entrtf resignFirstResponder];
    return YES;
}

-(void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}


@end
