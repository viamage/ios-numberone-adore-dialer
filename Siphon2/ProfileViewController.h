//
//  ProfileViewController.h
//  Siphon
//
//  Created by mac on 15/12/15.
//
//

#import <UIKit/UIKit.h>

#import "PhoneCallDelegate.h"

@interface ProfileViewController : UIViewController<UITextFieldDelegate>
{
    id<PhoneCallDelegate> phoneCallDelegate;
    UILabel *first;
    UITextField *tf1;
    UILabel *second;
    UITextField *tf2;
    UILabel *third;
    UITextField *tf3;
    UILabel *fourth;
    UITextField *tf4;
    UILabel *fifth;
    UITextField *tf5;
    UIButton *exit;
    UIButton *update;
    UIButton *checkProf;
}

@property (nonatomic , retain) UILabel *first;
@property (nonatomic , retain) UITextField *tf1;
@property (nonatomic , retain) UILabel *second;
@property (nonatomic , retain) UITextField *tf2;
@property (nonatomic , retain) UILabel *third;
@property (nonatomic , retain) UITextField *tf3;
@property (nonatomic , retain) UILabel *fourth;
@property (nonatomic , retain) UITextField *tf4;
@property (nonatomic , retain) UILabel *fifth;
@property (nonatomic , retain) UITextField *tf5;
@property (nonatomic , retain) UIButton *exit;
@property (nonatomic, retain) UIButton *update;
@property (nonatomic, retain) UIButton *checkProf;
@property (nonatomic, retain)  id<PhoneCallDelegate> phoneCallDelegate;
@end
