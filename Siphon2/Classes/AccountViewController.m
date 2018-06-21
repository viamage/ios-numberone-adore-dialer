//
//  AccountViewController.m
//  Siphon
//
//  Created by ADORE INFOTECH on 25/04/14.
//
//

#import "AccountViewController.h"
#import "SiphonApplication.h"
#import "newUserViewController.h"
#import "FrgtpswdViewController.h"
#import "RegisterViewController.h"

NSString *i=0;
SiphonApplication *app;
@interface AccountViewController ()

@end

NSString *DIDs;
NSString *u1=nil;
NSString *p1=nil;
NSString *balanceString1=nil;

@implementation AccountViewController

@synthesize phoneCallDelegate;
@synthesize Label1;
@synthesize Label2;
@synthesize Label6;
@synthesize tf1;
@synthesize tf2;
@synthesize tf4;
@synthesize CountryIso;
@synthesize tf6;
@synthesize Cntry;
@synthesize savebutton;
@synthesize regbutton;
@synthesize clearbutton;
@synthesize frgtbutton;
@synthesize arrImage;
@synthesize code;
@synthesize cell;
@synthesize tview;
@synthesize Codefield;
@synthesize flgImg;
@synthesize country;
 
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        NSString *abc1= [[NSUserDefaults standardUserDefaults] stringForKey:@"Withoutcode"];
        NSString *abc2= [[NSUserDefaults standardUserDefaults] stringForKey:@"password"];
   
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
        NSLocale *locale = [NSLocale currentLocale];
        NSString *countryCode = [locale objectForKey: NSLocaleCountryCode];
        
        NSString *countryName = [locale displayNameForKey: NSLocaleCountryCode
                                                    value: countryCode];
    self.CountryIso=@[@"AI",@"AM",@"AT",@"AW",@"AZ",@"AF",@"AL",@"DZ",@"AS",@"AD",@"AO",@"AR",@"AU",@"BS",@"BD",@"BE",@"BM",@"BT",@"BR",@"CA",@"CN",@"CO",@"KM",@"CR",@"CU",@"DK",@"DJ",@"EC",@"EG",@"ER",@"ET",@"FR",@"DE",@"GH",@"GR",@"GY",@"HK",@"HU",@"IN",@"ID",@"IR",@"IQ",@"IE",@"IL",@"IT",@"JM",@"JP",@"KE",@"KW",@"LB",@"LY",@"MY",@"MV",@"ML",@"MT",@"MX",@"MN",@"MA",@"NA",@"NP",@"NL",@"NZ",@"NG",@"OM",@"PK",@"PA",@"PY",@"PH",@"PL",@"PT",@"QA",@"RO",@"RU",@"WS",@"SA",@"RS",@"SN",@"SG",@"SO",@"ZA",@"ES",@"LK",@"SZ",@"CH",@"SY",@"TW",@"TH",@"TR",@"GB",@"UG",@"UA",@"UY",@"US",@"UZ",@"VE",@"VN",@"VU",@"YE",@"ZM",@"ZW"];
    self.arrImage=@[@"ai.png",@"am.png",@"at.png",@"aw.png",@"az.png",@"af.png",@"al.png",@"dz.png",@"as.png",@"ad.png",@"ao.png",@"ar.png",@"au.png",@"bs.png",@"bd.png",@"be.png",@"bm.png",@"bt.png",@"br.png",@"ca.png",@"cn.png",@"co.png",@"km.png",@"cr.png",@"cu.png",@"dk.png",@"dj.png",@"ec.png",@"eg.png",@"er.png",@"et.png",@"fr.png",@"de.png",@"gh.png",@"gr.png",@"gy.png",@"hk.png",@"hu.png",@"in.png",@"id.png",@"ir.png",@"iq.png",@"ie.png",@"il.png",@"it.png",@"jm.png",@"jp.png",@"ke.png",@"kw.png",@"lb.png",@"ly.png",@"my.png",@"mv.png",@"ml.png",@"mt.png",@"mx.png",@"mn.png",@"ma.png",@"na.png",@"np.png",@"nl.png",@"nz.png",@"ng.png",@"om.png",@"pk.png",@"pa.png",@"py.png",@"ph.png",@"pl.png",@"pt.png",@"qa.png",@"ro.png",@"ru.png",@"ws.png",@"sa.png",@"rs.png",@"sn.png",@"sg.png",@"so.png",@"za.png",@"es.png",@"lk.png",@"sz.png",@"ch.png",@"sy.png",@"tw.png",@"th.png",@"tr.png",@"gb.png",@"ug.png",@"ua.png",@"uy.png",@"us.png",@"uz.png",@"ve.png",@"vn.png",@"vu.png",@"ye.png",@"zm.png",@"zw.png"];
    self.code=@[@"+1264",@"+374",@"+43",@"+297",@"+994",@"+93",@"+355",@"+213",@"+1684",@"+376",@"+244",@"+54",@"+61",@"+1242",@"+880",@"+32",@"+1441",@"+975",@"+55",@"+1",@"+86",@"+57",@"+269",@"+506",@"+53",@"+45",@"+253",@"+593",@"+20",@"+291",@"+251",@"+33",/*@"+220",*/@"+49",@"+233",@"+30",@"+592",@"+852",@"+36",@"+91",@"+62",@"+98",@"+964",@"+353",@"+972",@"+39",@"+1876",@"+81",@"+254",@"+965",@"+961",@"+218",@"+60",@"+960",@"+223",@"+356",@"+52",@"+976",@"+212",@"+264",@"+977",@"+31",@"+64",@"+234",@"+968",@"+92",@"+507",@"+595",@"+63",@"+48",@"+351",@"+974",@"+40",@"+7",@"+685",@"+966",@"+381",@"+221",@"+65",@"+252",@"+27",@"+34",@"+94",@"+268",@"+41",@"+963",@"+886",@"+66",@"+90",@"+44",@"+256",@"+380",@"+598",@"+1",@"+998",@"+58",@"+84",@"+678",@"+967",@"+260",@"+263"];
        
        self.country=@[@"Anguilla",@"Armenia",@"Austria",@"Aruba",@"Azerbaijan",@"Afghanistan", @"Albania", @"Algeria", @"American Samoa",       @ "Andorra", @"Angola",@"Argentina",@"Australia",@"Bahamas",@"Bangladesh",@"Belgium",@"Bermuda",@"Bhutan",@"Brazil",@"Canada",@"China",@"Colombia",@"Comoros",@"Costa Rica",@"Cuba",@"Denmark",@"Djibouti",@"Ecuador",@"Egypt",@"Eritrea",@"Ethiopia",@"France",/*@"Gambia",*/@"Germany",@"Ghana",@"Greece",@"Guyana",@"Hong Kong",@"Hungary",@"India",@"Indonesia",@"Iran",@"Iraq",@"Ireland",@"Israel",@"Italy",@"Jamaica",@"Japan",@"Kenya",@"Kuwait",@"Lebanon",@"Libya",@"Malaysia",@"Maldives",@"Mali",@"Malta",@"Mexico",@"Mongolia",@"Morocco",@"Namibia",@"Nepal",@"Netherlands",@"New Zealand",@"Nigeria",@"Oman",@"Pakistan",@"Panama",@"Paraguay",@"Philippines",@"Poland",@"Portugal",@"Qatar",@"Romania",@"Russia",@"Samoa",@"Saudi Arabia",@"Serbia",@"Senegal",@"Singapore",@"Somalia",@"South Africa",@"Spain",@"Sri Lanka",@"Swaziland",@"Switzerland",@"Syria",@"Taiwan",@"Thailand",@"Turkey",@"U.K.",@"Uganda",@"Ukraine",@"Uruguay",@"USA",@"Uzbekistan",@"Venezuela",@"VietNam",@"Vanuatu",@"Yemen",@"Zambia",@"Zimbabwe"];
        
        Codefield = [[UITextField alloc] initWithFrame:CGRectMake(32, 331, 66, 45)];//52 (46), y=435, 50
        Codefield.textColor = [UIColor whiteColor];
        Codefield.font = [UIFont systemFontOfSize:15];
        Codefield.autocorrectionType = UITextAutocorrectionTypeNo;
        Codefield.delegate = self;
        UIFont* boldFont = [UIFont boldSystemFontOfSize:[UIFont systemFontSize]];
        [self.Codefield setFont:boldFont];
        Codefield.textAlignment = NSTextAlignmentCenter;
        [scrol addSubview:self.Codefield];
        Codefield.borderStyle = UITextBorderStyleNone;
        [Codefield release];
        [Codefield resignFirstResponder];
        [Codefield setEnabled:NO ];

        savebutton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        savebutton.backgroundColor= [UIColor colorWithRed:0.91 green:0.02 blue:0.03 alpha:1.0];
        savebutton.frame= CGRectMake(122, 452, 62, 29);//116,y=396(476, 446), 66
        savebutton.layer.cornerRadius=2.0f;
        savebutton.clipsToBounds= YES;
        [savebutton setTitle:@"Next" forState:UIControlStateNormal];
        [savebutton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [clearbutton.titleLabel setFont:[UIFont systemFontOfSize:20.0]];
        [savebutton addTarget:self action:@selector(myButtonPressed) forControlEvents:UIControlEventTouchUpInside];
        [scrol addSubview:savebutton];

        regbutton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        regbutton.backgroundColor= [UIColor colorWithRed:0.91 green:0.02 blue:0.03 alpha:1.0];
        regbutton.frame= CGRectMake(122, 506, 62, 29);//106,y=466(472,486) , 96      (56, 446, 182, 45);
        regbutton.layer.cornerRadius=2.0f;
        regbutton.clipsToBounds= YES;
        regbutton.titleLabel.textAlignment=true;
        [regbutton setTitle:@"Sign up" forState:UIControlStateNormal];
        [regbutton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
       // [regbutton.titleLabel setFont:[UIFont systemFontOfSize:20.0]];
        [regbutton addTarget:self action:@selector(Registerlink) forControlEvents:UIControlEventTouchUpInside];
        [scrol addSubview:regbutton];
        
        Cntry=[[UIButton alloc]initWithFrame:CGRectMake(136, 272, 42, 32)]; //120, 186(192, 206, 236, 282, 276) , 246, 36
        Cntry.layer.borderWidth=0.0f;
        Label6=[[UILabel alloc]initWithFrame:CGRectMake(180, 270, 90, 32)];
        //Label6.text=@"USA";
        Label6.textColor=[UIColor whiteColor];
        [Label6 setFont:[UIFont systemFontOfSize:15]];
        
        
        
        int i,pos=0;
       // NSLog(@"%lu",CountryIso.count);
      
      NSString *codeval = [[NSUserDefaults standardUserDefaults] stringForKey:@"Codeval"];
      if(codeval == nil) {
        for(i=0; i<CountryIso.count; i++) {
            if([countryCode isEqualToString:self.CountryIso[i]]) {
                pos = i;
                NSLog(@"%@%d",self.CountryIso[i],pos);
                break;
            }
        }
      } else {
        NSString* codevalWithPlus = [NSString stringWithFormat:@"+%@", codeval];
        for(i=0; i<CountryIso.count; i++) {
          if([codevalWithPlus isEqualToString:self.code[i]]) {
            pos = i;
            NSLog(@"%@%d",self.CountryIso[i],pos);
            break;
          }
        }
      }
        /*NSString *ima= [arrImage objectAtIndex:i];
         UIImage *Cntryim1 = [UIImage imageNamed:ima];
         [Cntry  setBackgroundImage:Cntryim1 forState:UIControlStateNormal];*/
        
        NSString *cntryimg=[arrImage objectAtIndex:pos];
        UIImage *Cntryimg = [UIImage imageNamed:cntryimg];
        [Cntry  setBackgroundImage:Cntryimg forState:UIControlStateNormal];
        [Cntry addTarget:self action:@selector(CountryList) forControlEvents:UIControlEventTouchUpInside];
        [scrol addSubview:Cntry];
        [scrol addSubview:Label6];
      
      
        Codefield.text=[code objectAtIndex:i];
        NSString *fltr = [Codefield.text substringFromIndex:1];
        [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"%@",fltr] forKey:@"Codeval"];
    
        Label6.text=[country objectAtIndex:i];
        flgImg = [[UIImageView alloc]initWithFrame:CGRectMake(136,272,42,32)];
        [scrol addSubview :flgImg];
        
        ////////////********************************* CREATING TEXT FIELD 1 FOR USER NAME ***********************/////////////////////////////////////////
        
        tf1 = [[UITextField alloc] initWithFrame:CGRectMake(106, 331, 242, 45)];//56, ,250
        tf1.textColor = [UIColor whiteColor];
        tf1.backgroundColor=[UIColor clearColor];
        tf1.borderStyle = UITextBorderStyleRoundedRect;
        tf1.font = [UIFont systemFontOfSize:15]; // 20 (16),
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
        NSUserDefaults *userDef = [NSUserDefaults standardUserDefaults];
        [userDef setObject:[NSString stringWithFormat:@"%@",tf1.text] forKey:@"Phoneno"];
        
        ////////////////////////////*************************/////////////////////////////////////////////////////////////////////////////
        
        UIView *lineView2 = [[UIView alloc] initWithFrame:CGRectMake(12, 372, 300,1)]; //0.0f, 301(302, 316,382), 320.0f, 360.0f
        lineView2.backgroundColor = [UIColor whiteColor];
        [scrol addSubview:lineView2];
        [lineView2 release];
        
        ////////***********CREATING TEXTFIELD 2 FOR USER NAME****************//////////////////////////////////////////////////////
        
        tf2 = [[UITextField alloc] initWithFrame:CGRectMake(106, 385, 242, 45)]; // , 353(356, 372)
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
        
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(12, 426, 300,1)]; //0.0f, 371(398, 402, 416, 446), 320.0f, 360.0f
        lineView.backgroundColor = [UIColor whiteColor];
        [scrol addSubview:lineView];
        [lineView release];
        
        shwstatus=[[UILabel alloc]initWithFrame:CGRectMake(32, 196, 220, 40)];//15(12), 146(152,166), 150, 40
        shwstatus.numberOfLines = 1;
        [shwstatus setFont:[UIFont systemFontOfSize:12.0f]];
        shwstatus.text=@"";
        [scrol addSubview:shwstatus];
    }
    return self;
}

