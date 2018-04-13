//
//  TopupViewController.h
//  Siphon
//
//  Created by Issac Newton on 02/06/17.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TopUpViewController : UIViewController<UIWebViewDelegate>

@property (retain, nonatomic) IBOutlet UIWebView *webView;
@property (retain, nonatomic) IBOutlet UIButton *backButton;

@end
