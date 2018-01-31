//
//  BalnaceTransferViewController.h
//  Siphon
//
//  Created by mac on 24/04/17.
//
//

#import <UIKit/UIKit.h>

@interface BalnaceTransferViewController : UIViewController<UITextFieldDelegate>
{
    IBOutlet UITextField *phnTxt;
    
    IBOutlet UITextField *amntTxt;
    IBOutlet UIButton *sendBtn;
    IBOutlet UIButton *backBtn;
}
@property (retain, nonatomic) IBOutlet UITextField *phnTxt;
@property (retain, nonatomic) IBOutlet UITextField *amntTxt;
- (IBAction)SendBtnAction:(id)sender;
- (IBAction)BackBtnAction:(id)sender;

@end
