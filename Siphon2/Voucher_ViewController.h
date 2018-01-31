//
//  Voucher_ViewController.h
//  VS-VoIP
//
//  Created by ADORE INFOTECH on 20/02/17.
//
//

#import <UIKit/UIKit.h>
#import "NSData+AES.h"
#import "NSString+hex.h"


@interface Voucher_ViewController : UIViewController
{
    IBOutlet UIButton *back;
    IBOutlet UIButton *submit;
    IBOutlet UITextField *txtvoucher;
    
}
@property (retain, nonatomic) IBOutlet UIImageView *logo;
@property (retain, nonatomic) IBOutlet UILabel *lblvoucher;
@property (retain, nonatomic) IBOutlet UITextField *txtvoucher;

@property (retain, nonatomic) IBOutlet UIButton *submit;
@property (retain, nonatomic) IBOutlet UIButton *back;


- (IBAction)submit:(id)sender;
- (IBAction)back:(id)sender;

@end
