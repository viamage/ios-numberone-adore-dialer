//
//  NSString+hex.h
//  AES128
//
//  Created by mac on 28/09/16.
//  Copyright © 2016 Adore Infotech Pvt. Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (hex)

- (NSString *) stringFromHex:(NSString *)str;
- (NSString *) stringToHex:(NSString *)str;

@end
