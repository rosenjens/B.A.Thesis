//
//  KeyboardHelper.h
//  LeapPointableViewer
//
//  Created by Jens Rosén on 2014-05-07.
//  Copyright (c) 2014 Jens Rosén. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KeyboardHelper : NSObject

+ (CGKeyCode)convertNSStringToCGKeyCode: (NSString *) string;

@end
