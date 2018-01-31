//
//  LogoutViewController.m
//  Siphon
//
//  Created by Issac Newton on 01/06/17.
//
//

#import "LogoutViewController.h"
#import "SiphonApplication.h"
#import "newUserViewController.h"
#import "AccountViewController.h"
NSString *i=0;
SiphonApplication *app;

@interface LogoutViewController ()

@end
NSString *DIDs;

NSString *u1=nil;

NSString *p1=nil;



NSString *balanceString1=nil;
@implementation LogoutViewController
@synthesize phoneCallDelegate;
@synthesize Label1;
@synthesize Label2;
//@synthesize Label3;
@synthesize tf1;
@synthesize tf2;
@synthesize tf4;
@synthesize tf6;
//@synthesize tf7;
@synthesize savebutton;
@synthesize regbutton;
@synthesize clearbutton;
@synthesize frgtbutton;
@synthesize Codefield;
@synthesize flgImg;
@synthesize country;
@synthesize arrImage;
@synthesize code;
@synthesize cell;
@synthesize tview;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        NSString *abc1= [[NSUserDefaults standardUserDefaults] stringForKey:@"Withoutcode"];
        NSString *abc2= [[NSUserDefaults standardUserDefaults] stringForKey:@"password"];
        NSString *abc3= [[NSUserDefaults standardUserDefaults] stringForKey:@"Withplus"];
        NSString *abc4= [[NSUserDefaults standardUserDefaults] stringForKey:@"username"];
        
