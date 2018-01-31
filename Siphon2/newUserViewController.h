//
//  newUserViewController.h
//  Siphon
//
//  Created by Issac Newton on 18/04/17.
//
//

#import <UIKit/UIKit.h>
#import "NSData+AES.h"
#import "NSString+hex.h"
#import "PhoneCallDelegate.h"

@interface newUserViewController : UIViewController<UITextFieldDelegate ,UITableViewDelegate>
{
  IBOutlet UITextField *entrtf;
  UIButton *alpinbutton;
  UIButton *signbutton;
  NSString *num;
  IBOutlet UILabel *alpinLabel;
  IBOutlet UILabel *signLabel;
}

  @property (nonatomic, retain) UILabel *alpinlabel;
  @property (nonatomic, retain) UILabel *signLabel;
@property (nonatomic, retain) UIButton *alpinbutton;
@property (nonatomic, retain) UIButton *signbutton;
@property (strong, atomic)UITextField *entrtf;


@end
