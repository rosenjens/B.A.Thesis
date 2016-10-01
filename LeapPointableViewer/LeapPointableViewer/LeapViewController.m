//
//  LeapViewController.m
//  LeapPointableViewer
//
//  Created by Jens Rosén on 2014-04-08.
//  Copyright (c) 2014 Jens Rosén. All rights reserved.
//

#import "LeapViewController.h"
#import "LeapObjectiveC.h"
#import "Keyboard.h"
#import "Key.h"

@implementation LeapViewController
{
    LeapFrame *_leapFrame;
    LeapInteractionBox *_interactionBox;
    
    NSMutableArray *keyStrockes;
    Keyboard *keyboard;
    //NSSound *sound;
}

- (id) init
{
    self = [super init];
    if (self){
        keyStrockes = [[NSMutableArray alloc] init];
        keyboard = [[Keyboard alloc]init];
        
    }
    
    return self;
}

- (void) updateLeapView
{
    [_leapView setLeapFrame:_leapFrame];
    [_leapView setLeapKeyPressPointable:_pointablePressing];
    [_leapView setNeedsDisplay:YES];
    [_leapView setKeyboard:keyboard];
}

- (void) pressKey:(LeapPointable *) pointable
{
    [keyStrockes addObject:pointable];
    [_leapView setKeyStrokes:keyStrockes];
    Key *keyPressed = [keyboard pressKey:pointable];
    
    if(keyPressed != nil){
        CGEventSourceRef sourceRef = CGEventSourceCreate(kCGEventSourceStateCombinedSessionState);
        if (!sourceRef)
        {
            NSLog(@"No event source");
            return;
        }
        //9 = "v"
        CGEventRef eventDown = CGEventCreateKeyboardEvent(sourceRef, [keyPressed keyCode], true);
        //CGEventSetFlags(eventDown, kCGEventFlagMaskCommand);
        CGEventRef eventUp = CGEventCreateKeyboardEvent(sourceRef, [keyPressed keyCode], false);
        CGEventPost(kCGHIDEventTap, eventDown);
        CGEventPost(kCGHIDEventTap, eventUp);
        CFRelease(eventDown);
        CFRelease(eventUp);
        CFRelease(sourceRef);
        
        /*if ([sound isPlaying]){
            [sound stop];
        }
        
        [sound play];*/
        //[sound release];
        
        NSSound *sound = [[NSSound alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"switch-1" ofType:@"mp3"] byReference:NO];
        [sound play];
    }
    
    
    
  

    
}

- (void) releaseKey:(LeapPointable *)pointable
{
    [keyboard releaseKey:pointable];
}

- (void) analyzePointables
{
    NSArray *leapPointables = [_leapFrame pointables];
    
    if(_pointablePressing != nil){
        LeapPointable* pointable = [self getPointable:leapPointables :_pointablePressing.id];
        if (pointable.tipVelocity.y < -10) {
            [self setPointablePressing:pointable];
        }else{
            [self setPointablePressing:nil];
            [self releaseKey:pointable];
        }
    }else{
        LeapPointable *pointable = [self getFastestPointable:leapPointables];
        if (pointable.tipVelocity.y < -300){
            [self pressKey:pointable];
            [self setPointablePressing:pointable];
        }
    }
}

- (LeapPointable *) getPointable:(NSArray *) pointables :(int32_t)id
{
    for (LeapPointable *pointable in pointables){
        if (pointable.id == id)
            return pointable;
    }
    return nil;
}

- (LeapPointable *) getFastestPointable:(NSArray *) pointables
{
    LeapPointable *pointableCandidate;
    for (LeapPointable *pointable in pointables){
        if (pointable.tipVelocity.y < pointableCandidate.tipVelocity.y) {
            pointableCandidate = pointable;
        }
    }
    
    return pointableCandidate;
}


- (void) onFrame:(NSNotification *)notification
{
    LeapController *aController = (LeapController *)[notification object];
    
    _leapFrame = [aController frame:0];
    
    [self analyzePointables];
    [self updateLeapView];
    
}

@end