//        NSString* imageData = [[NSUserDefaults standardUserDefaults] objectForKey:@"image"];
//        UIImage* image = [UIImage imageWithData:imageData];

        app = (SiphonApplication*)[[UIApplication sharedApplication] delegate];
        self.title = NSLocalizedString(@"Account", @"RecentsView");
        self.tabBarItem.image = [UIImage imageNamed:@"login12.png"];
        
        scrol =[[ UIScrollView alloc] initWithFrame:CGRectMake(0,0,350 ,576) ]; // , , ,530
        scrol.minimumZoomScale=0.5;
        scrol.maximumZoomScale=6.0;
        scrol.contentSize=CGSizeMake(200,650) ;
        UIImageView *Scrlview = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,350 ,750)];
        Scrlview.image=[UIImage imageNamed:@"background.png"];
        [self.view addSubview:Scrlview];
        [ self.view addSubview:scrol];
        
        //////*********add textfield of country code/////
        
        Codefield = [[UITextField alloc] initWithFrame:CGRectMake(32, 331, 66, 45)];//12, y=435, 50
        Codefield.textColor = [UIColor whiteColor];
        Codefield.font = [UIFont systemFontOfSize:15];
        Codefield.text=abc3;
        Codefield.autocorrectionType = UITextAutocorrectionTypeNo;
        Codefield.delegate = self;
        UIFont* boldFont = [UIFont boldSystemFontOfSize:[UIFont systemFontSize]];
        [self.Codefield setFont:boldFont];
        Codefield.textAlignment = NSTextAlignmentCenter;
        [scrol addSubview:Codefield];
        Codefield.borderStyle = UITextBorderStyleNone;
        [Codefield release];
        [Codefield resignFirstResponder];
        [Codefield setEnabled:NO ];
        
        savebutton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        savebutton.backgroundColor= [UIColor colorWithRed:0.91 green:0.02 blue:0.03 alpha:1.0];
        savebutton.frame= CGRectMake(122, 452, 62, 29);//106,y=500//490, 96  , 46    (56, 446, 182, 45);
        savebutton.layer.cornerRadius=2.0f;
        savebutton.clipsToBounds= YES;
        [savebutton setTitle:@"Next" forState:UIControlStateNormal];
        [savebutton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [clearbutton.titleLabel setFont:[UIFont systemFontOfSize:20.0]];
        [savebutton addTarget:self action:@selector(Relogin) forControlEvents:UIControlEventTouchUpInside];
        [scrol addSubview:savebutton];
        
        regbutton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        regbutton.backgroundColor= [UIColor colorWithRed:0.91 green:0.02 blue:0.03 alpha:1.0];
        regbutton.frame= CGRectMake(122, 506, 62, 29);//106,y=500//490, 96      (56, 446, 182, 45);
        regbutton.layer.cornerRadius=2.0f;
        regbutton.clipsToBounds= YES;
        regbutton.titleLabel.textAlignment=true;
        [regbutton setTitle:@"Sign up" forState:UIControlStateNormal];
        [regbutton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        // [regbutton.titleLabel setFont:[UIFont systemFontOfSize:20.0]];
        [regbutton addTarget:self action:@selector(Registerlinkin) forControlEvents:UIControlEventTouchUpInside];
        [scrol addSubview:regbutton];
        
        Cntry=[[UIButton alloc]initWithFrame:CGRectMake(136, 272, 42, 32)]; //120, 186 , 246, 36
        Cntry.layer.borderWidth=0.0f;
 //       UIImage *Cntryimg = [UIImage imageNamed:@"in.png"];
//        
//       UIImage *Cntryimg = [UIImage imageNamed:image];
//        [Cntry setImage:myimge forState:UIControlStateNormal];

        NSString *imagename=[[NSUserDefaults standardUserDefaults]stringForKey:@"image"];
        
        [Cntry setImage:[UIImage imageNamed:imagename] forState:UIControlStateNormal];
        //[Cntry  setBackgroundImage:image forState:UIControlStateNormal];
        [Cntry addTarget:self action:@selector(CountryList) forControlEvents:UIControlEventTouchUpInside];
        [scrol addSubview:Cntry];
        
        flgImg = [[UIImageView alloc]initWithFrame:CGRectMake(136,272,42,32)];
        [scrol addSubview :flgImg];
        
        ////////////********************************* CREATING TEXT FIELD 1 FOR USER NAME ***********************/////////////////////////////////////////
        
        tf1 = [[UITextField alloc] initWithFrame:CGRectMake(106, 331, 242, 45)];//56, ,250
        tf1.textColor = [UIColor whiteColor];
        tf1.backgroundColor=[UIColor clearColor];
        tf1.borderStyle = UITextBorderStyleRoundedRect;
        tf1.font = [UIFont systemFontOfSize:15];
        tf1.text=abc1;

        tf1.placeholder = @"Your Phone Number";
        
        [self.tf1 setFont:boldFont];
        self.tf1.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Your Phone Number"];
        
        [self.tf1 setValue:[UIColor whiteColor]forKeyPath:@"_placeholderLabel.textColor"];
        tf1.layer.cornerRadius=0.0f;
        tf1.leftViewMode = UITextFieldViewModeAlways;
        tf1.autocorrectionType = UITextAutocorrectionTypeNo;
        tf1.keyboardType = UIKeyboardTypePhonePad;
        tf1.returnKeyType = UIReturnKeyNext;
        tf1.borderStyle = UITextBorderStyleNone;
        if (self.tf1.placeholder != nil)
        {
            self.tf1.clearsOnBeginEditing = NO;
        }
        tf1.delegate = self;
        [scrol addSubview:tf1];
        [tf1 release];
        [tf1 resignFirstResponder];
        tf1.tintColor = [UIColor orangeColor];
        
        /////////*************************///////////////////////////////////////////
        
        UIView *lineView2 = [[UIView alloc] initWithFrame:CGRectMake(12, 372, 300,1)]; //0.0f, 92.0f, 320.0f, 360.0f
        lineView2.backgroundColor = [UIColor whiteColor];
        [scrol addSubview:lineView2];
        [lineView2 release];
        
        ////////***********CREATING TEXTFIELD 2 FOR USER NAME****************//////////////////////////////////////////////////////
        
        tf2 = [[UITextField alloc] initWithFrame:CGRectMake(106, 385, 242, 45)];
        tf2.textColor = [UIColor whiteColor];
        tf2.backgroundColor=[UIColor clearColor];
        tf2.borderStyle = UITextBorderStyleRoundedRect;
        tf2.font = [UIFont systemFontOfSize:20];
        tf2.secureTextEntry = YES;
               tf2.text=abc2;
        tf2.placeholder = @"Password";
       
        [self.tf2 setFont:boldFont];
        self.tf2.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Password"];
        
        [self.tf2 setValue:[UIColor whiteColor]forKeyPath:@"_placeholderLabel.textColor"];
        tf2.layer.cornerRadius=0.0f;
        tf2.leftViewMode = UITextFieldViewModeAlways;
        tf2.autocorrectionType = UITextAutocorrectionTypeNo;
        tf2.keyboardType = UIKeyboardTypeDefault;
        tf2.returnKeyType = UIReturnKeyDone;
        tf2.borderStyle = UITextBorderStyleNone;
        if (self.tf2.placeholder != nil)
        {
            self.tf2.clearsOnBeginEditing = NO;
        }
        tf2.delegate = self;
        [scrol addSubview:tf2];
        [tf2 release];
        [tf2 resignFirstResponder];
        tf2.tintColor = [UIColor orangeColor];
        
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(12, 426, 300,1)]; //0.0f, 92.0f, 320.0f, 360.0f
        lineView.backgroundColor = [UIColor whiteColor];
        [scrol addSubview:lineView];
        [lineView release];
        
        shwstatus=[[UILabel alloc]initWithFrame:CGRectMake(32, 196, 220, 40)];//52, 100, 150, 40
        shwstatus.numberOfLines = 1;
        [shwstatus setFont:[UIFont systemFontOfSize:15.0f]];
        shwstatus.text=@"Registered";
        [shwstatus setTextColor:[UIColor greenColor]];
        [scrol addSubview:shwstatus];
        [shwstatus setHidden:NO];

    }
    return self;
}

