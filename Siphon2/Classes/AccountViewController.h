//
//  AccountViewController.h
//  Siphon
//
//  Created by ADORE INFOTECH on 25/04/14.
//
//

#import <UIKit/UIKit.h>
#import "PhoneCallDelegate.h"
#import "PhoneViewController.h"
//#import "AbsLCDView.h"
UIImage *myimge;
extern NSString *balanceString1;

@interface AccountViewController : UIViewController<UITextFieldDelegate ,UITableViewDataSource,UITableViewDelegate>
{
     id<PhoneCallDelegate> phoneCallDelegate;
    int y;
    IBOutlet UITextField *tf1;
    IBOutlet UITextField *tf2;
    UILabel *shwstatus;
    UITextField *Codefield;
    UIButton *savebutton;
    UIButton *clearbutton;
    UIButton *regbutton;
  UIButton *frgtbutton;
    UIButton *Cntry;
    UIImageView *flgImg;
NSString *username;
    NSString *password;
    NSString *ser;
    int doubleclick;
    int jk;
    NSTimer *time;
    IBOutlet UITextField *tf3;
    IBOutlet UITextField *tf4;
    IBOutlet UITextField *tf6;
//    IBOutlet UITextField *tf7;
    IBOutlet UILabel *Label3;
    IBOutlet UILabel *Label4;
    IBOutlet UILabel *Label5;

    NSArray *array ;
    IBOutlet UIButton *btm;
    UITableView *tview;
    UITableViewCell *cell;
    UIScrollView *scrol ;
   // UISlider
   // AbsLCDView *_lcd;
}
@property (nonatomic, retain)  id<PhoneCallDelegate> phoneCallDelegate;
@property (nonatomic,retain) UILabel * Label1;
@property (nonatomic,retain) UILabel * Label2;
@property (nonatomic,retain) UILabel * Label3;
@property (nonatomic,retain) UILabel * Label4;
@property (nonatomic,retain) UILabel * Label5;
@property(nonatomic,retain)UILabel *Label6;
@property (nonatomic , retain) UIButton *Cntry;

@property (strong, atomic) UITextField *tf1;
@property (strong, atomic) UITextField *tf2;
@property (strong, atomic) UITextField *tf3;
@property (strong, atomic) UITextField *tf4;
@property (strong, atomic) UITextField *tf6;

@property (strong, atomic) UITextField *Codefield;
@property (nonatomic,retain) UIButton *savebutton;
@property (nonatomic,retain) UIButton *regbutton;
@property (nonatomic,retain) UIButton *clearbutton;
@property (nonatomic,retain) UIButton *frgtbutton;

@property (nonatomic, retain) UITableView *tview;
@property (nonatomic,retain) UITableViewCell *cell;
@property(nonatomic,strong) NSArray *arrImage;
@property(nonatomic,strong)NSArray *CountryIso;
@property(nonatomic,strong)NSArray *code;
@property(nonatomic,strong) NSArray *country;
@property (retain, nonatomic)UIImageView *flgImg;

@end
