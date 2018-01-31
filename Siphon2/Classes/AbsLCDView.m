/**
 *  Siphon SIP-VoIP for iPhone and iPod Touch
 *  Copyright (C) 2008-2010 Samuel <samuelv0304@gmail.com>
 *
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License along
 *  with this program; if not, write to the Free Software Foundation, Inc.,
 *  51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 */

#import "AbsLCDView.h"
//#import "PhoneViewController.m"

#define kStateLabelWidth  140.0f
#define kStateLabelHeight  19.0f

@implementation AbsLCDView


- (id)initWithFrame:(CGRect)frame 
{
    if (self = [super initWithFrame:frame]) 
    {
      self.backgroundColor = [UIColor clearColor];
      // Initialization code
      _topLabel = [[UILabel alloc] initWithFrame:CGRectMake(frame.origin.x + 5.0f,
                                                            0.0f, 
                                                            frame.size.width - 10.0f, 
                                                            kStateLabelHeight)];
      _topLabel.backgroundColor = [UIColor clearColor];
      _topLabel.font = [UIFont systemFontOfSize:12];
      _topLabel.textColor = [UIColor whiteColor];
      _topLabel.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
      
      _leftLabel = [[UILabel alloc] initWithFrame:CGRectMake(frame.origin.x + 5.0f, 
                                                             /*55.0f*/frame.size.height - kStateLabelHeight, 
                                                             kStateLabelWidth, kStateLabelHeight)];
      _leftLabel.backgroundColor = [UIColor clearColor];
      _leftLabel.font = [UIFont systemFontOfSize:12];
      _leftLabel.textColor = [UIColor whiteColor];
      _leftLabel.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
      
      _rightLabel = [[UILabel alloc] initWithFrame:CGRectZero];
      _rightLabel.backgroundColor = [UIColor clearColor];
      _rightLabel.font = [UIFont systemFontOfSize:12];
      _rightLabel.textColor = [UIColor blackColor];
      _rightLabel.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
      _rightLabel.textAlignment = UITextAlignmentRight;
      
      _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(/*175.0f*/frame.size.width - kStateLabelWidth - 5.0f, 
                                                                   /*55.0f*/frame.size.height - kStateLabelHeight, 
                                                                   kStateLabelWidth, kStateLabelHeight)];
        
        
        _balanceLabel = [[UILabel alloc] initWithFrame:CGRectMake( 10.0f,  16.0f, 140.0f, 120.0f)];
        
        [_balanceLabel setBackgroundColor:[UIColor clearColor]];
        _balanceLabel.numberOfLines = 4;
        _balanceLabel.font = [UIFont systemFontOfSize:12];
        
        [_balanceLabel setTextColor:[UIColor blackColor]];

        [_balanceLabel setText:@""];
        
      ratelabel = [[UILabel alloc] initWithFrame:CGRectMake(116, 52, 90, 26)];
      [ratelabel setBackgroundColor:[UIColor clearColor]];
      ratelabel.font = [UIFont systemFontOfSize:12];
      [ratelabel setTextColor:[UIColor colorWithRed:0.56 green:0.11 blue:0.13 alpha:1.0]];
      ratelabel.textAlignment = NSTextAlignmentCenter ;
      [ratelabel setText:@""];

      _scrollView.showsVerticalScrollIndicator = NO;
      _scrollView.showsHorizontalScrollIndicator = NO;
      [_scrollView addSubview:_rightLabel];

      [self addSubview:_topLabel];
      [self addSubview:_leftLabel];
      [self addSubview:_scrollView];
      [self addSubview:_balanceLabel];
       [self addSubview:ratelabel];
    }
    return self;
}


/*- (void)drawRect:(CGRect)rect 
{
    // Drawing code
}*/


- (void)dealloc 
{
  [_topLabel release];
  [_leftLabel release];
  [_rightLabel release];
  [_scrollView release];
  [_balanceLabel release];
  [ratelabel release];

  [super dealloc];
}

- (void)animationFinished:(NSString *)animationID finished:(BOOL)finished context:(void *)context
{
  if (finished)
  {
    _scrollView.contentOffset = CGPointZero;
    _rightLabel.frame = CGRectMake(0.0f, 0.0f, kStateLabelWidth, kStateLabelHeight);
    _scrollView.contentSize = _rightLabel.frame.size;
  }
}

- (void)displayState:(NSString *)state animated:(BOOL)animated
{
  _scrollView.contentOffset = CGPointZero;
  _rightLabel.text = NSLocalizedString(state, @"Phone View");
  CGSize size = [_rightLabel.text sizeWithFont:_rightLabel.font];
  if (size.width > kStateLabelWidth)
  {
    _rightLabel.frame = CGRectMake(0.0f, 0.0f, size.width, kStateLabelHeight);
    _scrollView.contentSize = _rightLabel.frame.size;
    
    if (animated)
    {
      [UIView beginAnimations:@"pan" context:nil];
      [UIView setAnimationDuration:size.width * 10.0f / 325.0f];
      [UIView setAnimationRepeatAutoreverses:YES];
      [UIView setAnimationRepeatCount:20];
      [UIView setAnimationDelegate:self];
      [UIView setAnimationDidStopSelector:@selector(animationFinished:finished:context:)];
      _scrollView.contentOffset = CGPointMake(_rightLabel.frame.size.width - kStateLabelWidth , 0.0f);
      [UIView commitAnimations];
    } 
  }
  else
  {
    _rightLabel.frame = CGRectMake(0.0f, 0.0f, kStateLabelWidth, kStateLabelHeight);
    _scrollView.contentSize = _rightLabel.frame.size;
  }
}

- (void)topText:(NSString *)text
{
  _topLabel.text = text;
}

-(void)balanceText:(NSString *)text
{
    _balanceLabel.text=text;
    
 //  NSMutableString *str = [[NSMutableString alloc] initWithString:text];
    
    NSLog(@"%@",text);
   NSMutableString *str = [[NSMutableString alloc] initWithString:text];
   
    
   
    
    [_balanceLabel setText:text];

    
    
   // [_balanceLabel setText:text];
    
}

- (void)leftText:(NSString *)text
{
  _leftLabel.text = text;
}

- (void)rateText:(NSString *)text
{
  ratelabel.text = text;
}


- (void)rightText:(NSString *)text
{
  //_rightLabel.text = text;
    NSLog(@"kmbdkd%@",text);
  [self displayState:text animated:YES];
}

/*- (NSString *)text
{
  return [_lcd text];
}
- (void)setText:(NSString *)text
{
  [_lcd setText:text];
}*/

@end
