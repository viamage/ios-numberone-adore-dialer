//
//  moreViewController.m
//  Siphon
//
//  Created by ADORE INFOTECH on 02/03/16.
//
//

#import "moreViewController.h"
#import "smsViewController.h"
#import "Voucher_ViewController.h"
#import "ProfileViewController.h"
#import "BalnaceTransferViewController.h"
#import "AccountViewController.h"
#import "DidViewController.h"
#import "LogoutViewController.h"
#import "TopupViewController.h"
#define IS_IPHONE5 (([[UIScreen mainScreen] bounds].size.height-568)?NO:YES)
#define IS_OS_5_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 5.0)
#define IS_OS_6_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 6.0)
#define IS_OS_7_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
#define IS_OS_8_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)



@interface moreViewController ()

@end


UIAlertView *alertView1;
UIAlertView *alertView;
UIAlertView *alertView2;
UIAlertView *alertView8;
UIAlertView *alertView9;


@implementation moreViewController

@synthesize phoneCallDelegate;
@synthesize authBtn;
@synthesize didBtn;
@synthesize helpBtn;
@synthesize logoutBtn;
@synthesize exitBtn;
@synthesize TopBtn;
@synthesize CallBtn;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
                self.title = NSLocalizedString(@"", @"settings");
        self.tabBarItem.image = [UIImage imageNamed:@"more.png"];
      self.tabBarItem.imageInsets = UIEdgeInsetsMake(10, 0, -10, 0);

        NSString *abc2= [[NSUserDefaults standardUserDefaults] stringForKey:@"username"];
        NSString *abc3= [[NSUserDefaults standardUserDefaults] stringForKey:@"password"];
        if([abc2 isEqual:@"EMEATEST"]&&[abc3 isEqual:@"wtn12tm"])
        {
            authBtn.hidden = YES;
            helpBtn.hidden = YES;
            CGRect frame = didBtn.frame;
            frame.origin.y = 150;
            didBtn.frame = frame;
            
        }
        else
        {
            authBtn.hidden = YES;
            helpBtn.hidden = NO;
            CGRect frame = didBtn.frame;
            frame.origin.y = 90;
            didBtn.frame = frame;
 //           didBtn.hidden = NO;

        }

        
    }
    return self;
}


- (void)viewDidLoad {
    
       [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSString *abc2= [[NSUserDefaults standardUserDefaults] stringForKey:@"username"];
    NSString *abc3= [[NSUserDefaults standardUserDefaults] stringForKey:@"password"];
    if([abc2 isEqual:@"EMEATEST"]&&[abc3 isEqual:@"wtn12tm"])
    {
        authBtn.hidden = YES;
        helpBtn.hidden = YES;
        CGRect frame = didBtn.frame;
        frame.origin.y = 150;
        didBtn.frame = frame;
        
    }
    else
    {
        authBtn.hidden = YES;
        helpBtn.hidden = NO;
        CGRect frame = didBtn.frame;
        frame.origin.y = 90;
        didBtn.frame = frame;
//        didBtn.hidden = NO;

    }


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
-(void)viewWillAppear:(BOOL)animated
{
  [super viewWillAppear: animated];
    NSString *abc2= [[NSUserDefaults standardUserDefaults] stringForKey:@"username"];
    NSString *abc3= [[NSUserDefaults standardUserDefaults] stringForKey:@"password"];
    if([abc2 isEqual:@"EMEATEST"]&&[abc3 isEqual:@"wtn12tm"])
    {
        authBtn.hidden = YES;
        helpBtn.hidden = YES;
        CGRect frame = didBtn.frame;
        frame.origin.y = 150;
        didBtn.frame = frame;
        
    }
    else
    {
        authBtn.hidden = YES;
        helpBtn.hidden = NO;
        CGRect frame = didBtn.frame;
        frame.origin.y = 90;
        didBtn.frame = frame;
//        didBtn.hidden = NO;

    }
  NSString *relogin = [[NSUserDefaults standardUserDefaults] stringForKey:@"Relogin"];
  if([relogin isEqual:@"Yes"])
  {
    NSUserDefaults *usrdef = [NSUserDefaults standardUserDefaults];
    [usrdef setObject:[NSString stringWithFormat:@"No"] forKey:@"Relogin"];
    [usrdef synchronize];
    [self.tabBarController setSelectedIndex:0];
  }
  else
  {
    NSUserDefaults *usrdef = [NSUserDefaults standardUserDefaults];
    [usrdef setObject:[NSString stringWithFormat:@"No"] forKey:@"Relogin"];
    [usrdef synchronize];
  }

}
- (void)dealloc {
    
    [authBtn release];
    [didBtn release];
    [helpBtn release];
    [logoutBtn release];
    [exitBtn release];
    [super dealloc];
}
- (IBAction)AuthAction:(id)sender {
    
    NSString *urlstr1 = [NSString stringWithFormat:@"https://portal.numberonecall.com/ani-confirm"];
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:urlstr1]];
}

