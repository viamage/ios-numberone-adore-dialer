//
//  smsViewController.m
//  Siphon
//
//  Created by mac on 18/12/15.
//
//

#import "PhoneViewController.h"
#import "smsViewController.h"
#import "SiphonApplication.h"
#import "SMCViewController.h"
#import "smsaddressViewController.h"
#import "moreViewController.h"

NSString *kyy= @"hdjdtie36457jdit";

SiphonApplication *app;

@interface smsViewController ()

@end

NSString *data12;
NSString *data13;

@implementation smsViewController

@synthesize savebutton;
@synthesize tf16;
@synthesize back;
@synthesize submit;
@synthesize too;
@synthesize tf2;
@synthesize tf1;
@synthesize  to;
@synthesize phoneCallDelegate;
@synthesize invite;


//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        // Custom initialization
//        self.tabBarController.tabBar.hidden=NO;
//        self.title = NSLocalizedString(@"SMS", @"SMSView");
//        app = (SiphonApplication*)[[UIApplication sharedApplication] delegate];
//        self.tabBarItem.image = [UIImage imageNamed:@"messege.png"];
//    }
//    return self;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backgroundTap)];
    gestureRecognizer.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:gestureRecognizer];
    [gestureRecognizer release];
    
    
//    
//    array = [[NSArray alloc] initWithObjects:nil];
//    
//    
//    self.image=@[@"None",@"Anguilla.png",@"Antigua-and-Barbuda.png",@"Afghanistan.png",@"Bangladesh.png",
//                 @"Barbados.png",@"Benin.png",@"Bolivia.png",@"Brazil.png",
//                 @"British-Virgin-Islands.png",@"Burkina-Faso.png",@"Burundi.png",@"Bahrain.png",@"Brunei.png",@"Cameroon.png",@"Cayman-Islands.png",@"Central-African-Republic.png",@"Chile.png",@"China.png",@"Colombia.png",@"Congo.png",@"Cuba.png",@"Cambodia.png",@"Costa-Rica.png",@"Cyprus.png",@"Dominica.png",@"Dominican-Republic.png",@"Ecuador.png",@"Egypt.png",@"El-Salvador.png",@"Fiji.png",
//                 @"france.png",@"Ghana.png",@"Grenada.png",@"Guatemala.png",@"Guinea.png",@"Guyana.png",
//                 @"Guinea-Bissau.png",@"Greece.png",@"Honduras.png",@"Haiti.png",@"india.png",
//                 @"Indonesia.png",@"Iraq.png",@"Ivory-Coast.png",@"Jamaica.png",@"Jordan.png",@"Kenya.png",@"Kazakhstan.png",@"Kuwait.png",@"Laos.png",@"Liberia.png",@"Lebanon.png",@"Libya.png",@"Madagascar.png",@"Malaysia.png",@"Mauritius.png",@"Mali.png",@"Mexico.png",@"Montserrat.png",@"Morocco.png",@"Mozambique.png",@"Malta-Europe.png",@"Maldive.png",@"Nepal.png",@"Nicaragua.png",@"Niger.png",@"Nigeria.png",@"Oman.png",@"Panama.png",@"pakistan.png",@"Peru.png",@"Philippines.png",@"Poland.png",@"Palestine.png",@"Paraguay.png",@"Puerto-Rico.png",@"Qatar.png",@"Romania.png",@"Russia.png",@"Rwanda.png",@"Senegal.png",@"Sri-Lanka.png",@"Syria.png",@"Somalia.png",@"South-Africa.png",@"Spain.png",@"Singapore.png",@"St-Kitts-and-Nevis.png",@"St-Lucia.png",@"St-Vincent-Grenadines.png",@"Sudan.png",@"Suriname.png",@"Tanzania.png",@"Trinidad-and-Tobago.png",@"Turks-and-Caicos.png",@"Thailand.png",@"Tunisia.png",@"Turkey.png",@"Ukraine.png",@"Uganda.png",@"United-States.png",@"united-kingdom.png",@"UAE.png",@"united-kingdom.png",@"Venezuela.png",@"Vietnam.png",@"Yemen.png",@"Zambia.png"];
//    
//    
//    
//    self.country=@[@"None",@"Anguilla",@"Antigua and Barbuda",@"Afghanistan",@"Bangladesh",
//                   @"Barbados",@"Benin",@"Bolivia",@"Brazil",@"British Virgin Islands",@"Burkina Faso",@"Burundi",@"Bahrain",@"Brunei",@"Cameroon",@"Cayman Islands",@"Central African Republic",@"Chile",@"China",@"Colombia",@"Congo",@"Cuba",
//                   @"Cambodia",@"Costa Rica",@"Cyprus",@"Dominica",@"Dominican Republic",@"Ecuador",@"Egypt",@"El Salvador",@"Fiji",@"France",@"Ghana",@"Grenada",@"Guatemala",@"Guinea",@"Guyana",
//                   @"Guinea Bissau",@"Greece",@"Honduras",@"Haiti",@"India",
//                   @"Indonesia",@"Iraq",@"Ivory Coast",@"Jamaica",@"Jordan",@"Kenya",@"Kazakhstan",@"Kuwait",@"Laos",@"Liberia",@"Lebanon",@"Libya",@"Madagascar",@"Malaysia",@"Mauritius",@"Mali",@"Mexico",@"Montserrat",@"Morocco",@"Mozambique",@"Malta Europe",@"Maldive",@"Nepal",@"Nicaragua",@"Niger",@"Nigeria",@"Oman",@"Panama",@"Pakistan",@"Peru",@"Philippines",@"Poland",@"Palestine",@"Paraguay",@"Puerto Rico",@"Qatar",@"Romania",@"Russia",@"Rwanda",@"Senegal",@"Sri Lanka",@"Syria",@"Somalia",@"South Africa",@"Spain",@"Singapore",@"St Kitts and Nevis",@"St Lucia",@"St Vincent Grenadines",@"Sudan",@"Suriname",@"Tanzania",@"Trinidad and Tobago",@"Turks and Caicos",@"Thailand",@"Tunisia",@"Turkey",@"Ukraine",
//                   @"Uganda",@"United States",@"USA",@"UAE",@"United Kingdom",@"Venezuela",@"Vietnam",@"Yemen",@"Zambia"];
//    
//    
//    self.code=@[@"",@"1-264",@"1-268",@"93",@"880",@"1-246",@"229",@"591",@"55",@"1-284",@"226",@"257",@"973",@"673",@"237",@"1-345",@"236",@"56",@"86",@"57",@"243",@"53",@"855",@"506",@"357",@"1-767",@"1-809",@"593",@"20",@"503",@"679",@"33",@"233",@"1-473",@"502",@"224",@"592",@"245",@"30",@"504",@"509",@"91",@"62",@"964",@"225",@"1-876",@"962",@"254",@"7",@"965",@"856",@"231",@"961",@"218",@"261",@"60",@"230",@"223",@"52",@"1-664",@"212",@"258",@"356",@"960",@"977",@"505",@"227",@"234",@"968",@"507",@"92",@"51",@"63",@"48",@"970",@"595",@"1-787",@"974",@"40",@"7",@"250",@"221",@"94",@"963",@"252",@"27",@"34",@"65",@"1-869",@"1-758",@"1-784",@"211",@"597",@"255",@"1-868",@"1-649",@"66",@"216",@"90",@"380",@"256",@"1",@"1",@"971",@"44",@"58",@"84",@"967",@"260"];
//    
//    
//    
//    self.countryid=@[@"",@"1239",@"1240",@"3239",@"18",@"1241",@"1242",@"1243",@"1244",@"3240",@"3241",@"3242",@"6244",@"6252",@"1245",@"1246",@"1247",@"1248",@"1249",@"1250",@"1251",@"1252",@"3243",@"3244",@"3245",@"3246",@"3247",@"1253",@"1254",@"1255",@"1256",@"3248",@"1257",@"1258",@"1259",@"1260",@"1261",@"3249",@"6258",@"1262",@"3250",@"99",@"1263",@"1264",@"1265",@"1266",@"1267",@"1268",@"3251",@"6250",@"3252",@"3253",@"6246",@"6251",@"1269",@"1270",@"6245",@"1271",@"1272",@"1273",@"1274",@"1275",@"6247",@"2000",@"1276",@"1277",@"1278",@"1279",@"6242",@"1280",@"162",@"1281",@"1282",@"1283",@"3254",@"3255",@"3256",@"6243",@"3257",@"3258",@"3259",@"1284",@"1285",@"1286",@"3260",@"3261",@"4239",@"6239",@"4240",@"4241",@"4242",@"4243",@"4244",@"1287",@"4245",@"4246",@"1288",@"1289",@"1290",@"1291",@"4247",@"4248",@"1",@"6240",@"6249",@"1292",@"1293",@"1294",@"5239"];
//    
//    
//    
//    NSLog(@"lsit of country==%lu",(unsigned long)self.country.count);
//    NSLog(@"lsit of code==%lu",(unsigned long)self.code.count);
//    NSLog(@"lsit of countryid==%lu",(unsigned long)self.countryid.count);
    
    
}


