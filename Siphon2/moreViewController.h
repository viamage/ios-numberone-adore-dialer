//
//  moreViewController.h
//  Siphon
//
//  Created by ADORE INFOTECH on 02/03/16.
//
//

#import <UIKit/UIKit.h>
#import "PhoneCallDelegate.h"
#import "ProfileViewController.h"

@interface moreViewController : UIViewController <UIWebViewDelegate>{
    id<PhoneCallDelegate> phoneCallDelegate;

    }
@property (strong, nonatomic) IBOutlet UIButton *authBtn;
@property (strong, nonatomic) IBOutlet UIButton *didBtn;
@property (strong, nonatomic) IBOutlet UIButton *helpBtn;
@property (strong, nonatomic) IBOutlet UIButton *logoutBtn;
@property (strong, nonatomic) IBOutlet UIButton *exitBtn;
@property (strong, nonatomic) IBOutlet UIButton *TopBtn;
@property (strong, nonatomic) IBOutlet UIButton *CallBtn;

- (IBAction)AuthAction:(id)sender;
- (IBAction)HelpAction:(id)sender;
- (IBAction)but:(id)sender;
- (IBAction)but1:(id)sender;
- (IBAction)but2:(id)sender;
- (IBAction)but3:(id)sender;
- (IBAction)but4:(id)sender;
- (IBAction)but5:(id)sender;
- (IBAction)but6:(id)sender;
- (IBAction)but7:(id)sender;
- (IBAction)but8:(id)sender;
- (IBAction)blanceTrnsfr:(id)sender;
- (IBAction)Topup:(id)sender;
- (IBAction)CallBtn:(id)sender;

@property (nonatomic, retain)  id<PhoneCallDelegate> phoneCallDelegate;
@end