- (IBAction)HelpAction:(id)sender {
    
    NSString *urlstr2 = [NSString stringWithFormat:@"https://numberonecall.com/mobilesupport"];
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:urlstr2]];

}

-(IBAction)Topup:(id)sender
{
    
//NSString *abc2= [[NSUserDefaults standardUserDefaults] stringForKey:@"username"];

    //NSString *topstr = [NSString stringWithFormat:@"https://numberonecall.com/voucher/%@?pin_only=1", abc2];
    
 
  //[[UIApplication sharedApplication]openURL:[NSURL URLWithString:topstr]];
  NSLog(@"Navigate");
  TopUpViewController *topup = [[TopUpViewController alloc]init];
  [self presentViewController:topup animated:YES completion:nil];
 
  
}

-(IBAction)CallBtn:(id)sender
{
    DidViewController *didno = [[DidViewController alloc]init];
    [self presentViewController:didno animated:NO completion:nil];

}

- (IBAction)but:(id)sender {
    NSString *currSysVer = [[UIDevice currentDevice] systemVersion];
    
    double myDouble = [currSysVer doubleValue];
    
    if (8.0 <= myDouble) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
    }
    else{
        
        alertView2 = [[UIAlertView alloc]
                      initWithTitle:@"ALERT"
                      message:@"To Access Setting from App Your IOS Version should be greater than or equal to IOS 8"
                      delegate:self
                      cancelButtonTitle:@"OK"
                      otherButtonTitles: nil];
        
        
        [alertView2 show];
        [self performSelector:@selector(dismissAlert:) withObject:alertView2 afterDelay:4.0f];
        
        
    }
    
}

- (IBAction)but1:(id)sender {
    
    alertView = [[UIAlertView alloc]
                 initWithTitle:@"MOBIGLOBE V 1.0.0"
                 message:@"© Copyrights © 2017 All Rights Reserved by MobiGlobe."
                 delegate:self
                 cancelButtonTitle:@"https://mobiglobe.com"
                 otherButtonTitles: nil];
    alertView.tag=0;
    
    [alertView show];
    [self performSelector:@selector(dismissAlert:) withObject:alertView afterDelay:2.0f];

}

- (IBAction)but2:(id)sender {
    
    alertView1 = [[UIAlertView alloc]
                  initWithTitle:@"ALERT"
                  message:@"Are you sure you want to exit?"
                  delegate:self
                  cancelButtonTitle:@"NO"
                  otherButtonTitles:@"YES", nil];
    alertView1.tag=1;
    
    [alertView1 show];
    [self performSelector:@selector(dismissAlert1:) withObject:alertView1 afterDelay:2.0f];
}

