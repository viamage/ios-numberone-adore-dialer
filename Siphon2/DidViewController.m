//
//  DidViewController.m
//  Siphon
//
//  Created by Issac Newton on 31/05/17.
//
//

#import "DidViewController.h"
#import "XMLReader.h"

unsigned long selectedindex;
int state = 1;
NSString *didvalue;

@implementation DidViewController
@synthesize enblcall;
@synthesize phoneCallDelegate;
@synthesize Clist;
@synthesize Fullarray;
@synthesize CntryNames;
@synthesize DIDNumbrs;
-(id)init
{
  [super init];
//  scrol =[[ UIScrollView alloc] initWithFrame:CGRectMake(0,0,350 ,530) ];
//  scrol.minimumZoomScale=0.5;
//  scrol.maximumZoomScale=6.0;
//
//  scrol.contentSize=CGSizeMake(200,650) ;//320,200
//
//  [ self.view addSubview:scrol];
  return self;
}

-(void)viewWillAppear:(BOOL)animated
{
  [super viewWillAppear:animated];
    
    UIView *viewBack = [[UIView alloc]initWithFrame:CGRectMake(0, 20, 350, 560)];
    viewBack.backgroundColor = [UIColor blackColor];
    [self.view addSubview:viewBack];
    Fullarray = [[NSMutableArray alloc]init];
//    self.CntryNames = @[@"AUSTRIA",@"ANI AUSTRIA",@"BELGIUM",@"CANADA",@"CYPRUS",@"FINLAND",@"FRANCE",@"GERMANY",@"GREECE",@"INDIA",@"IRELAND",@"ITALY",@"MALTA",@"NETHERLANDS",@"ROMANIA TELEKOM",@"ROMANIA ORANGE9",@"ROMANIA ORANGE",@"ROMANIA VODAFONE",@"POLAND",@"SPAIN",@"SWITZERLAND",@"TURKEY",@"UK",@"USA",@"ROMANIA"];
    CntryNames = [[NSMutableArray alloc]init];
//    self.DIDNumbrs = @[@"+431253022432",@"+40374337216",@"+3235009392",@"+16475032850",@"+35724000361",@"+358974790011",@"+33170069889",@"+49211361894722",@"+302111983955",@"+911171279007",@"+35314373285",@"+390645200147",@"+35627780352",@"+31202620339",@"+40213039730",@"+40374337216",@"+40374337217",@"+40372128620",@"+48221168155",@"+34910807961",@"+41225550261",@"+908503901931",@"+442078626345",@"+1989898",@"+1989898"];
    DIDNumbrs = [[NSMutableArray alloc]init];
    
  checkbox = [[UIButton alloc] initWithFrame:CGRectMake(12, 52, 22, 22)];
  [checkbox addTarget:self action:@selector(checkboxSelected:) forControlEvents:UIControlEventTouchUpInside];
  checkbox.layer.borderColor = [UIColor grayColor].CGColor;
  checkbox.layer.borderWidth = 1.0f;
  [self.view addSubview:checkbox];

  enblcall=[[UILabel alloc]initWithFrame:CGRectMake(42, 41, 218, 40)];
  enblcall.text=@"Enable call without internet";
  [enblcall setTextColor:[UIColor whiteColor]];
  //first.hidden=YES;
  [self.view addSubview:enblcall];

  Clist=[[UILabel alloc]initWithFrame:CGRectMake(0, 79, 320, 46)];
  Clist.text=@"Country List";
  [Clist setTextColor:[UIColor blackColor]];
  Clist.backgroundColor = [UIColor colorWithRed:0.71 green:0.09 blue:0.10 alpha:1.0];
  Clist.textAlignment = NSTextAlignmentCenter;
  [self.view addSubview:Clist];
    
   
    NSString *kplogin= [[NSUserDefaults standardUserDefaults] stringForKey:@"slctval"];
   if([kplogin isEqual:@"1"])
    {
        
        [checkbox setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"check1.png"]]];
        state++;
        
        NSUserDefaults *userDef = [NSUserDefaults standardUserDefaults];
        [userDef setObject:[NSString stringWithFormat:@"%@",@"1"] forKey:@"slctval"];
        [userDef synchronize];
        
    }
    else
    {
        [checkbox setBackgroundColor:[UIColor clearColor]];
        state++;
        
        NSUserDefaults *userDef = [NSUserDefaults standardUserDefaults];
        [userDef setObject:[NSString stringWithFormat:@"%@",@"0"] forKey:@"slctval"];
        [userDef synchronize];
        
        
    }

  NSString *str1;
  str1=[NSString stringWithFormat:@"http://91.212.52.5/access_ani.xml"];
  
  NSString *absoluteURl1=[NSString string];

  absoluteURl1=[self URLEncodeString:str1];

  NSURL *url1=[[NSURL alloc]initWithString:absoluteURl1];

    NSMutableURLRequest *request1 = [[NSMutableURLRequest alloc]
                                    initWithURL:url1
                                    cachePolicy:NSURLRequestReloadIgnoringLocalCacheData
                                    timeoutInterval:30];

  NSData *data1 = [NSURLConnection sendSynchronousRequest:request1

                                        returningResponse:nil error:nil];
    
    
  if (data1==nil) {
    UIAlertView *alert78 = [[UIAlertView alloc]
                            initWithTitle:@"Alert"
                            message:@"Please Make sure you have a Working Internet Connection."
                            delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles: Nil];


    [alert78 show];




  }
  else
  {
    NSString *accessStrng = [[NSString alloc] initWithData:data1

                                             encoding:NSASCIIStringEncoding];
    NSLog(@"ACCESS NUMBERS= %@",accessStrng);
     
        NSError *er;
      NSDictionary* xmlDict = [XMLReader dictionaryForXMLString:accessStrng error:&er];
       NSLog(@"ACCESS NUMBERS Dictionary 1 = %@",xmlDict);
      if(xmlDict!=nil||![xmlDict isEqual:@""])
      {
          NSDictionary *dialeracc = [xmlDict objectForKey:@"DialerAccessNumbers"];
          NSLog(@"ACCESS NUMBERS Dictionary 2 = %@",dialeracc);
        
          Fullarray = [dialeracc valueForKey:@"AccessNumber"];
          NSLog(@"ACCESS NUMBERS Dictionary 3 = %@",Fullarray);
          unsigned long accCount = (unsigned long)[Fullarray count];
          NSLog(@"Dictionary3 %lu",accCount);
         
          int i;
          for(i=0;i<accCount;i++)
          {
              NSMutableDictionary *dictionay = [Fullarray objectAtIndex:i];
              NSLog(@"Dictionary %d %@",i,dictionay);
              
              NSMutableDictionary *cntryDic = [dictionay objectForKey:@"Country"];
              NSLog(@"Dictionary %@",cntryDic);
              NSString *text = [cntryDic objectForKey:@"text"];
              NSLog(@"Text Value 1 %@",text);
              [CntryNames addObject:text];
              
              NSMutableDictionary *nmbrDic = [dictionay objectForKey:@"Number"];
              NSLog(@"Dictionary %@",nmbrDic);
              NSString *number = [nmbrDic objectForKey:@"text"];
              NSLog(@"Text Value 2 %@",number);
              [DIDNumbrs addObject:number];
          }
      }
      else
      {
          UIAlertView *alrt = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"No response." delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
          [alrt show];
      }
    }
  tview = [[UITableView alloc]initWithFrame:CGRectMake(0, 126, 320,406) style: UITableViewStylePlain];
  tview.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth ;
  tview.delegate = self;
  tview.dataSource = self;
  [tview reloadData];
  tview.backgroundColor = [UIColor blackColor];
  [self.view addSubview:tview];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return [DIDNumbrs count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  static NSString  *identifier =@"ceee";
  cell =[tableView dequeueReusableCellWithIdentifier:@"identifier"];

  if (cell == nil)
  {
    cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];

  }
    NSArray *charctrArray = [[CntryNames objectAtIndex:indexPath.row] componentsSeparatedByString:@" "];
    NSLog(@"array %@",charctrArray);
    NSLog(@"array count %lu",(unsigned long)[charctrArray count]);
    NSString *didnmr = [charctrArray objectAtIndex:[charctrArray count]-1];
     NSLog(@"array1 %@",didnmr);
    NSString *cntryname1 = [charctrArray objectAtIndex:[charctrArray count]-2];
     NSLog(@"array2 %@",cntryname1);
    NSString *cntrname2 = [charctrArray objectAtIndex:[charctrArray count]-3];
    NSLog(@"array3 %@",cntrname2);
    NSString *cntrname3 = [charctrArray objectAtIndex:[charctrArray count]-4];
    NSLog(@"array4 %@",cntrname3);
    NSString *mainString;
    NSCharacterSet *notAllowedChars = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789+"] invertedSet];
    NSRange  range = [didnmr rangeOfCharacterFromSet:notAllowedChars];
    if (NSNotFound != range.location)
    {
        if(![cntrname3 isEqual:@""])
        {
            if(![cntrname2 isEqual:@""]&&![cntryname1 isEqual:@""])
            {
                mainString = [[[[[[cntrname3 stringByAppendingString:@" "]stringByAppendingString:cntrname2]stringByAppendingString:@" "]stringByAppendingString:cntryname1]stringByAppendingString:@" "]stringByAppendingString:didnmr];
                
            }
            else if(![cntryname1 isEqual:@""]&&[cntrname2 isEqual:@""])
            {
               mainString = [[[[cntrname3 stringByAppendingString:@" "]stringByAppendingString:cntryname1]stringByAppendingString:@" "]stringByAppendingString:didnmr];
            }
            else
            {
                mainString = [[cntrname3 stringByAppendingString:@" "]stringByAppendingString:didnmr];
            }
           
        }
        else if(![cntrname2 isEqual:@""])
        {
            if(![cntryname1 isEqual:@""])
            {
                mainString = [[[[cntrname2 stringByAppendingString:@" "]stringByAppendingString:cntryname1]stringByAppendingString:@" "]stringByAppendingString:didnmr];
            }
            else
            {
                mainString = [[cntrname2 stringByAppendingString:@" "]stringByAppendingString:didnmr];
            }
        }
        else if(![cntryname1 isEqual:@""])
        {
            mainString = [[cntryname1 stringByAppendingString:@" "]stringByAppendingString:didnmr];
        }
        else
        {
            mainString = didnmr;
        }
       
        
    }
    else
    {
        if(![cntrname3 isEqual:@""])
        {
            if(![cntrname2 isEqual:@""]&&![cntryname1 isEqual:@""])
            {
                mainString = [[[[cntrname3 stringByAppendingString:@" "]stringByAppendingString:cntrname2]stringByAppendingString:@" "]stringByAppendingString:cntryname1];
            }
            else if(![cntryname1 isEqual:@""]&&[cntrname2 isEqual:@""])
            {
                mainString = [[cntrname3 stringByAppendingString:@" "]stringByAppendingString:cntryname1];
            }
            else
            {
                mainString = cntrname3;
            }
            
        }
        else if(![cntrname2 isEqual:@""])
        {
            if(![cntryname1 isEqual:@""])
            {
                mainString = [[cntrname2 stringByAppendingString:@" "]stringByAppendingString:cntryname1];
            }
            else
            {
                mainString = cntryname1;
            }
        }
        else if(![cntryname1 isEqual:@""])
        {
            mainString = cntryname1;
        }
        else
        {
            mainString = cntryname1;
        }
    }
   
