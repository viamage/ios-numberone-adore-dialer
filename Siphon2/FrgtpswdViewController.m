//
//  FrgtpswdViewController.m
//  Siphon
//
//  Created by Issac Newton on 19/04/17.
//
//

#import "FrgtpswdViewController.h"
#import "AccountViewController.h"
#import "PhoneViewController.h"

NSString *forgKey= @"hdjdtie36457jdit";


@implementation FrgtpswdViewController

@synthesize sndLabel;
@synthesize  sndbutton;
@synthesize bckLabel;
@synthesize bckbutton;
@synthesize numtf;

-(id)init
{
  [super init];
  if(self)
  {

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



  UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(10.0f, 90.0f, 295.0f, 75.0f)];//320
  img.image= [UIImage imageNamed:@"lcd_top.png"];
  [self.view addSubview:img];

  numtf = [[UITextField alloc] initWithFrame:CGRectMake(25, 212, 276, 40)];
  numtf.textColor= [UIColor blackColor];
  numtf.backgroundColor= [UIColor clearColor];
  numtf.borderStyle = UITextBorderStyleRoundedRect;
  numtf.font = [UIFont systemFontOfSize:15];
  numtf.placeholder=@"Enter Your Mobile Number Please";
  numtf.textAlignment=NSTextAlignmentCenter;

  numtf.layer.borderColor= [[UIColor colorWithRed:0.71 green:0.09 blue:0.10 alpha:1.0]CGColor];
  numtf.layer.borderWidth=1.0f;
  numtf.layer.cornerRadius=6.0f;
  numtf.autocorrectionType = UITextAutocorrectionTypeNo;
  numtf.keyboardType = UIKeyboardTypeDefault;
  numtf.returnKeyType = UIReturnKeyDone;

  if (self.numtf.placeholder != nil)
  {
    self.numtf.clearsOnBeginEditing = NO;
  }
  numtf.delegate = self;
  [numtf resignFirstResponder];
  [self.view addSubview:numtf];

  sndbutton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  sndbutton.frame= CGRectMake(25, 282, 110, 40);//320,y=500//490

  sndbutton.layer.cornerRadius=18;
  sndbutton.clipsToBounds= YES;
  sndbutton.layer.borderColor=[UIColor colorWithRed:0.71 green:0.09 blue:0.10 alpha:1.0].CGColor;
  sndbutton.layer.borderWidth=0.0f;
  sndbutton.backgroundColor= [UIColor colorWithRed:0.71 green:0.09 blue:0.10 alpha:1.0];
  [sndbutton setTitle:@"Send" forState:UIControlStateNormal];
  [sndbutton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
  [sndbutton.titleLabel setFont:[UIFont systemFontOfSize:20.0]];
 [sndbutton addTarget:self action:@selector(sendnumber) forControlEvents:UIControlEventTouchUpInside];
  //[sndbutton addTarget:app action:@selector(sipConnect) forControlEvents:UIControlEventTouchUpInside];
  // [savebutton setBackgroundImage:[UIImage imageNamed:@"save.png"] forState:UIControlStateNormal];
  [self.view addSubview:sndbutton];

  bckbutton =[UIButton buttonWithType:UIButtonTypeRoundedRect];
  bckbutton.frame=CGRectMake(183, 282, 110, 40);
  bckbutton.layer.cornerRadius=18;
  bckbutton.clipsToBounds= YES;
  bckbutton.layer.borderColor=[UIColor colorWithRed:0.71 green:0.09 blue:0.10 alpha:1.0].CGColor;
  bckbutton.layer.borderWidth=0.0f;
  bckbutton.backgroundColor= [UIColor colorWithRed:0.71 green:0.09 blue:0.10 alpha:1.0];
  [bckbutton setTitle:@"Back" forState:UIControlStateNormal];
  [bckbutton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
  [bckbutton.titleLabel setFont:[UIFont systemFontOfSize:20.0]];

  [bckbutton addTarget:self action:@selector(backFun) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:bckbutton];



}

- (void)backgroundTap
{
  // resign the first responder of all your textfields
  [numtf resignFirstResponder];

}


-(void)sendnumber
{

  if ([numtf.text isEqual:@""]) {

    UIAlertView *alrt = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Please enter mobile number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];

    [alrt show];
  }
  else{

    NSData *plain = [numtf.text dataUsingEncoding:NSUTF8StringEncoding];
    NSData *cipher = [plain AES128EncryptedDataWithKey:forgKey];
    printf("%s\n", [[cipher description] UTF8String]);
    NSString *base64Encoded = [cipher base64EncodedStringWithOptions:0];
    NSLog(@"Encoded: %@",base64Encoded);
    NSString *hexphone = [base64Encoded stringToHex:base64Encoded];
    NSLog(@"HexValue : %@",hexphone);
    NSString *UserfrmHex = [hexphone stringFromHex:hexphone];
    NSLog(@"StringValue : %@",UserfrmHex);

    NSData *nsdataFromBase64String = [[NSData alloc]initWithBase64EncodedString:base64Encoded options:0];
    plain = [nsdataFromBase64String AES128DecryptedDataWithKey:forgKey];
    printf("%s\n", [[plain description] UTF8String]);
    NSString *base64Decoded = [[NSString alloc]initWithData:plain encoding:NSUTF8StringEncoding];
    NSLog(@"Decoded: %@", base64Decoded);


    NSString *post = [NSString stringWithFormat:@"phone=%@",hexphone];
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%lu",(unsigned long)[postData length]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
      [request setURL:[NSURL URLWithString:@"https://mobiglobe.com/vibgyor_4700/billing_forget/billing_forget_password.php"]];
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

                        if ([rslt isEqualToString:@"success"]) {

                            UIAlertView *alrt = [[UIAlertView alloc]initWithTitle:@"Status" message:mesge delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];

                            [alrt show];
                            NSUserDefaults *userDef = [NSUserDefaults standardUserDefaults];
                            [userDef setObject:[NSString stringWithFormat:@"%@",numtf.text] forKey:@"username"];
                            [userDef synchronize];

                            [self dismissViewControllerAnimated:NO completion:Nil];
                        }
                        else{

                            UIAlertView *alrt = [[UIAlertView alloc]initWithTitle:@"Alert" message:mesge delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];

                            [alrt show];
                        }

                    });

                }

                else{

                }

            }
            else{
          
                dispatch_async(dispatch_get_main_queue(), ^(void){
              
                    UIAlertView *alrt = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"No Response." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
              
                    [alrt show];
              
                });

            }
        }
    }]resume];

  }
}

-(void)backFun
{
  [self dismissViewControllerAnimated:NO completion:nil];
}
- (void)keyboardDidShow:(NSNotification *)notification
{
    //Assign new frame to your view
    
    [self.view setFrame:CGRectMake(0,-90,320,460)]; //here taken -20 for example i.e. your view will be scrolled to -20. change its value according to your requirement.
    
}

-(void)keyboardDidHide:(NSNotification *)notification
{
    [self.view  setFrame:CGRectMake(0,0,320,460)];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [numtf resignFirstResponder];
    
    return YES;
}

@end
