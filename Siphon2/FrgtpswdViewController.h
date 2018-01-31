//
//  FrgtpswdViewController.h
//  Siphon
//
//  Created by Issac Newton on 19/04/17.
//
//

#import <UIKit/UIKit.h>
#import "NSData+AES.h"
#import "NSString+hex.h"
#import "PhoneCallDelegate.h"

@interface FrgtpswdViewController : UIViewController<UITextFieldDelegate>
{
  IBOutlet UITextField *numtf;
  UIButton *sndbutton;
  UIButton *bckbutton;
  IBOutlet UILabel *sndLabel;
  IBOutlet UILabel *bckLabel;
}

@property (strong, atomic)UITextField *numtf;
@property (nonatomic, retain)UIButton *sndbutton;
@property (nonatomic, retain)UIButton *bckbutton;
@property (nonatomic, retain)UILabel *sndLabel;
@property (nonatomic, retain)UILabel *bckLabel;

@end
