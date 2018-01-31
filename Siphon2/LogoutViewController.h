//
//  LogoutViewController.h
//  Siphon
//
//  Created by Issac Newton on 01/06/17.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "PhoneCallDelegate.h"
#import "PhoneViewController.h"

@interface LogoutViewController : UIViewController<UITextFieldDelegate ,UITableViewDataSource,UITableViewDelegate>
{
    id<PhoneCallDelegate> phoneCallDelegate;
    
    UIButton *savebutton;
    UIButton *regbutton;
    IBOutlet UITextField *tf1;
    IBOutlet UITextField *tf2;
    UILabel *shwstatus;
    UIButton *clearbutton;
    UIButton *frgtbutton;
    UITextField *Codefield;
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
}
@property (nonatomic, retain)  id<PhoneCallDelegate> phoneCallDelegate;
@property (nonatomic,retain) UILabel * Label1;
@property (nonatomic,retain) UILabel * Label2;
@property (nonatomic,retain) UILabel * Label3;
@property (nonatomic,retain) UILabel * Label4;
@property (nonatomic,retain) UILabel * Label5;

@property (strong, atomic) UITextField *tf1;
@property (strong, atomic) UITextField *tf2;
@property (strong, atomic) UITextField *tf3;
@property (strong, atomic) UITextField *tf4;
@property (strong, atomic) UITextField *tf6;

//@property (strong, atomic) UITextField *tf7;
@property (nonatomic,retain) UIButton *savebutton;
@property (nonatomic,retain) UIButton *regbutton;
@property (nonatomic,retain) UIButton *clearbutton;
@property (nonatomic,retain) UIButton *frgtbutton;
@property(nonatomic,strong) NSArray *arrImage;
@property(nonatomic,strong)NSArray *code;
@property(nonatomic,strong) NSArray *country;
@property (retain, nonatomic)UIImageView *flgImg;
@property (strong, atomic) UITextField *Codefield;



@property (nonatomic, retain) UITableView *tview;
@property (nonatomic,retain) UITableViewCell *cell;
@end