-(void) clearfun


{
    
    tf1.text=@"";
    tf2.text=@"";
    //   tf3.text=@"";
    //    tf4.text=@"";
    tf6.text=@"";
    //    tf7.text=@"";
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *abc3= [[NSUserDefaults standardUserDefaults] stringForKey:@"Withplus"];

    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(acbackgroundTap)];
    gestureRecognizer.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:gestureRecognizer];
    [gestureRecognizer release];
    
    [[[[self.tabBarController tabBar]items]objectAtIndex:2]setEnabled:TRUE];
    
    arrImage = [[NSArray alloc]init];
    
    UIImageView *ImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,350 ,750)];
    ImgView.image=[UIImage imageNamed:@"background.png"];
    [scrol addSubview:ImgView];
    
//    self.arrImage=@[@"AI.png",@"AM.png",@"AT.png",@"AW.png",@"AZ.png",@"AF.png", @"AL.png",@"DZ.png",@"AS.png",@"AD.png",@"AO.png",@"AR.png",@"AU.png",@"BS.png",@"BD.png",@"BE.png",@"BM.png",@"BT.png",@"BR.png",@"CA.png",@"CN.png",@"CO.png",@"KM.png",@"CR.png",@"CU.png",@"DK.png",@"DJ.png",@"EC.png",@"EG.png",@"ET.png",@"FR.png",@"DE.png",@"GH.png",@"GR.png",@"GY.png",@"HK.png",@"HU.png",@"IN.png",@"ID.png",@"IR.png",@"IQ.png",@"IE.png",@"IL.png",@"IT.png",@"JM.png",@"JP.png",@"KE.png",@"KW.png", @"LB.png",@"LY.png",@"MY.png",@"MV.png",@"MT.png",@"MX.png",@"MN.png",@"NA.png",@"NP.png",@"NL.png",@"NZ.png",@"NG.png",@"OM.png",@"PK.png",@"PA.png",@"PY.png",@"PH.png",@"PL.png",@"PT.png",@"QA.png",@"RO.png",@"RU.png",@"WS.png",@"SA.png",@"RS.png",@"SG.png",@"SO.png",@"ZA.png",@"ES.png",@"LK.png",@"SZ.png",@"CH.png",@"SY.png",@"TW.png",@"TH.png",@"TR.png",@"GB.png",@"UG.png",@"UA.png",@"UY.png",@"US.png",@"UZ.png",@"VE.png",@"VN.png",@"VU.png",@"YE.png",@"ZM.png",@"ZW.png"];
//    
//    self.code=@[@"+1264",@"+374",@"+43",@"+297",@"+994",@"+93",@"+355",@"+213",@"+1684",@"+376",@"+244",@"+54",@"+61",@"+1242",@"+880",@"+32",@"+1441",@"+975",@"+55",@"+1",@"+86",@"+57",@"+269",@"+506",@"+53",@"+45",@"+253",@"+593",@"+20",@"+251",@"+33",@"+49",@"+233",@"+30",@"+592",@"+852",@"+36",@"+91",@"+62",@"+98",@"+964",@"+353",@"+972",@"+39",@"+1876",@"+81",@"+254",@"+965",@"+961",@"+218",@"+60",@"+960",@"+356",@"+52",@"+976",@"+264",@"+977",@"+31",@"+64",@"+234",@"+968",@"+92",@"+507",@"+595",@"+63",@"+48",@"+351",@"+974",@"+40",@"+7",@"+685",@"+966",@"+381",@"+65",@"+252",@"+27",@"+34",@"+94",@"+268",@"+41",@"+963",@"+886",@"+66",@"+90",@"+44",@"+256",@"+380",@"+598",@"+1",@"+998",@"+58",@"+84",@"+678",@"+967",@"+260",@"+263"];
//    
//    self.country=@[@"Anguilla",@"Armenia",@"Austria",@"Aruba",@"Azerbaijan",@"Afghanistan", @"Albania", @"Algeria", @"American Samoa", @"Andorra", @"Angola",@"Argentina",@"Australia ",@"Bahamas",@"Bangladesh",@"Belgium",@"Bermuda",@"Bhutan",@"Brazil",@"Canada", @"China",@"Colombia",@"Comoros",@"Costa Rica",@"Cuba",@"Denmark",@"Djibouti",@"Ecuador",@"Egypt",@"Ethiopia",@"France",@"Germany",@"Ghana",@"Greece",@"Guyana",@"Hong Kong",@"Hungary",@"India",@"Indonesia",@"Iran",@"Iraq",@"Ireland",@"Israel",@"Italy",@"Jamaica",@"Japan",@"Kenya",@"Kuwait",@"Lebanon",@"Libya",@"Malaysia",@"Maldives",@"Malta",@"Mexico",@"Mongolia",@"Namibia",@"Nepal",@"Netherlands",@"New Zealand",@"Nigeria",@"Oman",@"Pakistan",@"Panama",@"Paraguay",@"Philippines",@"Poland",@"Portugal",@"Qatar",@"Romania",@"Russia",@"Samoa",@"Saudi Arabia",@"Serbia",@"Singapore",@"Somalia",@"South Africa",@"Spain",@"Sri Lanka",@"Swaziland",@"Switzerland",@"Syria",@"Taiwan",@"Thailand",@"Turkey",@"U.K.",@"Uganda",@"Ukraine",@"Uruguay",@"USA",@"Uzbekistan",@"Venezuela",@"VietNam",@"Vanuatu",@"Yemen",@"Zambia",@"Zimbabwe"];
    
    self.arrImage=@[@"ai.png",@"am.png",@"at.png",@"aw.png",@"az.png",@"af.png", @"al.png",@"dz.png",@"as.png",@"ad.png",@"ao.png",@"ar.png",@"au.png",@"bs.png",@"bd.png",@"be.png",@"bm.png",@"bt.png",@"br.png",@"ca.png",@"cn.png",@"co.png",@"km.png",@"cr.png",@"cu.png",@"dk.png",@"dj.png",@"ec.png",@"eg.png",@"er.png",@"et.png",@"fr.png",@"de.png",@"gh.png",@"gr.png",@"gy.png",@"hk.png",@"hu.png",@"in.png",@"id.png",@"ir.png",@"iq.png",@"ie.png",@"il.png",@"it.png",@"jm.png",@"jp.png",@"ke.png",@"kw.png", @"lb.png",@"ly.png",@"my.png",@"mv.png",@"ml.png",@"mt.png",@"mx.png",@"mn.png",@"ma.png",@"na.png",@"np.png",@"nl.png",@"nz.png",@"ng.png",@"om.png",@"pk.png",@"pa.png",@"py.png",@"ph.png",@"pl.png",@"pt.png",@"qa.png",@"ro.png",@"ru.png",@"ws.png",@"sa.png",@"rs.png",@"sn.png",@"sg.png",@"so.png",@"za.png",@"es.png",@"lk.png",@"sz.png",@"ch.png",@"sy.png",@"tw.png",@"th.png",@"tr.png",@"gb.png",@"ug.png",@"ua.png",@"uy.png",@"us.png",@"uz.png",@"ve.png",@"vn.png",@"vu.png",@"ye.png",@"zm.png",@"zw.png"];
    
    
    self.code=@[@"+1264",@"+374",@"+43",@"+297",@"+994",@"+93",@"+355",@"+213",@"+1684",@"+376",@"+244",@"+54",@"+61",@"+1242",@"+880",@"+32",@"+1441",@"+975",@"+55",@"+1",@"+86",@"+57",@"+269",@"+506",@"+53",@"+45",@"+253",@"+593",@"+20",@"+291",@"+251",@"+33",/*@"+220",*/@"+49",@"+233",@"+30",@"+592",@"+852",@"+36",@"+91",@"+62",@"+98",@"+964",@"+353",@"+972",@"+39",@"+1876",@"+81",@"+254",@"+965",@"+961",@"+218",@"+60",@"+960",@"+223",@"+356",@"+52",@"+976",@"+212",@"+264",@"+977",@"+31",@"+64",@"+234",@"+968",@"+92",@"+507",@"+595",@"+63",@"+48",@"+351",@"+974",@"+40",@"+7",@"+685",@"+966",@"+381",@"+221",@"+65",@"+252",@"+27",@"+34",@"+94",@"+268",@"+41",@"+963",@"+886",@"+66",@"+90",@"+44",@"+256",@"+380",@"+598",@"+1",@"+998",@"+58",@"+84",@"+678",@"+967",@"+260",@"+263"];
    
    self.country=@[@"Anguilla",@"Armenia",@"Austria",@"Aruba",@"Azerbaijan",@"Afghanistan", @"Albania", @"Algeria", @"American Samoa",       @ "Andorra", @"Angola",@"Argentina",@"Australia",@"Bahamas",@"Bangladesh",@"Belgium",@"Bermuda",@"Bhutan",@"Brazil",@"Canada",@"China",@"Colombia",@"Comoros",@"Costa Rica",@"Cuba",@"Denmark",@"Djibouti",@"Ecuador",@"Egypt",@"Eritrea",@"Ethiopia",@"France",/*@"Gambia",*/@"Germany",@"Ghana",@"Greece",@"Guyana",@"Hong Kong",@"Hungary",@"India",@"Indonesia",@"Iran",@"Iraq",@"Ireland",@"Israel",@"Italy",@"Jamaica",@"Japan",@"Kenya",@"Kuwait",@"Lebanon",@"Libya",@"Malaysia",@"Maldives",@"Mali",@"Malta",@"Mexico",@"Mongolia",@"Morocco",@"Namibia",@"Nepal",@"Netherlands",@"New Zealand",@"Nigeria",@"Oman",@"Pakistan",@"Panama",@"Paraguay",@"Philippines",@"Poland",@"Portugal",@"Qatar",@"Romania",@"Russia",@"Samoa",@"Saudi Arabia",@"Serbia",@"Senegal",@"Singapore",@"Somalia",@"South Africa",@"Spain",@"Sri Lanka",@"Swaziland",@"Switzerland",@"Syria",@"Taiwan",@"Thailand",@"Turkey",@"U.K.",@"Uganda",@"Ukraine",@"Uruguay",@"USA",@"Uzbekistan",@"Venezuela",@"VietNam",@"Vanuatu",@"Yemen",@"Zambia",@"Zimbabwe"];

    NSLog(@"lsit of Flags==%lu",(unsigned long)self.arrImage.count);
    NSLog(@"lsit of country==%lu",(unsigned long)self.country.count);
    NSLog(@"lsit of code==%lu",(unsigned long)self.code.count);
    