//
//-(void)SelectType:(id)sender
//{
//    tview =[[UITableView alloc]initWithFrame:CGRectMake(0, 20, 320, 545) style:UITableViewStylePlain];
//    [self.view addSubview:tview];
//    tview.layer.cornerRadius=10;
//    [tview setDataSource:self];
//    [tview setDelegate:self];
//    [tview reloadData];
//    
//}
//
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    return [self.country count];
//}
//
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    static NSString  *identifier =@"ceee";
//    cell =[tableView dequeueReusableCellWithIdentifier:@"identifier"];
//    if (cell == nil)
//    {
//        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
//    }
//    cell.imageView.image = [UIImage imageNamed:[_image objectAtIndex:indexPath.row]];
//    cell.textLabel.text =[self.country objectAtIndex:indexPath.row];
//    cell.detailTextLabel.text=[self.code objectAtIndex:indexPath.row];
//    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//    return cell;
//    
//    
//}
//
//
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    
//    [btm setTitle:[self.country objectAtIndex:indexPath.row] forState:UIControlStateNormal];
//    tf16.text=[self.code objectAtIndex:indexPath.row];
//    //tf19.text=[self.countryid objectAtIndex:indexPath.row];
//    
////    NSString *buttonText = [NSString stringWithFormat:@"%@", btm.titleLabel  ];
////    
////    NSString *str2=buttonText;
////    
////    NSArray * array = [str2 componentsSeparatedByString:@";"];
////    
////    NSString * str3 = [array objectAtIndex:3];
////    
////    NSArray * array1 = [str3 componentsSeparatedByString:@"="];
////    
////    NSString *str4 =[array1 objectAtIndex:1];
////    
////    NSCharacterSet *AllowedChars = [NSCharacterSet characterSetWithCharactersInString:@":'"];
////    
////    NSArray *str5=[str4 componentsSeparatedByCharactersInSet:AllowedChars];
////    //str6=[str5 objectAtIndex:1];
////    
////    NSUserDefaults *userDef = [NSUserDefaults standardUserDefaults];
////    
////    //[userDef setObject:[NSString stringWithFormat:@"%@",str6] forKey:@"country"];
////    [userDef synchronize];
//    tview.hidden=YES;
//    
//    
//}
//
//
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return 40;
//}




