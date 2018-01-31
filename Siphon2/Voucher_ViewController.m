//
//  Voucher_ViewController.m
//  VS-VoIP
//
//  Created by ADORE INFOTECH on 20/02/17.
//
//

#import "Voucher_ViewController.h"
#import "MoreViewController.h"
#import "NSData+AES.h"
#import "NSString+hex.h"

NSString *kkeyy= @"hdjdtie36457jdit";

@interface Voucher_ViewController ()

@end

@implementation Voucher_ViewController

@synthesize txtvoucher;
@synthesize lblvoucher;
@synthesize submit;
@synthesize back;



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
  //txtvoucher.delegate = self;
    txtvoucher.layer.borderWidth = 1.0f;
    txtvoucher.layer.borderColor= [[UIColor colorWithRed:0.71 green:0.09 blue:0.10 alpha:1.0]CGColor];
    txtvoucher.layer.cornerRadius = 6.0;
    
    submit.layer.borderWidth=0.0f;
    submit.layer.cornerRadius = 18;
    back.layer.cornerRadius = 0.0f;
    back.layer.cornerRadius = 18;
    
    [txtvoucher resignFirstResponder];
    self.tabBarController.tabBar.hidden=YES;
    UITapGestureRecognizer* tapBackground = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard:)];
    [tapBackground setNumberOfTapsRequired:1];
    [self.view addGestureRecognizer:tapBackground];

    
    
}


-(void) dismissKeyboard:(id)sender
{
    [self.view endEditing:YES];
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

- (void)dealloc {
    [_logo release];
    [lblvoucher release];
    [txtvoucher release];
    [txtvoucher release];
    [submit release];
    [back release];
    [super dealloc];
}
- (IBAction)submit:(id)sender {



    if ([txtvoucher.text isEqual:@""]) {
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Please enter voucher number." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
    }
    
    else
    {
    
    
    NSString *abc= [[NSUserDefaults standardUserDefaults] stringForKey:@"username"];
    NSString *abc1= [[NSUserDefaults standardUserDefaults] stringForKey:@"password"];
    
    if(abc!=nil)
    {
        /////////////Encryption of username///////////////////
        NSData *plain = [abc dataUsingEncoding:NSUTF8StringEncoding];
        NSData *cipher = [plain AES128EncryptedDataWithKey:kkeyy];
        printf("%s\n", [[cipher description] UTF8String]);
        NSString *base64Encoded = [cipher base64EncodedStringWithOptions:0];
        NSLog(@"Encoded: %@",base64Encoded);
        NSString *hexUsername = [base64Encoded stringToHex:base64Encoded];
        NSLog(@"HexValue : %@",hexUsername);
        NSString *UserfrmHex = [hexUsername stringFromHex:hexUsername];
        NSLog(@"StringValue : %@",UserfrmHex);
        
        ////////////////Encryption of password//////////////////
        NSData *plain1 = [abc1 dataUsingEncoding:NSUTF8StringEncoding];
        NSData *cipher1 = [plain1 AES128EncryptedDataWithKey:kkeyy];
        printf("%s\n", [[cipher1 description] UTF8String]);
        NSString *base64Encoded1 = [cipher1 base64EncodedStringWithOptions:0];
        NSLog(@"Encoded: %@",base64Encoded1);
        NSString *hexPass = [base64Encoded1 stringToHex:base64Encoded1];
        NSLog(@"HexValue : %@",hexPass);
        NSString *PassfrmHex = [hexPass stringFromHex:hexPass];
        NSLog(@"StringValue : %@",PassfrmHex);
        
        ///////////////Encryption of txtvoucher.text////////////
        NSData *plain0 = [txtvoucher.text dataUsingEncoding:NSUTF8StringEncoding];
        NSData *cipher0 = [plain0 AES128EncryptedDataWithKey:kkeyy];
        printf("%s\n", [[cipher0 description] UTF8String]);
        NSString *base64Encoded0 = [cipher0 base64EncodedStringWithOptions:0];
        NSLog(@"Encoded: %@",base64Encoded0);
        NSString *hexUsername0 = [base64Encoded0 stringToHex:base64Encoded0];
        NSLog(@"HexValue : %@",hexUsername0);
        NSString *UserfrmHex0 = [hexUsername0 stringFromHex:hexUsername0];
        NSLog(@"StringValue : %@",UserfrmHex0);
        //////////////////////////////////////////////////////////
        
        
        NSString *post = [NSString stringWithFormat:@"username=%@&password=%@&voucher=%@",hexUsername,hexPass,hexUsername0];
        NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
        NSString *postLength = [NSString stringWithFormat:@"%lu",(unsigned long)[postData length]];
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
        [request setURL:[NSURL URLWithString:@"https://mobiglobe.com/vibgyor_4700/billing_voucher_recharge/refill_dialer_voucher.php"]];
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
                        
                    NSString *result = [json objectForKey:@"result"];
                    NSString *messag =[json objectForKey:@"msg"];
                    NSLog(@"%@",result);
                    NSLog(@"%@",messag);
                    
                    if([result isEqual:@"success"])
                    {
                        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Status" message:messag delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                        
                        [alert show];
                    }
                    else
                    {
                        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:messag delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                        
                        [alert show];
                    }
                    
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
    
}

- (IBAction)back:(id)sender {
    
    [self dismissViewControllerAnimated:NO completion:Nil];
    
}
- (void)keyboardDidShow:(NSNotification *)notification
{
    //Assign new frame to your view
    
    [self.view setFrame:CGRectMake(0,-90,320,460)]; //here taken -20 for example i.e. your view will be scrolled to -20. change its value according to your requirement.
    
}


-(void)keyboardDidHide:(NSNotification *)notification
{
    [self.view setFrame:CGRectMake(0,0,320,460)];
}

/*RETURN VALUE FROM KEYBOARD WHEN DONE OR RETURN BUTTON IS PRESSED*/
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [txtvoucher resignFirstResponder];
    return YES;
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range     replacementString:(NSString *)string
{
    
        if (txtvoucher.text.length >=20 && range.length == 0)
        {
            return NO;
        }
        else
            return YES;
}

@end