//    if (![abc3 isEqualToString:@""]) {
//      
//        NSString *val = abc3;
//        
//        NSString *indx= [code indexOfObject:[NSString stringWithFormat:val]];
//        UIImage *Cntryimg = [UIImage imageNamed:@"in.png"];
//        [Cntry  setBackgroundImage:Cntryimg forState:UIControlStateNormal];
//
//    }
    
}


- (void)acbackgroundTap
{
    
    [tf1 resignFirstResponder];
    [tf2 resignFirstResponder];
}
- (void)keyboardDidShow:(NSNotification *)notification
{
    //Assign new frame to your view
    
    [ self.view setFrame:CGRectMake(0,-90,320,460)]; //here taken -20 for example i.e. your view will be scrolled to -20. change its value according to your requirement.
    
}

-(void)keyboardDidHide:(NSNotification *)notification
{
    [self.view  setFrame:CGRectMake(0,0,320,460)];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [tf1 resignFirstResponder];
    [tf2 resignFirstResponder];
    //    [tf3 resignFirstResponder];
    [tf4 resignFirstResponder];
    //[tf5 resignFirstResponder];
    [tf6 resignFirstResponder];
    //    [tf7 resignFirstResponder];
    return YES;
}


- (void)viewWillAppear:(BOOL)animated
{
    
    
    self.tabBarController.tabBar.hidden=YES;
    [[[[self.tabBarController tabBar]items]objectAtIndex:2]setEnabled:TRUE];
    
    NSString *abc4=[[NSUserDefaults standardUserDefaults] stringForKey:@"didNumber"];
    NSString *abc5=[[NSUserDefaults standardUserDefaults] stringForKey:@"pinbase"];
    NSString *abc6=[[NSUserDefaults standardUserDefaults] stringForKey:@"dmfdelay"];
    NSString *str= btm.titleLabel.text;
    NSLog(@"...%@",str);
    if ([str isEqualToString: @"Pinless"])
    {
        tf6.text=nil;
    }
    else
    {
        tf6.text=abc5;
    }
    
    UIImageView *imgview = [[UIImageView alloc] initWithFrame:CGRectMake(-46.0f, 80.0f, 400.0f, 122.0f)];//320
    imgview.image= [UIImage imageNamed:@"lcd_top.png"];
    [scrol addSubview:imgview];
    
    Label1=[[UILabel alloc]initWithFrame:CGRectMake(25, 160, 150, 40)];
    Label1.text=@"User Name";
    [Label1 setTextColor:[UIColor redColor]];
    Label1.hidden=YES;
    [self.view addSubview:Label1];
    
    Label2=[[UILabel alloc]initWithFrame:CGRectMake(35, 250, 150, 40)];
    
    Label2.text=@"Password";
    [Label2 setTextColor:[UIColor redColor]];
    Label2.hidden=YES;
    [self.view addSubview:Label2];
    
    /// add label for select pin///////
    Label5 = [[UILabel alloc] initWithFrame:CGRectMake(25, 340, 150, 40)];
    Label5.text =@"Pin Type";
    [Label5  setTextColor:[UIColor redColor]];
    Label5.hidden=YES;
    [scrol addSubview:Label5];
    //// add button for drop down///////
    
}