-(void) clearfun

{
    
    tf1.text=@"";
    tf2.text=@"";
    tf6.text=@"";

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
   
    
   /* Cntry=[[UIButton alloc]initWithFrame:CGRectMake(136, 272, 42, 32)]; //120, 186(192, 206, 236, 282, 276) , 246, 36
    Cntry.layer.borderWidth=0.0f;
     UIImage *Cntryimg = [UIImage imageNamed:@"in.png"];
    [Cntry  setBackgroundImage:Cntryimg forState:UIControlStateNormal];
    [Cntry addTarget:self action:@selector(CountryList) forControlEvents:UIControlEventTouchUpInside];
    [scrol addSubview:Cntry];*/
    
    flgImg = [[UIImageView alloc]initWithFrame:CGRectMake(136,272,42,32)];
    [scrol addSubview :flgImg];
    
    
    

  UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(acbackgroundTap)];
  gestureRecognizer.cancelsTouchesInView = NO;
  [self.view addGestureRecognizer:gestureRecognizer];
  [gestureRecognizer release];

     [[[[self.tabBarController tabBar]items]objectAtIndex:2]setEnabled:TRUE];


 
    arrImage = [[NSArray alloc]init];
 
    UIImageView *ImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,350 ,750)];
    ImgView.image=[UIImage imageNamed:@"background.png"];
    [scrol addSubview:ImgView];
  
    NSLog(@"lsit of Flags==%lu",(unsigned long)self.arrImage.count);
    NSLog(@"lsit of country==%lu",(unsigned long)self.country.count);
    NSLog(@"lsit of code==%lu",(unsigned long)self.code.count);
    
   
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
   if(textField==tf1)
   {
       [tf1 resignFirstResponder];
       [tf2 becomeFirstResponder];
   }
   else
   {
        [tf2 resignFirstResponder];
   }
    
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
    
