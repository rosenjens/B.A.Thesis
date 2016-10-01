//
//  KeyboardHelper.m
//  LeapPointableViewer
//
//  Created by Jens Rosén on 2014-05-07.
//  Copyright (c) 2014 Jens Rosén. All rights reserved.
//

#import "KeyboardHelper.h"

@implementation KeyboardHelper

+ (CGKeyCode) convertNSStringToCGKeyCode:(NSString *)string{
    
    CGKeyCode keyCode = (CGKeyCode)55;
    
    if ([string isEqualToString:@"a"]) {
        keyCode = (CGKeyCode)0;
    }else if ([string isEqualToString:@"b"]) {
        keyCode = (CGKeyCode)11;
    }else if ([string isEqualToString:@"c"]) {
        keyCode = (CGKeyCode)8;
    }else if ([string isEqualToString:@"d"]) {
        keyCode = (CGKeyCode)2;
    }else if ([string isEqualToString:@"e"]) {
        keyCode = (CGKeyCode)14;
    }else if ([string isEqualToString:@"f"]) {
        keyCode = (CGKeyCode)3;
    }else if ([string isEqualToString:@"g"]) {
        keyCode = (CGKeyCode)5;
    }else if ([string isEqualToString:@"h"]) {
        keyCode = (CGKeyCode)4;
    }else if ([string isEqualToString:@"i"]) {
        keyCode = (CGKeyCode)34;
    }else if ([string isEqualToString:@"j"]) {
        keyCode = (CGKeyCode)38;
    }else if ([string isEqualToString:@"k"]) {
        keyCode = (CGKeyCode)40;
    }else if ([string isEqualToString:@"l"]) {
        keyCode = (CGKeyCode)37;
    }else if ([string isEqualToString:@"m"]) {
        keyCode = (CGKeyCode)46;
    }else if ([string isEqualToString:@"n"]) {
        keyCode = (CGKeyCode)45;
    }else if ([string isEqualToString:@"o"]) {
        keyCode = (CGKeyCode)31;
    }else if ([string isEqualToString:@"p"]) {
        keyCode = (CGKeyCode)35;
    }else if ([string isEqualToString:@"q"]) {
        keyCode = (CGKeyCode)12;
    }else if ([string isEqualToString:@"r"]) {
        keyCode = (CGKeyCode)15;
    }else if ([string isEqualToString:@"s"]) {
        keyCode = (CGKeyCode)1;
    }else if ([string isEqualToString:@"t"]) {
        keyCode = (CGKeyCode)17;
    }else if ([string isEqualToString:@"u"]) {
        keyCode = (CGKeyCode)32;
    }else if ([string isEqualToString:@"v"]) {
        keyCode = (CGKeyCode)9;
    }else if ([string isEqualToString:@"w"]) {
        keyCode = (CGKeyCode)13;
    }else if ([string isEqualToString:@"x"]) {
        keyCode = (CGKeyCode)7;
    }else if ([string isEqualToString:@"y"]) {
        keyCode = (CGKeyCode)16;
    }else if ([string isEqualToString:@"z"]) {
        keyCode = (CGKeyCode)6;
    }else if ([string isEqualToString:@"_"]) {
        keyCode = (CGKeyCode)49;
    }else if ([string isEqualToString:@"<--"]) {
        keyCode = (CGKeyCode)51;
    }
    
    return keyCode;
}

@end
