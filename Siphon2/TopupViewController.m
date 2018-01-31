//
//  TopupViewController.m
//  Siphon
//
//  Created by Issac Newton on 02/06/17.
//
//

#import "TopupViewController.h"

@implementation TopupViewController
-(id)init
{
    [super init];
    
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
     [webVw release];
}
-(void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:YES];
    dispatch_async(dispatch_get_main_queue(), ^{


  NSString *abc= [[NSUserDefaults standardUserDefaults] stringForKey:@"username"];
        NSLog(@"USERNAME %@ ",abc);
          [webVw release];
          webVw = [[UIWebView alloc] initWithFrame:CGRectMake(-20, 70, 380, 520)];
          [webVw setDelegate:self];
        
          NSString *urlAddress = [NSString  stringWithFormat:@"https://numberonecall.com/voucher/%@?pin_only=1",abc];
          NSURL *url = [NSURL URLWithString:urlAddress];
          NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
          [webVw loadRequest:requestObj];
        
          [self.view addSubview:webVw];
        
        UIButton *backBtn = [[UIButton alloc]initWithFrame:CGRectMake(10,25, 40, 40)];
        [backBtn setBackgroundImage:[UIImage imageNamed:@"back-(2)-1.png"] forState:UIControlStateNormal];
        [backBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        backBtn.layer.borderWidth = 0.0f;
        backBtn.layer.cornerRadius= 2.0f;
        [backBtn addTarget:self action:@selector(gobackPage) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:backBtn];

});

}
-(void)gobackPage
{
    [self dismissViewControllerAnimated:NO completion:nil];
}

@end