-(void)CountryList
{
    tview =[[UITableView alloc]initWithFrame:CGRectMake(2, 66, 320, 536) style:UITableViewStylePlain]; // , 72 , , 486 (492 , 506)
    [self.view addSubview:tview];
    tview.layer.cornerRadius=12;
    [tview setDataSource:self];
    [tview setDelegate:self];
    [tview reloadData];
    //    [Cntry setTitleColor:[UIColor colorWithRed:0.00 green:0.47 blue:0.57 alpha:1.0] forState:UIControlStateNormal];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [country count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString  *identifier =@"ceee";
    cell =[tableView dequeueReusableCellWithIdentifier:@"identifier"];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    cell.imageView.image = [UIImage imageNamed:[self.arrImage objectAtIndex:indexPath.row]];
    cell.textLabel.text =[self.country objectAtIndex:indexPath.row];
    return cell;}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //  [Cntry setTitle:[self.country objectAtIndex:indexPath.row] forState:UIControlStateNormal];
    //   [Cntry setImage:[UIImage  imageNamed:[self.country
    //                                        objectAtIndex:indexPath.row]]];
    
    [flgImg setImage:[UIImage  imageNamed:[self.arrImage objectAtIndex:indexPath.row]]];
    
    
    Codefield.text=[self.code objectAtIndex:indexPath.row];
    tview.hidden=YES;
    NSUserDefaults *userDef = [NSUserDefaults standardUserDefaults];
    
    NSString *fltr = [Codefield.text substringFromIndex:1];
    
    
    
    
    [userDef setObject:[NSString stringWithFormat:@"%@",fltr] forKey:@"Codeval"];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath


