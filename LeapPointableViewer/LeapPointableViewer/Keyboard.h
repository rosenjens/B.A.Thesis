//
//  Keyboard.h
//  LeapPointableViewer
//
//  Created by Jens Rosén on 2014-05-02.
//  Copyright (c) 2014 Jens Rosén. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LeapObjectiveC.h"
#import "Key.h"

@interface Keyboard : NSObject

@property (nonatomic) NSMutableArray *keys;

- (char)pointableToChar:(LeapPointable *) pointable;

- (Key *) pressKey:(LeapPointable *) pointable;
- (void) releaseKey:(LeapPointable *) pointable;

@end
