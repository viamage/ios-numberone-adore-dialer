//
//  smsViewController.h
//  Siphon
//
//  Created by mac on 18/12/15.
//
//

#import <UIKit/UIKit.h>
#import "PhoneCallDelegate.h"
#import "SiphonApplication.h"
#import "SMCViewController.h"
#import "smsaddressViewController.h"
#import "NSData+AES.h"
#import "NSString+hex.h"

@interface smsViewController : UIViewController<UITextFieldDelegate , UITextViewDelegate , UIGestureRecognizerDelegate>
{
    id<PhoneCallDelegate> phoneCallDelegate;
    UILabel *to;
    UILabel *too;
    IBOutlet UITextField *tf1;
    IBOutlet UITextView *tf2;
     UIButton *back;
     IBOutlet UITextField *tf16;
    UIButton *submit;
    UIImageView *imgView;
    NSArray *array ;
    IBOutlet UIButton *btm;
    UITableView *tview;
    UITableViewCell *cell;
    UIButton *savebutton;
    IBOutlet UIButton *invite;
}


@property (nonatomic,retain) UIButton *savebutton;
@property (nonatomic, assign) UITextField *tf16;
@property(nonatomic,strong) NSArray *country;
@property(nonatomic,strong) NSArray *countryid;
@property(nonatomic,strong)NSArray *code;
@property (nonatomic, retain) UIButton *submit;
@property (nonatomic , retain) UILabel *too;
@property (nonatomic , retain) UITextView *tf2;
@property (nonatomic , retain) UITextField *tf1;
@property (nonatomic , retain) UILabel *to;
@property (nonatomic, retain) UIButton *back;
@property(nonatomic,strong)NSArray *image;
@property (nonatomic,strong)IBOutlet UIButton *invite;
@property (nonatomic, retain)  id<PhoneCallDelegate> phoneCallDelegate;
@end
