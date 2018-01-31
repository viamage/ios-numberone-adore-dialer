//
//  addressViewController.m
//  Siphon
//
//  Created by karnail_dhull on 27/01/16.
//
//

#import "addressViewController.h"
#import "puchViewController.h"
@interface addressViewController ()
@property(nonatomic,strong)NSMutableArray *sourceData;

@property(nonatomic,strong)NSMutableArray *tabelData;

@property(nonatomic,strong) NSArray *temp;
@property(nonatomic,strong)NSString *key;
@property(nonatomic,strong)NSMutableArray *restore;
@end

@implementation addressViewController


- (id)init
{
    self = [super init];
    if (self)
    {
        // Initialization code
        //    self.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:
        //                       UITabBarSystemItemContacts tag:3];
        
        //    self.navigationBar.barStyle = UIBarStyleBlackOpaque;
        self.title = NSLocalizedString(@"Contacts", @"ContactView");
        self.tabBarItem.image = [UIImage imageNamed:@"contact1.png"];
       
        
        //    [self setAllowsCardEditing:YES];
        //    [self setAllowsCancel:NO];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically
    //from a nib.]
 
   UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"<< Back" style: UIBarButtonSystemItemAdd target:self action:@selector(Back)];
    backButton.tintColor= [UIColor colorWithRed:0.80 green:0.36 blue:0.09 alpha:1.0];
   // backButton.[UIFont systemFontOfSize:15];
   self.navigationItem.leftBarButtonItem = backButton;
 
    self.sourceData=[[NSMutableArray alloc]init];
    self.tabelData=[[NSMutableArray alloc]init];
    
    
    
    ABAddressBookRef addressBook = ABAddressBookCreate();
    
    __block BOOL accessGranted = NO;
    
    if (&ABAddressBookRequestAccessWithCompletion != NULL) { // We are on iOS 6
        dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
        
        ABAddressBookRequestAccessWithCompletion(addressBook, ^(bool granted, CFErrorRef error) {
            accessGranted = granted;
            dispatch_semaphore_signal(semaphore);
        });
        
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        // dispatch_release(semaphore);
    }
    
    else { // We are on iOS 5 or Older
        accessGranted = YES;
        [self getContactsWithAddressBook:addressBook];
    }
    
    if (accessGranted) {
        [self getContactsWithAddressBook:addressBook];
    }
    
    
    self.sortedNames=[self  sortedNamesFuction:modified];
    
    
    
    
}



- (void)viewWillAppear:(BOOL)animated {
 [super viewWillAppear:animated];
    [self viewDidLoad];
 BOOL isHide = [[NSUserDefaults standardUserDefaults] boolForKey:@"hide"];
 if(isHide)
 {
  [self Back];
 }
    NSString *qwert= [[NSUserDefaults standardUserDefaults] stringForKey:@"deduct"];
}

- (void)Back {
 [self dismissViewControllerAnimated:YES completion:nil];
}

-(NSDictionary *)sortedNamesFuction:(NSArray *)modify
{
    
    NSMutableDictionary *buffer=[[NSMutableDictionary alloc]init];
    
    
    
    for (int i=0; i<[modify count]; i++) {
        
        NSDictionary *local=[modify objectAtIndex:i];
        NSString *key=[local objectForKey:@"name"];
        NSString  *firstLetter;
        if (![key isEqualToString:@""]) {
             firstLetter=[[key substringToIndex:1]uppercaseString];
            
            
            if ([buffer objectForKey:firstLetter]) {
                
                [(NSMutableArray *)[buffer objectForKey:firstLetter]addObject:local];
                
            }
            else{
                
                
                NSMutableArray *mutableArray=[[NSMutableArray alloc]initWithObjects:local, nil];
                
                [buffer setObject:mutableArray forKey:firstLetter];
                
            }

        }
       
        
         }
    
    [buffer removeObjectForKey:@"("];
    NSDictionary *result=[NSDictionary dictionaryWithDictionary:buffer];
    
    return result;
    
}