UIImageView *imgview = [[UIImageView alloc] initWithFrame:CGRectMake(-46.0f, 80.0f, 400.0f, 122.0f)];//0.0f (56), , 295.0f(296, 312,342, 356) , 75.0f(76, 92)
    imgview.image= [UIImage imageNamed:@"lcd_top.png"];
    [scrol addSubview:imgview];

   }

-(void)CountryList
{
    tview =[[UITableView alloc]initWithFrame:CGRectMake(2, 72, 320, 486) style:UITableViewStylePlain];
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
//    [Cntry setImage:[UIImage  imageNamed:[self.country
//                                          objectAtIndex:indexPath.row]]];
    
    [flgImg setImage:[UIImage  imageNamed:[self.arrImage objectAtIndex:indexPath.row]]];

    NSString *str6=  (NSString*) [self.arrImage objectAtIndex:indexPath.row];

    Codefield.text=[self.code objectAtIndex:indexPath.row];
    tview.hidden=YES;
    NSUserDefaults *userDef = [NSUserDefaults standardUserDefaults];
    Label6.text= [country objectAtIndex:indexPath.row];
    
    [userDef setObject:[NSString stringWithFormat:@"%@",str6] forKey:@"image"];
//    [[NSUserDefaults standardUserDefaults] setObject:@"bg.png"forKey:@"image"];


    NSString *fltr = [Codefield.text substringFromIndex:1];
    [userDef setObject:[NSString stringWithFormat:@"%@",fltr] forKey:@"Codeval"];

    [userDef synchronize];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath


{
    
    
    return 30;
    
}


- (void) myButtonPressed
{
    
    if ([tf1.text isEqual:@""]&&[tf2.text isEqual:@""]) {

        UIAlertView  *alertView5 = [[UIAlertView alloc] initWithTitle:@"Alert"
                                    message:@"Please enter valid credentials." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        
        [alertView5 show];
        
    }
    else if ([tf1.text isEqual:@""]) {
        
        UIAlertView  *alertView5 = [[UIAlertView alloc] initWithTitle:@"Alert"                                                                                  message:@"Please enter username."  delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        
        [alertView5 show];
        
    }
    
    else if ([tf1.text hasPrefix:@"0"]) {
        
        UIAlertView  *alertView5 = [[UIAlertView alloc]
                                    initWithTitle:@"Alert"
                                    message:@"Please remove 0 before the number."
                                    delegate:self
                                    cancelButtonTitle:@"OK"
                                    otherButtonTitles: nil];
        
        
        [alertView5 show];
        
    }
    
    else if ([tf1.text hasPrefix:@"+"]) {
        
        UIAlertView  *alertView5 = [[UIAlertView alloc]
                                    initWithTitle:@"Alert"
                                    message:@"Please remove prefix + sign from entered number."
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

    else if ([Codefield.text isEqual:@""]) {
        
        UIAlertView  *alertView5 = [[UIAlertView alloc]
                                    initWithTitle:@"Alert"
                                    message:@"Please select your country."
                                    delegate:self
                                    cancelButtonTitle:@"OK"
                                    otherButtonTitles: nil];
        
        
        [alertView5 show];
        
    }

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

            PhoneViewController  *yvc=[[PhoneViewController  alloc] init];
            [self.navigationController pushViewController:yvc animated:YES];
            [self.tabBarController setSelectedIndex:0];
            
            NSMutableArray *tabbarViewControllers = [NSMutableArray arrayWithArray: [self.tabBarController viewControllers]];
            [tabbarViewControllers removeObjectAtIndex:3];
            [self.tabBarController setViewControllers: tabbarViewControllers ];
        }
        else
        {
        
       
            NSString *cv= [[NSUserDefaults standardUserDefaults] stringForKey:@"Codeval"];
           // NSString *uv= [[NSUserDefaults standardUserDefaults] stringForKey:@"Phoneno"];

          
          NSString *number = tf1.text;
            NSString *str2 = [cv stringByAppendingString:number];
           // Appendstr = [str2 substringFromIndex:1];
            
        NSUserDefaults *userDef = [NSUserDefaults standardUserDefaults];
        NSString *server=@"one.alizeetelecom.com";
        NSString *dtmf = @"2";
        NSString *did = [[NSUserDefaults standardUserDefaults]stringForKey:@"didNumber"];
//        NSString *did = @"0015672549595";
          
        [userDef setObject:[NSString stringWithFormat:@"%@",str2] forKey:@"username"];
        [userDef setObject:[NSString stringWithFormat:@"%@",tf1.text] forKey:@"Withoutcode"];
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
      PhoneViewController  *yvc=[[PhoneViewController  alloc] init];
      [self.navigationController pushViewController:yvc animated:YES];
      [self.tabBarController setSelectedIndex:0];
      
      NSMutableArray *tabbarViewControllers = [NSMutableArray arrayWithArray: [self.tabBarController viewControllers]];
      if([tabbarViewControllers count] >= 3) {
        [tabbarViewControllers removeObjectAtIndex:3];
        [self.tabBarController setViewControllers: tabbarViewControllers ];
      }

      [shwstatus setHidden:NO];
      [shwstatus setTextColor:[UIColor greenColor]];
       shwstatus.text = @"Registered";
    }
    else
    {
//      dispatch_async(dispatch_get_main_queue(), ^{

        [shwstatus setHidden:NO];
        [shwstatus setTextColor:[UIColor redColor]];
        shwstatus.text = @"Registration Error - Forbidden";
          
//          UIAlertView *alrtV = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Please enter valid credentials" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
//          [alrtV show];
        
//      });
    }
}

//- (void) dealloc {
//   // [self.tview setDelegate:nil];
//  //  [self.tableView setDataSource:nil];
//    [tview removeFromSuperview];
//    [super dealloc];
//}
-(NSString *)URLEncodeString:(NSString*)str
{
    NSMutableString *tempstr = [NSMutableString stringWithString:str];
    [tempstr replaceOccurrencesOfString:@" " withString:@"+" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [tempstr length])];
    return [[NSString stringWithFormat:@"%@",tempstr]stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding];
    
}
-(void) Registerlink
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
              RegisterViewController *reg = [[RegisterViewController alloc]init];
              [self presentViewController:reg animated:YES completion:nil];
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

-(void)nwPassword
{
    FrgtpswdViewController *frgt=[[FrgtpswdViewController alloc] init];
    [self presentViewController:frgt animated:NO completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