- (IBAction)but5:(id)sender
{
//    NSUserDefaults *usrd = [NSUserDefaults standardUserDefaults];
//    [usrd setObject:[NSString stringWithFormat:@"0"] forKey:@"yes"];
//    [usrd synchronize];
//    smsViewController *txtmsg=[[smsViewController alloc]init];
//    [self presentViewController:txtmsg animated:NO completion:nil] ;
  DidViewController *didno = [[DidViewController alloc]init];
  [self presentViewController:didno animated:NO completion:nil];

}

- (IBAction)but6:(id)sender
{
//  NSUserDefaults *usrd = [NSUserDefaults standardUserDefaults];
//    [usrd setObject:[NSString stringWithFormat:@"%@",@""] forKey:@"username"];
//    [usrd setObject:[NSString stringWithFormat:@"%@",@""] forKey:@"password"];
//    [usrd setObject:[NSString stringWithFormat:@"%@",@""] forKey:@"didNumber"];
//    [usrd setObject:[NSString stringWithFormat:@"%@",@""] forKey:@"pinbase"];
//    [usrd setObject:[NSString stringWithFormat:@"%@",@""] forKey:@"server"];
//    [usrd setObject:[NSString stringWithFormat:@"%@",@""] forKey:@"dmfdelay"];
//    [usrd synchronize];
    
  LogoutViewController *logout = [[LogoutViewController alloc]init];
  [self presentViewController:logout animated:NO completion:nil];
}

- (IBAction)but7:(id)sender {
    
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"https://mobiglobe.com/autosearch/index.php"]];
}

-(IBAction)but3:(id)sender
{
    //TopupViewController *voucher = [[TopupViewController alloc]init];
    //[self presentViewController:voucher animated:NO completion:nil];
  
}

-(IBAction)but4:(id)sender
{
//  NSString *urlsStr = [NSString  stringWithFormat:@"http://numone.keios.eu/voucher/USER_LOGIN=%@",abc];
// [[UIApplication sharedApplication]openURL:[NSURL URLWithString:urlsStr]];
    ProfileViewController *prf=[[ProfileViewController alloc]init];
    [self presentViewController:prf animated:NO completion:nil];
  }

-(IBAction)but8:(id)sender
{
  NSString *abc= [[NSUserDefaults standardUserDefaults] stringForKey:@"username"];
  NSString *abc1= [[NSUserDefaults standardUserDefaults] stringForKey:@"password"];


//  [web3 release];
//  web3 = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 320, 520)];
//  [web3 setDelegate:self];
//
//  NSString *urlAddress = [NSString stringWithFormat:@"https://sarge.virtualsystems.co.za/customer/mobile_payment.php?pr_login=%@&pr_password=%@&mobiledone=submit_log",abc,abc1];
//  NSURL *url = [NSURL URLWithString:urlAddress];
//  NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
//  [web3 loadRequest:requestObj];
//
//  [self.view addSubview:web3];
NSString *urlStr = [NSString stringWithFormat:@"https://mobiglobe.com/customer/mobile_payment.php?pr_login=5@&pr_password=%@&mobiledone=submit_log",abc,abc1];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlStr]];

}

- (IBAction)blanceTrnsfr:(id)sender {
    BalnaceTransferViewController *bltr = [[BalnaceTransferViewController alloc]init];
    [self presentViewController:bltr animated:NO completion:nil];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (alertView.tag==0) {
        
        if (buttonIndex == [alertView cancelButtonIndex])
        {
            [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"https://mobiglobe.com"]];
            
        }
        else
        {
            
        }
        
    }
    
    
    else if(alertView1.tag==1)
    {
        if (buttonIndex == 1) {
            // NSLog(@"The cancel button was clicked for alertView");
            exit(0);
        }
        else
        {
            
        }
        
    }
}

-(void)dismissAlert1:(UIAlertView *) alertView1
{
    
    [alertView1 dismissWithClickedButtonIndex:nil animated:YES];
    [alertView1 release];
}

-(void)dismissAlert:(UIAlertView *) alertView
{
    [alertView dismissWithClickedButtonIndex:nil animated:YES];
    [alertView release];
    
}


@end
