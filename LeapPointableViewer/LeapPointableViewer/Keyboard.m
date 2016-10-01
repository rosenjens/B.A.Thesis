//
//  Keyboard.m
//  LeapPointableViewer
//
//  Created by Jens Rosén on 2014-05-02.
//  Copyright (c) 2014 Jens Rosén. All rights reserved.
//

#import "Keyboard.h"
#import "KeyboardHelper.h"
#import "KeyboardHelper.h"

@implementation Keyboard{
    
}

- (id) init
{
    self = [super init];
    if (self){
        _keys = [[NSMutableArray alloc] init];
        NSArray *firRow = @[@"q",@"w",@"e",@"r",@"t",@"y",@"u",@"i",@"o",@"p"];
        NSArray *secRow = @[@"a",@"s",@"d",@"f",@"g",@"h",@"j",@"k",@"l"];
        NSArray *thiRow = @[@"z",@"x",@"c",@"v",@"b",@"n",@"m"];
        NSArray *forRow = @[@"_"];
        NSArray *keyboardKeys = @[firRow, secRow, thiRow, forRow];
        [self setKeyboardKeys:keyboardKeys];
        
    }
    
    return self;
}

- (void) setKeyboardKeys:(NSArray *) keysToSet{

    int space = 0;
    int size = 19;//19
    int shift[4] = {0, 5, 15, 15};
    
    NSArray *temp;
    for (int i = 0; i < [keysToSet count]; i++){
        temp = [keysToSet objectAtIndex:i];
        int y = (-1)*((space + size)*(int)[keysToSet count]/2) + ((i+1) * (size + space));
        int x = (-1)*((space + size)*(int)[keysToSet[0] count]/2) + shift[i];
        for (NSString *k in temp) {
        
            Key *key = [[Key alloc] init];
            [key setLetter:k];
            [key setKeyCode:[KeyboardHelper convertNSStringToCGKeyCode:k]];
            [key setSizeX:size];
            [key setSizeY:size];
            NSPoint p;
            p.x = x;
            p.y = y;
            [key setPosition:p];
            if (i == 3) {
                [key setSizeX:[key sizeX]*6];
                NSPoint pp;
                pp.x = p.x + (size + space);
                pp.y = y;
                [key setPosition:pp];
            }
            
            [_keys addObject:key];
            
            x = x+(size + space);
        }
    }
    Key *key = [[Key alloc] init];
    [key setLetter:@"<--"];
    [key setKeyCode:[KeyboardHelper convertNSStringToCGKeyCode:@"<--"]];
    [key setSizeX:size*2];
    [key setSizeY:size];
    NSPoint p;
    p.y = (-1)*((space + size)*(int)[keysToSet count]/2)+ (size + space);
    p.x = ((space + size)*(int)[keysToSet[0] count]/2)+space;
    [key setPosition:p];
    
    [_keys addObject:key];
}


- (char) pointableToChar:(LeapPointable *) pointable
{
    return 'a';
}

- (Key *) getKeyFromPointable:(LeapPointable *) pointable
{
    for (Key *key in _keys){
        NSPoint p = [key position];
        float x = pointable.tipPosition.x;
        float y = pointable.tipPosition.z;
        if (x > p.x && x < p.x+[key sizeX] && y < p.y && y > p.y - [key sizeY]) {
            return key;
        }
    }
    return nil;
}

- (Key *) pressKey:(LeapPointable *)pointable{
    Key *k = [self getKeyFromPointable:pointable];
    [k setPressed:YES];
    return k;
}

- (void) releaseKey:(LeapPointable *)pointable{
    //[[self getKeyFromPointable:pointable] setPressed:NO];
    for (Key *key in _keys) {
        [key setPressed:NO];
    }
}

@end