//    if(![cntrname3 isEqual:@""])
//    {
//        mainString = [[[[cntrname3 stringByAppendingString:@" "]stringByAppendingString:cntrname2]stringByAppendingString:@" "]stringByAppendingString:cntryname1];
//    }
//    else
//    {
//        mainString = [[cntrname2 stringByAppendingString:@" "]stringByAppendingString:cntryname1];
//    }
    
    cell.textLabel.text = mainString;
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.backgroundColor = [UIColor blackColor];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

  if (indexPath.row == selectedindex) {
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
  }
  else
  {
    cell.accessoryType = UITableViewCellAccessoryNone;
  }

  return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

  selectedindex = indexPath.row ;
  [tableView reloadData];

    NSCharacterSet *notAllowedChars = [[NSCharacterSet characterSetWithCharactersInString:@"+0123456789"] invertedSet];
    
    NSString *didNumber =  [[[DIDNumbrs objectAtIndex:selectedindex] componentsSeparatedByCharactersInSet:notAllowedChars]componentsJoinedByString:@""];
  NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
  [user setObject:[NSString stringWithFormat:@"%@",didNumber]forKey:@"didNumber"];
  [user synchronize];


  NSString *accessmsg = [NSString stringWithFormat:@"You have selected %@ for access number",[DIDNumbrs objectAtIndex:selectedindex]];

  UIAlertView *alrtview = [[UIAlertView alloc]initWithTitle:@"Status" message:accessmsg delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
  [alrtview show];
    
  tview.hidden=YES;
  [self dismissViewControllerAnimated:NO completion:nil];


}

-(void)checkboxSelected:(id)sender{
 if (state%2!=0)
  {

    [checkbox setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"check1.png"]]];
    state++;

    NSUserDefaults *userDef = [NSUserDefaults standardUserDefaults];
    [userDef setObject:[NSString stringWithFormat:@"%@",@"1"] forKey:@"slctval"];
    [userDef synchronize];

}
  else
  {
     [checkbox setBackgroundColor:[UIColor clearColor]];
    state++;

    NSUserDefaults *userDef = [NSUserDefaults standardUserDefaults];
    [userDef setObject:[NSString stringWithFormat:@"%@",@"0"] forKey:@"slctval"];
    [userDef synchronize];


  }

}

-(NSString *) URLEncodeString:(NSString *) str
{

  NSMutableString *tempStr = [NSMutableString stringWithString:str];
  [tempStr replaceOccurrencesOfString:@" " withString:@"+"

                              options:NSCaseInsensitiveSearch range:NSMakeRange(0, [tempStr length])];


  return [[NSString stringWithFormat:@"%@",tempStr]

          stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding];
}

@end
