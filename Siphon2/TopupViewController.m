//
//  TopupViewController.m
//  Siphon
//
//  Created by Issac Newton on 02/06/17.
//
//

#import "TopUpViewController.h"

@implementation TopUpViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.webView.delegate = self;
  NSLog(@"WebView load");
  NSString *accountId = [[NSUserDefaults standardUserDefaults] stringForKey:@"username"];
  NSString *fullURL = [@"https://numberonecall.com/voucher/" stringByAppendingString:accountId];
  NSLog(@"Load %@", fullURL);
  NSURL *url = [NSURL URLWithString:fullURL];
  NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
  [_webView loadRequest:requestObj];
  [_backButton addTarget:self action:@selector(buttonPressed:)
   forControlEvents:UIControlEventTouchUpInside];
}

- (void)buttonPressed:(UIButton *)button {
  NSLog(@"Button Pressed");
  //[self.navigationController popViewControllerAnimated:YES];
  [self dismissModalViewControllerAnimated:YES];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
  NSURL *url = request.URL;
  NSString *urlString = url.absoluteString;
//  if ([urlString isEqualToString:@"https://portal.numberonecall.com/"]) {
//    [self.tabBarController setSelectedIndex:3];
//    return NO;
//  } else {
    NSLog(@"url %@", urlString);
    return YES;
//  }
}

- (void)dealloc {
  [_backButton release];
  [super dealloc];
}
@end