- (void)backgroundTap
{
    // resign the first responder of all your textfields
    [tf1 resignFirstResponder];
    [tf2 resignFirstResponder];
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
    NSString *abc101= [[NSUserDefaults standardUserDefaults] stringForKey:@"sms"];
     NSString *abc102= [[NSUserDefaults standardUserDefaults] stringForKey:@"yes"];
    
    UIImageView *ImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0,20, 350, 550)]; //create ImageView
    
    ImgView.image = [UIImage imageNamed:@"background1.png"];

    [self.view addSubview:ImgView];
    

    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    if (screenBounds.size.height == 568)
    {

    
    CGRect titleRect        = CGRectMake(10, 120,50, 50);
    
    to  = [[UILabel alloc] initWithFrame:titleRect];
    to.textColor = [UIColor blackColor];
    to.textAlignment = NSTextAlignmentLeft;
    [to setFont: [UIFont fontWithName:@"Verdana" size:20]];
    to.text = @"To:";
    [self.view addSubview:to];
    
    
    
    tf1 = [[UITextField alloc] initWithFrame:CGRectMake(50, 128, 180, 40)];
    tf1.textColor = [UIColor blackColor];
    tf1.borderStyle = UITextBorderStyleRoundedRect;
    tf1.font = [UIFont systemFontOfSize:13.5];
    tf1.layer.cornerRadius= 6.0f;
    tf1.placeholder = @"Enter Mobile Number";
    tf1.layer.borderWidth= 1.0f;
    tf1.text = abc101;
    tf1.layer.borderColor = [UIColor colorWithRed:0.71 green:0.09 blue:0.10 alpha:1.0].CGColor;
    tf1.autocorrectionType = UITextAutocorrectionTypeNo;
    tf1.keyboardType = UIKeyboardTypePhonePad;
    tf1.returnKeyType = UIReturnKeyDone;
    if (self.tf1.placeholder != nil) {
        self.tf1.clearsOnBeginEditing = YES;
    }
    if (self.tf1.text!=nil) {
         self.tf1.clearsOnBeginEditing = NO;
    }
    tf1.delegate = self;
    [tf1 resignFirstResponder];
    [self.view addSubview:tf1];
    
    
    CGRect title1Rect        = CGRectMake(10, 180,250, 50);
    
    to  = [[UILabel alloc] initWithFrame:title1Rect];
    to.textColor = [UIColor blackColor];
    to.textAlignment = NSTextAlignmentLeft;
    [to setFont: [UIFont fontWithName:@"Verdana" size:18]];
    to.text = @"Enter your Message here:";
    [self.view addSubview:to];

    
    
    tf2 = [[UITextView alloc] initWithFrame:CGRectMake(45, 230, 240, 200)];
    tf2.textColor = [UIColor blackColor];
    tf2.font = [UIFont systemFontOfSize:15];
    tf2.layer.cornerRadius= 0.0f;
    tf2.layer.borderWidth= 1.0f;
    tf2.scrollEnabled=YES;
    if ([abc102 isEqual:@"1"]) {
        tf2.text=@"Please download The Future is Here, click https://mobime.com  link    ";
        tf2.editable=NO;
    }
    else{
        tf2.text=@"";
    }
  
    tf2.layer.borderColor = [UIColor colorWithRed:0.71 green:0.09 blue:0.10 alpha:1.0].CGColor;
    tf2.autocorrectionType = UITextAutocorrectionTypeNo;
    tf2.keyboardType = UIKeyboardTypeDefault;
    tf2.returnKeyType = UIReturnKeyNext;
     tf2.delegate = self;
    [tf2 resignFirstResponder];
    [self.view addSubview:tf2];
    
    back = [[UIButton alloc] initWithFrame:CGRectMake(38, 56, 66, 62)];
        UIImage *btnImg = [UIImage imageNamed:@"back-(2).png"];
        [back  setBackgroundImage:btnImg forState:UIControlStateNormal];
    [back addTarget:self action:@selector(remov1) forControlEvents:UIControlEventTouchUpInside];
   // [back setImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
       //back.layer.borderColor=[UIColor colorWithRed:0.71 green:0.09 blue:0.10 alpha:1.0].CGColor;
     // back.layer.borderWidth=1.0f;
      back.layer.cornerRadius=18;
      back.clipsToBounds= YES;
     // back.backgroundColor= [UIColor colorWithRed:0.71 green:0.09 blue:0.10 alpha:1.0];
     // [back setTitle:@"Back" forState:UIControlStateNormal];
      //[back setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
      //[back.titleLabel setFont:[UIFont systemFontOfSize:20.0]];
    [self.view addSubview:back];
    
    
    submit = [[UIButton alloc] initWithFrame:CGRectMake(226, 56, 66, 62)];
        UIImage *sndImg = [UIImage imageNamed:@"send-1.png"];
        [submit  setBackgroundImage:sndImg forState:UIControlStateNormal];

   [submit addTarget:self action:@selector(myButton) forControlEvents:UIControlEventTouchUpInside];
    //[submit setImage:[UIImage imageNamed:@"send-1.png"] forState:UIControlStateNormal];
      submit.layer.cornerRadius=18;
      submit.clipsToBounds= YES;
      // submit.layer.borderColor=[UIColor colorWithRed:0.71 green:0.09 blue:0.10 alpha:1.0].CGColor;
      //submit.layer.borderWidth=1.0f;
     // submit.backgroundColor= [UIColor colorWithRed:0.71 green:0.09 blue:0.10 alpha:1.0];
      //[submit setTitle:@"Send" forState:UIControlStateNormal];
     // [submit setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
      //  [submit.titleLabel setFont:[UIFont systemFontOfSize:20.0]];
    [self.view addSubview:submit];
    
    



    savebutton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    savebutton.frame= CGRectMake(230, 125, 90, 45);//320,y=500
     //[savebutton setTitle:@"Contacts" forState:UIControlStateNormal];
    [[savebutton layer] setBorderWidth:0.0f];
    [[savebutton layer] setBorderColor:[UIColor blackColor].CGColor];
    savebutton.layer.cornerRadius=0;
    [savebutton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [savebutton addTarget:self action:@selector(yep) forControlEvents:UIControlEventTouchUpInside];
    //[savebutton addTarget:app action:@selector(sipConnect) forControlEvents:UIControlEventTouchUpInside];
    [savebutton setBackgroundImage:[UIImage imageNamed:@"delete-568h@2x.png"] forState:UIControlStateNormal];
    [self.view addSubview:savebutton];

    NSUserDefaults *userDef = [NSUserDefaults standardUserDefaults];
    [userDef setObject:[NSString stringWithFormat:@"%@",@""] forKey:@"sms"];
    [userDef synchronize];
    
    
        
    }
    
    
    /////////for IOS 7
    else
    {
        back = [[UIButton alloc] initWithFrame:CGRectMake(38, 56, 110, 50)];
        UIImage *btnImg = [UIImage imageNamed:@"back-(2).png"];
        [back  setBackgroundImage:btnImg forState:UIControlStateNormal];
      [back addTarget:self action:@selector(remov1) forControlEvents:UIControlEventTouchUpInside];

      // [back setImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
       //back.layer.borderColor=[UIColor colorWithRed:0.71 green:0.09 blue:0.10 alpha:1.0].CGColor;
      //back.layer.borderWidth=1.0f;
      back.layer.cornerRadius=18;
      back.clipsToBounds= YES;

      //back.backgroundColor= [UIColor colorWithRed:0.71 green:0.09 blue:0.10 alpha:1.0];
       //[back setTitle:@"Back" forState:UIControlStateNormal];
      //[back setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
       //[back.titleLabel setFont:[UIFont systemFontOfSize:20.0]];

      [self.view addSubview:back];

      submit = [[UIButton alloc] initWithFrame:CGRectMake(226, 56, 110, 50)];
        UIImage *sndImg = [UIImage imageNamed:@"send-1.png"];
        [submit  setBackgroundImage:sndImg forState:UIControlStateNormal];
      [submit addTarget:self action:@selector(myButton) forControlEvents:UIControlEventTouchUpInside];
      //[submit setImage:[UIImage imageNamed:@"send-1.png"] forState:UIControlStateNormal];
      submit.layer.cornerRadius=18;
      submit.clipsToBounds= YES;
      //submit.layer.borderColor=[UIColor colorWithRed:0.71 green:0.09 blue:0.10 alpha:1.0].CGColor;
      //submit.layer.borderWidth=1.0f;
      //submit.backgroundColor= [UIColor colorWithRed:0.71 green:0.09 blue:0.10 alpha:1.0];
      //[submit setTitle:@"Send" forState:UIControlStateNormal];
      //[submit setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
      //[submit.titleLabel setFont:[UIFont systemFontOfSize:20.0]];

      [self.view addSubview:submit];

        //CGRect titleRect        = CGRectMake(0, 100,50, 50);
        
      CGRect title1Rect        = CGRectMake(10, 180,250, 50);

      to  = [[UILabel alloc] initWithFrame:title1Rect];
      to.textColor = [UIColor blackColor];
      to.textAlignment = NSTextAlignmentLeft;
      [to setFont: [UIFont fontWithName:@"Verdana" size:18]];
      to.text = @"Enter your Message here:";
      [self.view addSubview:to];
        
        
        
        tf1 = [[UITextField alloc] initWithFrame:CGRectMake(45, 88, 180, 40)];
        tf1.textColor = [UIColor blackColor];
        tf1.borderStyle = UITextBorderStyleRoundedRect;
        tf1.font = [UIFont systemFontOfSize:13.5];
        tf1.layer.cornerRadius= 0.0f;
        tf1.placeholder = @"Enter Mobile Number";
        tf1.layer.borderWidth= 1.0f;
    //    tf1.text = abc101;
        tf1.layer.borderColor = [UIColor colorWithRed:0.71 green:0.09 blue:0.10 alpha:1.0].CGColor;
        tf1.autocorrectionType = UITextAutocorrectionTypeNo;
        tf1.keyboardType = UIKeyboardTypePhonePad;
        tf1.returnKeyType = UIReturnKeyDone;
        if (self.tf1.placeholder != nil) {
            self.tf1.clearsOnBeginEditing = YES;
        }
        if (self.tf1.text!=nil) {
            self.tf1.clearsOnBeginEditing = NO;
        }
        tf1.delegate = self;
        [tf1 resignFirstResponder];
        [self.view addSubview:tf1];
        
        savebutton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        savebutton.frame= CGRectMake(230, 125, 90, 45);//320,y=500
        //[savebutton setTitle:@"Contacts" forState:UIControlStateNormal];
        [[savebutton layer] setBorderWidth:0.0f];
        [[savebutton layer] setBorderColor:[UIColor blackColor].CGColor];
        savebutton.layer.cornerRadius=0;
        [savebutton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [savebutton addTarget:self action:@selector(yep) forControlEvents:UIControlEventTouchUpInside];
        [savebutton setBackgroundImage:[UIImage imageNamed:@"delete-568h@2x.png"] forState:UIControlStateNormal];
        [self.view addSubview:savebutton];

        

        
        to  = [[UILabel alloc] initWithFrame:title1Rect];
        to.textColor = [UIColor blackColor];
        to.textAlignment = NSTextAlignmentLeft;
        [to setFont: [UIFont fontWithName:@"Verdana" size:18]];
        to.text = @"Enter your Message here:";
        [self.view addSubview:to];
        
        
        
        tf2 = [[UITextView alloc] initWithFrame:CGRectMake(45, 170, 240, 200)];
        tf2.textColor = [UIColor blackColor];
        tf2.font = [UIFont systemFontOfSize:15];
        tf2.layer.cornerRadius= 0.0f;
        tf2.layer.borderWidth= 1.0f;
        tf2.scrollEnabled=YES;
        if ([abc102 isEqual:@"1"]) {
            tf2.text=@"Please download The Future is Here, click https://mobime.com  link    ";
            tf2.editable=NO;
        }
        else{
            tf2.text=@"";
        }
        
        tf2.layer.borderColor = [UIColor colorWithRed:0.71 green:0.09 blue:0.10 alpha:1.0].CGColor;
        tf2.autocorrectionType = UITextAutocorrectionTypeNo;
        tf2.keyboardType = UIKeyboardTypeDefault;
        tf2.returnKeyType = UIReturnKeyNext;
        
        tf2.delegate = self;
        [tf2 resignFirstResponder];
        [self.view addSubview:tf2];
        
    }

    
}



-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    [textField resignFirstResponder];
    return true;
    
    
}