{
    
    
    return 30;
    
}


- (void) Relogin
{
    
    // NSString *server=@"85.25.185.100";
    
    
    
    if ([tf1.text isEqual:@""]&&[tf2.text isEqual:@""]) {
        
        UIAlertView  *alertView5 = [[UIAlertView alloc]
                                    initWithTitle:@"Alert"
                                    message:@"Please enter valid credentials."
                                    delegate:self
                                    cancelButtonTitle:@"OK"
                                    otherButtonTitles: nil];
        
        
        [alertView5 show];
        
    }
    else if ([tf1.text isEqual:@""]) {
        
        UIAlertView  *alertView5 = [[UIAlertView alloc]
                                    initWithTitle:@"Alert"
                                    message:@"Please enter username."
                                    delegate:self
                                    cancelButtonTitle:@"OK"
                                    otherButtonTitles: nil];
        
        
        [alertView5 show];
        
    }
    
    else if ([tf1.text hasPrefix:@"0"]) {
        
        UIAlertView  *alertView5 = [[UIAlertView alloc]
                                    initWithTitle:@"Alert"
                                    message:@"Please enter a valid username without 0."
                                    delegate:self
                                    cancelButtonTitle:@"OK"
                                    otherButtonTitles: nil];
        
        
        [alertView5 show];
        
    }
    
    else if ([tf1.text hasPrefix:@"+"]) {
        
        UIAlertView  *alertView5 = [[UIAlertView alloc]
                                    initWithTitle:@"Alert"
                                    message:@"Please enter a valid username without +."
                                    delegate:self
                                    cancelButtonTitle:@"OK"
                                    otherButtonTitles: nil];
        
        
        [alertView5 show];
        
    }
    else if ([tf2.text isEqual:@""]) {
        
        UIAlertView  *alertView5 = [[UIAlertView alloc]
                                    initWithTitle:@"Alert"
                                    message:@"Please enter password."
                                    delegate:self
                                    cancelButtonTitle:@"OK"
                                    otherButtonTitles: nil];
        
        
        [alertView5 show];
        
    }
    
//    else if ([Codefield.text isEqual:@""]) {
//        
//        UIAlertView  *alertView5 = [[UIAlertView alloc]
//                                    initWithTitle:@"Alert"
//                                    message:@"Please select your country."
//                                    delegate:self
//                                    cancelButtonTitle:@"OK"
//                                    otherButtonTitles: nil];
//        
//        
//        [alertView5 show];
//        
//    }

    else
    {
        if([tf1.text isEqual:@"EMEATEST"]&&[tf2.text isEqual:@"wtn12tm"])
        {
            NSUserDefaults *userDef = [NSUserDefaults standardUserDefaults];
            //NSString *server=@"one.alizeetelecom.com";
            NSString *dtmf = @"2";
            NSString *did = [[NSUserDefaults standardUserDefaults]stringForKey:@"didNumber"];
            //        NSString *did = @"0015672549595";
            [userDef setObject:[NSString stringWithFormat:@"%@",tf1.text] forKey:@"username"];
            [userDef setObject:[NSString stringWithFormat:@"%@",tf2.text] forKey:@"password"];
            [userDef setObject:[NSString stringWithFormat:@"%@",did] forKey:@"didNumber"];
            [userDef setObject:[NSString stringWithFormat:@"%@",@""] forKey:@"pinbase"];
            //[userDef setObject:[NSString stringWithFormat:@"%@",server] forKey:@"server"];
            [userDef setObject:[NSString stringWithFormat:@"%@",dtmf] forKey:@"dmfdelay"];
            [userDef synchronize];
            NSLog(@"mybuttonPressed");
            
            NSUserDefaults *usrdef = [NSUserDefaults standardUserDefaults];
            [usrdef setObject:[NSString stringWithFormat:@"Yes"] forKey:@"Relogin"];
            [usrdef synchronize];
            [self dismissViewControllerAnimated:NO completion:nil];
            
        }
        
//        else if ([shwstatus.text isEqualToString:@"Registration Error - Forbidden"])
//        {
//            
//            NSUserDefaults *userDef = [NSUserDefaults standardUserDefaults];
//            [userDef setObject:[NSString stringWithFormat:@"%@",tf1.text] forKey:@"username"];
//            [userDef setObject:[NSString stringWithFormat:@"%@",tf2.text] forKey:@"password"];
//            [userDef setObject:[NSString stringWithFormat:@"%@",] forKey:@"password"];
//
//        }
        else
        {
            NSString *cv= [[NSUserDefaults standardUserDefaults] stringForKey:@"Codeval"];
            NSString *str2 = [cv stringByAppendingString:tf1.text];

            NSUserDefaults *userDef = [NSUserDefaults standardUserDefaults];
            NSString *server=@"one.alizeetelecom.com";
            NSString *dtmf = @"2";
            NSString *did = [[NSUserDefaults standardUserDefaults]stringForKey:@"didNumber"];
            //        NSString *did = @"0015672549595";
//            [userDef setObject:[NSString stringWithFormat:@"%@",tf1.text] forKey:@"username"];
            
            [userDef setObject:[NSString stringWithFormat:@"%@",str2] forKey:@"username"];

            [userDef setObject:[NSString stringWithFormat:@"%@",tf2.text] forKey:@"password"];
            [userDef setObject:[NSString stringWithFormat:@"%@",did] forKey:@"didNumber"];
            [userDef setObject:[NSString stringWithFormat:@"%@",@""] forKey:@"pinbase"];
            [userDef setObject:[NSString stringWithFormat:@"%@",server] forKey:@"server"];
            [userDef setObject:[NSString stringWithFormat:@"%@",dtmf] forKey:@"dmfdelay"];
            [userDef synchronize];
            NSLog(@"mybuttonPressed");
            
            [app performSelectorOnMainThread:@selector(sipConnect) withObject:nil waitUntilDone:YES];
            [[NSNotificationCenter defaultCenter] addObserver:self
                                                     selector:@selector(processRegState:)
                                                         name: kSIPRegState
                                                       object:nil];
        }
    }
}

