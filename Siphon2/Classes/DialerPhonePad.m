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
#import "DialerPhonePad.h"

@implementation DialerPhonePad
- (UIImage*)keypadImage;
{
  CGRect  screenBounds = [[UIScreen mainScreen] bounds];
    if (screenBounds.size.height == 568) {
        _keypadImage = [[UIImage imageNamed: @"dialer370.png"] retain];
 // if (_keypadImage == nil)
 // {
  //  _keypadImage = [[UIImage imageNamed: @"dialerkeypad.png"] retain];
 // }
 // return _keypadImage;
}
    else
    {
         _keypadImage = [[UIImage imageNamed: @"dialerkeypad.png"] retain];
        
    }
}

- (UIImage*)pressedImage
{
  if (_pressedImage == nil)
  {
    _pressedImage = [[UIImage imageNamed: @"dialerkeypad_pressed.png"] retain];
  }
  return _pressedImage;
}

- (id)initWithFrame:(struct CGRect)rect
{
    if ((self = [super initWithFrame:rect]) != nil)
    {
        [self setOpaque: TRUE];
        
        CGSize iOSDeviceScreenSize = [[UIScreen mainScreen] bounds].size;
        int xyz= iOSDeviceScreenSize.height;
        NSLog(@"kadlkfal%d",xyz);
        
        if(iOSDeviceScreenSize.height == 480)
        {
            
            _topHeight = 70.0;//100
            _midHeight = 70.0;//68
            _bottomHeight = 100.0;//68
            _leftWidth = 110.0;//107
            _midWidth = 110.0;//105
            _rightWidth = 108.0;//108
            
        }
        
        if(iOSDeviceScreenSize.height == 568)
        {
            
            
            _topHeight = 100.0;//100 ///70
            _midHeight = 78.0;//68///58
            _bottomHeight = 100.0;//68////100
            _leftWidth = 107.0;//107/////110
            _midWidth = 90.0;//105////95x
            _rightWidth = 108.0;//108////108
        }
        
        else
        {
            
            _topHeight = 70.0;//100
            _midHeight = 70.0;//68
            _bottomHeight = 100.0;//68
            _leftWidth = 110.0;//107
            _midWidth = 110.0;//105
            _rightWidth = 108.0;//108
            
        }
        
    }
    return self;
}


@end