-(void)yep
{
    
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"hide"];
    smsaddressViewController * v7c = [[smsaddressViewController alloc] initWithNibName:@"smsaddressViewController" bundle:[NSBundle mainBundle]];
    UINavigationController *newcontroller=[[[UINavigationController alloc]initWithRootViewController:v7c]autorelease];
    [self presentViewController:newcontroller animated:YES completion:nil];}


-(void)myButton
{
    
    NSString *abc= [[NSUserDefaults standardUserDefaults] stringForKey:@"username"];
    NSString *abc1= [[NSUserDefaults standardUserDefaults] stringForKey:@"password"];
    NSString *abc102= [[NSUserDefaults standardUserDefaults] stringForKey:@"yes"];
    
    if (abc!= nil) {
        ///////////////Encrption of username////////////////
        NSData *plain = [abc dataUsingEncoding:NSUTF8StringEncoding];
        NSData *cipher = [plain AES128EncryptedDataWithKey:kyy];
        printf("%s\n", [[cipher description] UTF8String]);
        NSString *base64Encoded = [cipher base64EncodedStringWithOptions:0];
        NSLog(@"Encoded: %@",base64Encoded);
        NSString *hexUsername = [base64Encoded stringToHex:base64Encoded];
        NSLog(@"HexValue : %@",hexUsername);
        NSString *UserfrmHex = [hexUsername stringFromHex:hexUsername];
        NSLog(@"StringValue : %@",UserfrmHex);
        
        /////////////Decryption of username///////////////////////
        NSData *nsdataFromBase64String = [[NSData alloc]initWithBase64EncodedString:base64Encoded options:0];
        plain = [nsdataFromBase64String AES128DecryptedDataWithKey:kyy];
        printf("%s\n", [[plain description] UTF8String]);
        NSString *base64Decoded = [[NSString alloc]initWithData:plain encoding:NSUTF8StringEncoding];
        NSLog(@"Decoded: %@", base64Decoded);
        
        ///////////////Encrption of password////////////////
        NSData *plain1 = [abc1 dataUsingEncoding:NSUTF8StringEncoding];
        NSData *cipher1 = [plain1 AES128EncryptedDataWithKey:kyy];
        printf("%s\n", [[cipher1 description] UTF8String]);
        NSString *base64Encoded1 = [cipher1 base64EncodedStringWithOptions:0];
        NSLog(@"Encoded: %@",base64Encoded1);
        NSString *hexPass = [base64Encoded1 stringToHex:base64Encoded1];
        NSLog(@"HexValue : %@",hexPass);
        NSString *PassfrmHex = [hexPass stringFromHex:hexPass];
        NSLog(@"StringValue : %@",PassfrmHex);
        
         ///////////////Decryption of password////////////////
        NSData *nsdataFromBase64String1 = [[NSData alloc]initWithBase64EncodedString:base64Encoded1 options:0];
        plain1 = [nsdataFromBase64String1 AES128DecryptedDataWithKey:kyy];
        printf("%s\n", [[plain1 description] UTF8String]);
        NSString *base64Decoded1 = [[NSString alloc]initWithData:plain1 encoding:NSUTF8StringEncoding];
        NSLog(@"Decoded: %@", base64Decoded1);
        
         ///////////////Encryption of phone number////////////////
        NSData *plain2 = [tf1.text dataUsingEncoding:NSUTF8StringEncoding];
        NSData *cipher2 = [plain2 AES128EncryptedDataWithKey:kyy];
        printf("%s\n", [[cipher2 description] UTF8String]);
        NSString *base64Encoded2 = [cipher2 base64EncodedStringWithOptions:0];
        NSLog(@"Encoded: %@",base64Encoded2);
        NSString *hexto = [base64Encoded2 stringToHex:base64Encoded2];
        NSLog(@"HexValue : %@",hexto);
        NSString *PassfrmHexto = [hexto stringFromHex:hexto];
        NSLog(@"StringValue : %@",PassfrmHexto);
       
         ///////////////Encryption of message////////////////
        NSData *plain3 = [tf2.text dataUsingEncoding:NSUTF8StringEncoding];
        NSData *cipher3 = [plain3 AES128EncryptedDataWithKey:kyy];
        printf("%s\n", [[cipher3 description] UTF8String]);
        NSString *base64Encoded3 = [cipher3 base64EncodedStringWithOptions:0];
        NSLog(@"Encoded: %@",base64Encoded3);
        NSString *hexmsg = [base64Encoded3 stringToHex:base64Encoded3];
        NSLog(@"HexValue : %@",hexmsg);
        NSString *PassfrmHexmsg = [hexmsg stringFromHex:hexmsg];
        NSLog(@"StringValue : %@",PassfrmHexmsg);
        
        if([abc102 isEqual:@"1"])
        {
            
            if ([tf1.text isEqual:@""]) {
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Please enter phone number." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                [alert show];
            }
            else{
                
            
            
            NSString *post = [NSString stringWithFormat:@"username=%@&password=%@&receiver=%@&r_message=%@",hexUsername,hexPass,hexto,hexmsg];
            NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
            NSString *postLength = [NSString stringWithFormat:@"%lu",(unsigned long)[postData length]];
            NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
                [request setURL:[NSURL URLWithString:@"https://mobiglobe.com/vibgyor_4700/billing_invite_friends/invite_friends_sms.php"]];
            [request setHTTPMethod:@"POST"];
            [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
            [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
            [request setHTTPBody:postData];
            
            
//            NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
//            if(conn) {
//                NSLog(@"Connection Successful");
//            } else {
//                NSLog(@"Connection could not be made");
//            }

            NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
            [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                NSString *requestReply = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
                NSLog(@"requestReply: %@", requestReply);
                if(data==nil||[data isEqual:@""])
                {
                    dispatch_async(dispatch_get_main_queue(), ^(void){
                        
                        UIAlertView *alrt = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Please check your internet connection." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                        
                        [alrt show];
                        
                    });
                    
                }
                else
                {
                    if(requestReply!=nil)
                    {
                    
                        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                        NSLog(@"%@",json);
                        if(json!=nil)
                        {
                        
                            dispatch_async(dispatch_get_main_queue(), ^(void){
                        
                                NSLog(@"%@",[json objectForKey:@"result"]);
                                NSLog(@"%@",[json objectForKey:@"msg"]);
                        
                                NSString *reslt = [json objectForKey:@"result"];
                                NSString *output = [json objectForKey:@"msg"];
                            
                                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:reslt message:output delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
                            
                                [alert show];
                    
                            });
                        }
                    else{
                        
                    }
                    tf1.text = @"";
                    NSUserDefaults *userDef = [NSUserDefaults standardUserDefaults];
                    [userDef setObject:[NSString stringWithFormat:@"%@",@"1"] forKey:@"yes"];
                    [userDef setObject:[NSString stringWithFormat:@"%@",@""] forKey:@"recents"];
                    [userDef synchronize];

                }
                else{
                    dispatch_async(dispatch_get_main_queue(), ^(void){
                        
                        UIAlertView *alrt = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"No response." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                        
                        [alrt show];
                        
                    });

                  }
                }
            }]resume];
          }
 
        }
    else
    {
          if ([tf1.text isEqual:@""]) {
                
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Please enter phone number." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                [alert show];
                
                
            }
            
            else if ([tf2.text isEqual:@""]){
                
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Please enter message." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                [alert show];
                
            }
            else{
            
            
                NSString *post = [NSString stringWithFormat:@"username=%@&password=%@&receiver=%@&r_message=%@",hexUsername,hexPass,hexto,hexmsg];
                NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
                NSString *postLength = [NSString stringWithFormat:@"%lu",(unsigned long)[postData length]];
                NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
                [request setURL:[NSURL URLWithString:@"https://mobiglobe.com/vibgyor_4700/billing_send_sms/send_web_sms.php"]];
                [request setHTTPMethod:@"POST"];
                [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
                [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
                [request setHTTPBody:postData];
        
        
//        NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
//        if(conn) {
//            NSLog(@"Connection Successfull");
//        } else {
//            NSLog(@"Connection could not be made");
//        }

        NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
        [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
          {
            NSString *requestReply = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
            NSLog(@"requestReply: %@", requestReply);
            
            if(data==nil||[data isEqual:@""])
            {
              dispatch_async(dispatch_get_main_queue(), ^(void){
                  
                  UIAlertView *alrt = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Please check your internet connection." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                  
                  [alrt show];
                  
              });
            }
            else
            {
            if(requestReply!=nil)
            {
                
                NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                NSLog(@"%@",json);
                if(json!=nil)
                {
                   
                    dispatch_async(dispatch_get_main_queue(), ^(void){
                    
                    NSLog(@"%@",[json objectForKey:@"result"]); //this is table column name
                    NSLog(@"%@",[json objectForKey:@"msg"]);
                    
                    NSString *reslt = [json objectForKey:@"result"];
                    NSString *output = [json objectForKey:@"msg"];
                
                    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:reslt message:output delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
                    
                        [alert show];
                   
                    });
                        
                }
                else{
                    
                }
                tf1.text = @"";
                tf2.text = @"";
                NSUserDefaults *userDef = [NSUserDefaults standardUserDefaults];
                [userDef setObject:[NSString stringWithFormat:@"%@",@"0"] forKey:@"yes"];
                [userDef setObject:[NSString stringWithFormat:@"%@",@""] forKey:@"recents"];
                [userDef synchronize];

            }
            else{
                dispatch_async(dispatch_get_main_queue(), ^(void){
                    
                    UIAlertView *alrt = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"No response." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    [alrt show];
                    
                });
            }
          }
          
            }]resume];
        }
    }
    }
    else{
        
    }
    
    //    [self dismissViewControllerAnimated:NO completion:nil];
    
}

-(void)remov1
{
    NSUserDefaults *segue = [NSUserDefaults standardUserDefaults];
    
    [segue setObject:[NSString stringWithFormat:@"%@",@""] forKey:@"yes"];
    
    [segue synchronize];

    [self dismissViewControllerAnimated:NO completion:nil];
    
    
}

-(BOOL)textViewShouldEndEditing:(UITextView *)textView{
    [textView resignFirstResponder];
    return true;
}

- (void)keyboardDidShow:(NSNotification *)notification
{
    //Assign new frame to your view
    
    //  [self.view setFrame:CGRectMake(0,-90,320,460)]; //here taken -20 for example i.e. your view will be scrolled to -20. change its value according to your requirement.
    
}

-(void)keyboardDidHide:(NSNotification *)notification
{
    // [self.view setFrame:CGRectMake(0,0,320,460)];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
