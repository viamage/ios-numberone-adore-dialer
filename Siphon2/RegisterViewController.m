//
//  RegisterViewController.m
//  Siphon
//
//  Created by Michał Łaszczewski on 03/04/18.
//
//

#import <Foundation/Foundation.h>
#import "RegisterViewController.h"


@implementation RegisterViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.webView.delegate = self;
  NSLog(@"WebView load");
  NSString *fullURL = @"https://portal.numberonecall.com/signin?mode=dialer";
  NSURL *url = [NSURL URLWithString:fullURL];
  NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
  [_webView loadRequest:requestObj];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
  NSURL *url = request.URL;
  NSString *urlString = url.absoluteString;
  if ([urlString isEqualToString:@"https://portal.numberonecall.com/"]) {
    [self.tabBarController setSelectedIndex:3];
    return NO;
  } else {
    NSLog(@"%@", urlString);
    return YES;
  }
}

@end
