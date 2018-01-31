//
//  addressViewController.h
//  Siphon
//
//  Created by karnail_dhull on 27/01/16.
//
//

#import <UIKit/UIKit.h>
#import <AddressBook/ABAddressBook.h>
#import <AddressBookUI/AddressBookUI.h>

@interface addressViewController: UIViewController<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>
{
    
    NSMutableArray *contactList;
    
    
    NSArray *modified;
   
    
    
    
    
}
@property (strong, nonatomic) IBOutlet UITableView *tableView;
- (IBAction)onClickSegmentClick:(id)sender;

@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentControl;

@property(strong,nonatomic) NSDictionary *sortedNames;

@end