-(void)processRegState:(NSNotification *)notification
{
    NSDictionary *dictionary = [notification userInfo];
    if ([[dictionary objectForKey:@"Status"] intValue] == 200 )
    {
       
//        [shwstatus setHidden:NO];
//        [shwstatus setTextColor:[UIColor greenColor]];
//        shwstatus.text = @"Registered";
        NSUserDefaults *usrdef = [NSUserDefaults standardUserDefaults];
        [usrdef setObject:[NSString stringWithFormat:@"Yes"] forKey:@"Relogin"];
        [usrdef synchronize];
        [self dismissViewControllerAnimated:NO completion:nil];
    }
    else
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            
            NSUserDefaults *usrdef = [NSUserDefaults standardUserDefaults];
            [usrdef setObject:[NSString stringWithFormat:@"No"] forKey:@"Relogin"];
            [usrdef synchronize];
            [shwstatus setHidden:NO];
            [shwstatus setTextColor:[UIColor redColor]];
            shwstatus.text = @"Registration Error - Forbidden";
            
        });
    }
}

//- (void) dealloc {
//   // [self.tview setDelegate:nil];
//  //  [self.tableView setDataSource:nil];
//    [tview removeFromSuperview];
//    [super dealloc];
//}

-(void) regster
{
    //    newUserViewController *nw=[[newUserViewController alloc]init];
    //    [self presentViewController:nw animated:NO completion:nil];
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"https://portal.numberonecall.com/signup"]];
}

