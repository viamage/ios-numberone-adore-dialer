//
//  BalnaceTransferViewController.m
//  Siphon
//
//  Created by mac on 24/04/17.
//
//

#import "BalnaceTransferViewController.h"
#import "NSData+AES.h"
#import "NSString+hex.h"

NSString *trsfrKey = @"hdjdtie36457jdit";

@interface BalnaceTransferViewController ()

@end

@implementation BalnaceTransferViewController
@synthesize phnTxt;
@synthesize amntTxt;
- (void)viewDidLoad {
    [super viewDidLoad];
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backgroundTap)];
    gestureRecognizer.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:gestureRecognizer];
    [gestureRecognizer release];
    
    phnTxt.delegate = self;
    amntTxt.delegate = self;
    
    phnTxt.layer.borderWidth = 1.0f;
    phnTxt.layer.cornerRadius = 6.0f;
    phnTxt.layer.borderColor = [[UIColor colorWithRed:0.71 green:0.09 blue:0.10 alpha:1.0]CGColor];
    
    amntTxt .layer.borderWidth = 1.0f;
    amntTxt.layer.cornerRadius = 6.0f;
    amntTxt.layer.borderColor = [[UIColor colorWithRed:0.71 green:0.09 blue:0.10 alpha:1.0]CGColor];
    
    sendBtn.layer.borderWidth = 0.0f;
    sendBtn.layer.cornerRadius = 18.0f;
    
    backBtn.layer.borderWidth = 0.0f;
    backBtn.layer.cornerRadius = 18.0f;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
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
    [phnTxt release];
    [amntTxt release];
    [sendBtn release];
    [backBtn release];
    [super dealloc];
}
- (IBAction)SendBtnAction:(id)sender {
    NSString *abc1= [[NSUserDefaults standardUserDefaults] stringForKey:@"username"];
    NSString *abc2= [[NSUserDefaults standardUserDefaults] stringForKey:@"password"];
    
    if (phnTxt.text.length==0) {
        
        UIAlertController *controller1 = [UIAlertController alertControllerWithTitle:@"Alert"
                                                                             message:@"Please enter user name."
                                                                      preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *alertAction1 = [UIAlertAction actionWithTitle:@"Cancel"
                                                               style:UIAlertActionStyleDefault
                                                             handler:^(UIAlertAction *action) {
                                                                 NSLog(@"Dismiss button tapped!");
                                                             }];
        
        [controller1 addAction:alertAction1];
        
        [self presentViewController:controller1 animated:YES completion:nil];
    }
    else if(amntTxt.text.length==0)
    {
        UIAlertController *controller1 = [UIAlertController alertControllerWithTitle:@"Alert"
                                                                             message:@"Please enter transfer amount."
                                                                      preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *alertAction1 = [UIAlertAction actionWithTitle:@"Cancel"
                                                               style:UIAlertActionStyleDefault
                                                             handler:^(UIAlertAction *action) {
                                                                 NSLog(@"Dismiss button tapped!");
                                                             }];
        
        [controller1 addAction:alertAction1];
        
        [self presentViewController:controller1 animated:YES completion:nil];
    }
    else
    {
        /////////////////////////Encryptin Of UserName/////////////////////////////////////////////////////
        NSData *plain3 = [abc1 dataUsingEncoding:NSUTF8StringEncoding];
        NSData *cipher3 = [plain3 AES128EncryptedDataWithKey:trsfrKey];
        printf("%s\n",[[cipher3 description]UTF8String]);
        NSString *base64Encoded3 = [cipher3 base64EncodedStringWithOptions:0];
        NSLog(@"Encoded Code: %@",base64Encoded3);
        NSString *hexUser = [base64Encoded3 stringToHex:base64Encoded3];
        NSLog(@"HexValue of Code:%@",hexUser);
        ///////////////////////Decryption of UserName /////////////////////////////////////////////////////
        NSData *nsdataFromBase64String3 = [[NSData alloc]initWithBase64EncodedString:base64Encoded3 options:0];
        plain3 = [nsdataFromBase64String3 AES128DecryptedDataWithKey:trsfrKey];
        //      plain = [cipher AES128DecryptedDataWithKey:key];
        printf("%s\n", [[plain3 description] UTF8String]);
        NSString *base64Decoded3 = [[NSString alloc]initWithData:plain3 encoding:NSUTF8StringEncoding];
        NSLog(@"Decoded: %@", base64Decoded3);
        ///////////////////////////////////////////////////////////////////////////////////
        ////////////////////////ENCRYPTION FOR PASSWORD//////////////////////////////////////
        NSData *plain1 = [abc2 dataUsingEncoding:NSUTF8StringEncoding];
        NSData *cipher1 = [plain1 AES128EncryptedDataWithKey:trsfrKey];
        printf("%s\n", [[cipher1 description] UTF8String]);
        NSString *base64Encoded1 = [cipher1 base64EncodedStringWithOptions:0];
        NSLog(@"Encoded: %@",base64Encoded1);
        NSString *hexPass = [base64Encoded1 stringToHex:base64Encoded1];
        NSLog(@"HexValue : %@",hexPass);
        
        NSString *PassfrmHex = [hexPass stringFromHex:hexPass];
        NSLog(@"StringValue : %@",PassfrmHex);
        
        ///////////////////////////////////////////////////////////////////////////////////
        ///////////////////DECRYPTION FOR PASSWORD////////////////////////////////////////
        NSData *nsdataFromBase64String1 = [[NSData alloc]initWithBase64EncodedString:base64Encoded1 options:0];
        plain1 = [nsdataFromBase64String1 AES128DecryptedDataWithKey:trsfrKey];
        //      plain = [cipher AES128DecryptedDataWithKey:key];
        printf("%s\n", [[plain1 description] UTF8String]);
        NSString *base64Decoded1 = [[NSString alloc]initWithData:plain1 encoding:NSUTF8StringEncoding];
        NSLog(@"Decoded: %@", base64Decoded1);
        //   printf("%s\n", [[[NSString alloc] initWithData:plain encoding:NSUTF8StringEncoding] UTF8String]);
        //////////////////////////////////////////////////////////////////////////////
        /////////////////////////Encryptin Of Account Number///////////////////////////////////////
        NSData *plain4 = [phnTxt.text dataUsingEncoding:NSUTF8StringEncoding];
        NSData *cipher4 = [plain4 AES128EncryptedDataWithKey:trsfrKey];
        printf("%s\n",[[cipher4 description]UTF8String]);
        NSString *base64Encoded4 = [cipher4 base64EncodedStringWithOptions:0];
        NSLog(@"Encoded Code: %@",base64Encoded4);
        NSString *hexAccnt = [base64Encoded4 stringToHex:base64Encoded4];
        NSLog(@"HexValue of Code:%@",hexAccnt);
        ///////////////////////Decryption of Account Number /////////////////////////////////////////////
        NSData *nsdataFromBase64String4 = [[NSData alloc]initWithBase64EncodedString:base64Encoded4 options:0];
        plain4 = [nsdataFromBase64String4 AES128DecryptedDataWithKey:trsfrKey];
        //      plain = [cipher AES128DecryptedDataWithKey:key];
        printf("%s\n", [[plain4 description] UTF8String]);
        NSString *base64Decoded4 = [[NSString alloc]initWithData:plain4 encoding:NSUTF8StringEncoding];
        NSLog(@"Decoded: %@", base64Decoded4);
        //////////////////////////////////////////////////////////////////////////////
        /////////////////////////Encryptin Of Amount///////////////////////////////////////
        NSData *plain5 = [amntTxt.text dataUsingEncoding:NSUTF8StringEncoding];
        NSData *cipher5 = [plain5 AES128EncryptedDataWithKey:trsfrKey];
        printf("%s\n",[[cipher5 description]UTF8String]);
        NSString *base64Encoded5 = [cipher5 base64EncodedStringWithOptions:0];
        NSLog(@"Encoded Code: %@",base64Encoded5);
        NSString *hexAmnt = [base64Encoded5 stringToHex:base64Encoded5];
        NSLog(@"HexValue of Code:%@",hexAmnt);
        ///////////////////////Decryption of Amount /////////////////////////////////////////////
        NSData *nsdataFromBase64String5 = [[NSData alloc]initWithBase64EncodedString:base64Encoded5 options:0];
        plain5 = [nsdataFromBase64String5 AES128DecryptedDataWithKey:trsfrKey];
        //      plain = [cipher AES128DecryptedDataWithKey:key];
        printf("%s\n", [[plain5 description] UTF8String]);
        NSString *base64Decoded5 = [[NSString alloc]initWithData:plain5 encoding:NSUTF8StringEncoding];
        NSLog(@"Decoded: %@", base64Decoded5);
        //////////////////////////////////////////////////////////////////////////////
        
        NSString *post3 = [NSString stringWithFormat:@"cust_id=%@&cust_pass=%@&transferaccount=%@&credit=%@",hexUser,hexPass,hexAccnt,hexAmnt];
        NSData *postData3 = [post3 dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
        NSString *postLength3 = [NSString stringWithFormat:@"%lu",(unsigned long)[postData3 length]];
        NSMutableURLRequest *request3 = [[NSMutableURLRequest alloc] init];
        [request3 setURL:[NSURL URLWithString:@"https://mobiglobe.com/vibgyor_4700/billing_balance_transfer_balance/balance_transfer.php"]];
        [request3 setHTTPMethod:@"POST"];
        [request3 setValue:postLength3 forHTTPHeaderField:@"Content-Length"];
        [request3 setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        [request3 setHTTPBody:postData3];
        
        ////////////////////////////////////////////////////////////////////////////////
        
        NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
        [[session dataTaskWithRequest:request3 completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            NSString *requestReply = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
            NSLog(@"requestReply: %@", requestReply);
            
            if(data==nil)
            {
                dispatch_async(dispatch_get_main_queue(), ^{
                    UIAlertView *alert78 = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Please Make sure you have a Working Internet Connection."delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles: Nil];
                    
                    [alert78 show];
                });
            }
            else
            {
                if(requestReply!=nil||![requestReply isEqual:@""])
                {
                    NSError *error;
                    
                    NSDictionary *json3 = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
                    NSLog(@"%@",json3);
                    
                    if(json3!=nil)
                    {
                        
                        if([[json3 objectForKey:@"result"] isEqual:@"success"])
                        {
                            NSString *data13 = [json3 objectForKey:@"msg"];
                            dispatch_async(dispatch_get_main_queue(), ^{
                                
                                UIAlertController *controller4 = [UIAlertController alertControllerWithTitle:@"Status" message:data13 preferredStyle:UIAlertControllerStyleAlert];
                                UIAlertAction *alertAction4 = [UIAlertAction actionWithTitle:@"OK"style:UIAlertActionStyleDefault
                                                                                     handler:^(UIAlertAction *action) {
                                                                                         phnTxt.text=@"";
                                                                                         amntTxt.text=@"";
                                                                                         [self dismissViewControllerAnimated:NO completion:nil];
                                                                                     }];
                                
                                [controller4 addAction:alertAction4];
                                
                                [self presentViewController:controller4 animated:YES completion:nil];
                                
                                
                            });
                        }
                        
                        else
                        {
                            NSString *data13  = [json3 objectForKey:@"msg"];
                            
                            dispatch_async(dispatch_get_main_queue(), ^{
                                
                                UIAlertController *controller4 = [UIAlertController alertControllerWithTitle:@"Alert" message:data13 preferredStyle:UIAlertControllerStyleAlert];
                                UIAlertAction *alertAction4 = [UIAlertAction actionWithTitle:@"OK"style:UIAlertActionStyleDefault
                                                                                     handler:^(UIAlertAction *action) {
                                                                                         NSLog(@"Dismiss button tapped!");
                                                                                     }];
                                
                                [controller4 addAction:alertAction4];
                                
                                [self presentViewController:controller4 animated:YES completion:nil];
                            });
                            
                            
                        }
                    }
                    else
                    {
                        
                    }
                }
                else
                {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        UIAlertView *alert78 = [[UIAlertView alloc]initWithTitle:@"Alert"
                                                                         message:@"Please Make sure you have a Working Internet Connection."
                                                                        delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles: Nil];
                        
                        [alert78 show];
                    });
                }
            }
        }] resume];
        
    }

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

- (void)backgroundTap
{
    
    [phnTxt resignFirstResponder];
    [amntTxt resignFirstResponder];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [amntTxt resignFirstResponder];
    [phnTxt resignFirstResponder];
    
    
    
    return YES;
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range     replacementString:(NSString *)string
{
    if(textField==phnTxt)
    {
        if (phnTxt.text.length >=15 && range.length == 0)
        {
            return NO;
        }
        else
            return YES;
    }
    else if (textField==amntTxt)
    {
        if (amntTxt.text.length >= 10 && range.length == 0){
            return NO;
        }
        else
            return YES;
    }
    else
    {
        return YES;
    }
    
}

- (IBAction)BackBtnAction:(id)sender {
    [self dismissViewControllerAnimated:NO completion:nil];
}
@end