- (void)getContactsWithAddressBook:(ABAddressBookRef )addressBook {
    
    contactList = [[NSMutableArray alloc] init];
    CFArrayRef allPeople = ABAddressBookCopyArrayOfAllPeople(addressBook);
    CFIndex nPeople = ABAddressBookGetPersonCount(addressBook);
    
    for (int i=0;i < nPeople;i++) {
        NSMutableDictionary *dOfPerson=[NSMutableDictionary dictionary];
        
        ABRecordRef ref = CFArrayGetValueAtIndex(allPeople,i);
        
        //For username and surname
        ABMultiValueRef phones =(__bridge ABMultiValueRef)((__bridge NSString*)ABRecordCopyValue(ref, kABPersonPhoneProperty));
        
        CFStringRef firstName, lastName;
        firstName = ABRecordCopyValue(ref, kABPersonFirstNameProperty);
        lastName  = ABRecordCopyValue(ref, kABPersonLastNameProperty);
        
        
             [dOfPerson setObject:[NSString stringWithFormat:@"%@", firstName] forKey:@"name"];
        
       
        
        if (lastName!=nil) {
            [dOfPerson setObject:[NSString stringWithFormat:@"%@ %@", firstName,lastName] forKey:@"name"];
        }
        
        
        NSString* mobileLabel;
        
        for(CFIndex j = 0; j < ABMultiValueGetCount(phones); j++) {
            mobileLabel = (__bridge NSString*)ABMultiValueCopyLabelAtIndex(phones, j);
            
            // NSString *temp=(__bridge NSString *)kABPersonPhoneMobileLabel;
            if([mobileLabel isEqualToString:mobileLabel])
            {
                [dOfPerson setObject:(__bridge NSString*)ABMultiValueCopyValueAtIndex(phones, j) forKey:@"Phone"];
            }
            else if ([mobileLabel isEqualToString:(NSString*)kABPersonPhoneIPhoneLabel])
            {
                [dOfPerson setObject:(__bridge NSString*)ABMultiValueCopyValueAtIndex(phones, j) forKey:@"Phone"];
                break ;
            }
            
        }
        [contactList addObject:dOfPerson];
        
    }
    
    NSSortDescriptor * brandDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    NSArray * sortedArray = [contactList sortedArrayUsingDescriptors:@[brandDescriptor]];
    
    
    modified=[[NSArray alloc ]initWithArray:sortedArray];
    
 }

#pragma tale view delegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    
    if (self.tabelData.count) {
        return 1;
    }else{
   
            NSArray *section=[self.sortedNames allKeys];
            return[section count];
      }
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if (self.tabelData.count) {
        
        
        return self.tabelData.count;
    }
    
    else{
        
            
            NSArray *unsortedkeys=[self.sortedNames allKeys];
            NSArray *sortedKeys=[unsortedkeys sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
            
            NSArray *nameArray=[_sortedNames objectForKey:[sortedKeys objectAtIndex:section]];
            return [nameArray count];
           }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    static NSString *cellResuable=@"cellReauable";
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellResuable];
    
    if (self.tabelData.count) {
        
        NSString *textname=[self.tabelData objectAtIndex:indexPath.row];
        
        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellResuable forIndexPath:indexPath];
        
        cell.textLabel.text=textname;
        return cell;
        
    }
    else{
        
        
            
            UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellResuable forIndexPath:indexPath];
            
            
            NSArray *unsortedKeys=[self.sortedNames allKeys];
            NSArray *sortedKeys=[unsortedKeys sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
            
            NSArray *names=[self.sortedNames objectForKey:[sortedKeys objectAtIndex:indexPath.section]];
            
            //    for (int i=0; i<[names count]; i++) {
            //
            //        NSDictionary *getNmae=[names objectAtIndex:i];
            //
            //        cell.textLabel.text=[getNmae objectForKey:@"name"];
            //
            //    }
            NSDictionary *getNmae=[names objectAtIndex:indexPath.row];
            
            cell.textLabel.text=[getNmae objectForKey:@"name"];
            
            return cell;
            

    }
    
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    if (self.tabelData.count) {
        
        return [[NSUserDefaults standardUserDefaults]objectForKey:@"key"];
        
    }
    else
    {
        NSArray *unsortedKeys=[self.sortedNames allKeys];
            
            NSArray *sortedKeys=[unsortedKeys sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
            
            
            NSString *nameArray=[sortedKeys objectAtIndex:section];
            
            return  nameArray;
            
    }
    
}



#pragma delegate