-(NSString *)URLEncodeString:(NSString*)str
{
    NSMutableString *tempstr = [NSMutableString stringWithString:str];
    [tempstr replaceOccurrencesOfString:@" " withString:@"+" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [tempstr length])];
    return [[NSString stringWithFormat:@"%@",tempstr]stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding];
    
}

-(void) Registerlinkin
{
    NSString *stringurl = [NSString stringWithFormat:@"http://billing.adoreinfotech.co.in/web/paypalflorin.php?pay=1"];
    NSString *abloute = [NSString string];
    abloute = [self URLEncodeString:stringurl];
    NSURL *urlstr1 = [NSURL URLWithString:abloute];
    NSURLRequest *request1 = [NSURLRequest requestWithURL:urlstr1];
    NSData *data2 = [NSURLConnection sendSynchronousRequest:request1 returningResponse:nil error:nil];
    if(data2!=nil)
    {
        NSError *error1;
        NSDictionary *json2 = [NSJSONSerialization JSONObjectWithData:data2 options:kNilOptions error:&error1];
        if(json2!=nil||![json2 isEqual:@""])
        {
            NSString *stausStr = [json2 objectForKey:@"status"];
            if([stausStr isEqual:@"1"])
            {
                newUserViewController *signup = [[newUserViewController alloc]init];
                [self presentViewController:signup animated:NO completion:nil];
            }
            else
            {
                [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"https://portal.numberonecall.com/signin?mobile=1"]];
            }
        }
        else
        {
            
        }
    }
    else
    {
        
    }
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
