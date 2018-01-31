//
//  DidViewController.h
//  Siphon
//
//  Created by Issac Newton on 31/05/17.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "PhoneCallDelegate.h"

@interface DidViewController : UIViewController<UITableViewDataSource, UITableViewDelegate,NSXMLParserDelegate>
{    id<PhoneCallDelegate> phoneCallDelegate;

  UIButton *checkbox;
  UIScrollView *scrol ;
  UITableView *tview;
  UILabel *enblcall;
  UILabel *Clist;
  UITableViewCell *cell;

}
//@property(strong, nonatomic) UIButton *checkbox;
@property (nonatomic , retain) UILabel *enblcall;
@property (nonatomic, retain)  id<PhoneCallDelegate> phoneCallDelegate;
@property (nonatomic , retain) UILabel *Clist;
@property(nonatomic,strong)NSMutableArray *CntryNames;
@property(nonatomic,strong)NSMutableArray *DIDNumbrs;
@property(nonatomic,strong)NSMutableArray *Fullarray;

-(void)checkboxSelected:(id)sender;
@end
