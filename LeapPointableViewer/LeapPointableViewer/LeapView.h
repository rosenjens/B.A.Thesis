//
//  LeapView.h
//  LeapPointableViewer
//
//  Created by Jens Rosén on 2014-04-08.
//  Copyright (c) 2014 Jens Rosén. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "LeapObjectiveC.h"
#import "Keyboard.h"

@interface LeapView : NSView

@property (nonatomic) LeapFrame *leapFrame;
@property (nonatomic) LeapPointable *leapKeyPressPointable;
@property (nonatomic) NSMutableArray *keyStrokes;
@property (nonatomic) Keyboard *keyboard;

@end