-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    
    
    [self.tabelData removeAllObjects];
   // [_restore removeAllObjects];
    
    
    NSString *key=[searchText uppercaseString];
    
    if ([key isEqualToString:searchText]) {
        [_restore removeAllObjects];
    }
    
    NSArray * temp1=[self.sortedNames objectForKey:key];
    
    
    
    if (temp1!=nil) {
        
        _temp=[self.sortedNames objectForKey:key];
        
        [[NSUserDefaults standardUserDefaults]setObject:key forKey:@"key"];
        
    }
    
    
    if ([key isEqualToString:[[NSUserDefaults standardUserDefaults]objectForKey:@"key"]]) {
        
        
        for (int i=0; i<self.temp.count; i++) {
            
            
            
            NSDictionary *namedict=[_temp objectAtIndex:i];
            
            NSString *nameOfPerson=[namedict objectForKey:@"name"];
            
            NSString *names=[nameOfPerson lowercaseString];
            
            [_sourceData addObject:names];
            
            
        }
    }
    
    
    for (int i=0;i<self.sourceData.count;i++) {
        
        
        NSString *name=[_sourceData objectAtIndex:i];
        
        NSString *namess=[searchText lowercaseString];
        NSRange r=[name rangeOfString:namess];
        
        
        
        if (r.location!=NSNotFound) {
            
            if (r.location==0) {
                
                
                
                [self.tabelData addObject:name];
                _restore=[[NSMutableArray alloc]initWithArray: self.tabelData];
               
            }
        }
        else{
           // [_restore removeAllObjects];
        }
        
        
        
    }
    
    
    if (self.tabelData.count==0) {
        
              self.tabelData=[NSMutableArray arrayWithArray:_restore];
        
    }
    
    if ([searchBar.text isEqualToString:@""]) {
        
        [self.tabelData removeAllObjects];
        [self.sourceData removeAllObjects];
        
    }
    
    
    [self.tableView reloadData];
    
}

-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    
    NSUserDefaults *userDef = [NSUserDefaults standardUserDefaults];
    [userDef setObject:[NSString stringWithFormat:@"%@",@""] forKey:@"deduct"];
    [userDef synchronize];

    searchBar.text=@"";
    [self.tabelData removeAllObjects];
    [self.sourceData removeAllObjects];
    
    [searchBar resignFirstResponder];
    
    [self.tableView reloadData];
}

-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    
    [self.tabelData removeAllObjects];
    [self.sourceData removeAllObjects];
    
    [self.tableView reloadData];
}


- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
    
    
    [self.tabelData removeAllObjects];
    [self.sourceData removeAllObjects];
    
    [self.tableView reloadData];
    //[searchBar setShowsCancelButton:FALSE animated:TRUE];
}


-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    
    
    NSUserDefaults *userDef = [NSUserDefaults standardUserDefaults];
    [userDef setObject:[NSString stringWithFormat:@"%@",@"1"] forKey:@"deduct"];
    [userDef synchronize];
    
    searchBar.text=@"";
    
    [searchBar resignFirstResponder];
    
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
 [tableView deselectRowAtIndexPath:indexPath animated:YES];
       if (self.tabelData.count) {
     NSString *str=[self.tabelData objectAtIndex:indexPath.row];

        NSString *phoneNumber;
        
        if (str!=nil) {

            
            for (int i=0; i<modified.count; i++) {
                
                
                NSDictionary *temp=[modified objectAtIndex:i];
                
                NSString *abc = [temp objectForKey:@"name"];
                
                abc=[abc lowercaseString];
                
                if([str isEqualToString:abc])
                {
                    phoneNumber=[temp objectForKey:@"Phone"];
                    
                    
                    break;
                    
                }
                
                
            }
            
            
        }
     NSUserDefaults *userDef = [NSUserDefaults standardUserDefaults];
     [userDef setObject:[NSString stringWithFormat:@"%@",@"1"] forKey:@"deduct"];
     [userDef synchronize];
     
     puchViewController *puch=[[puchViewController alloc]init];
    [[NSUserDefaults standardUserDefaults]setObject:str forKey:@"recents"];
        
        [puch fun:str phone:@""];
        
        [self.navigationController pushViewController:puch animated:YES];
        
    }
    
    else{
        
    NSArray *unsortedKeys=[self.sortedNames allKeys];
    NSArray *sortedKeys=[unsortedKeys sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    
    
    NSArray *names=[self.sortedNames objectForKey:[sortedKeys objectAtIndex:indexPath.section]];
    
    NSDictionary *getNmae=[names objectAtIndex:indexPath.row];
    
    NSString *name=[getNmae objectForKey:@"name"];
    NSString *number=[getNmae objectForKey:@"Phone"];

        [[NSUserDefaults standardUserDefaults]setObject:name forKey:@"recents"];
    
    puchViewController *puch=[[puchViewController alloc]init];
    
    [puch fun:name phone:@""];
    
    
    [self.navigationController pushViewController:puch animated:YES];

    }
    
}
- (IBAction)onclick:(id)sender {
    
    
    
    puchViewController *puch=[[puchViewController alloc]init];
    [self.navigationController pushViewController:puch animated:YES];
}
@end
