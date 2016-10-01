//
//  AppDelegate.m
//  LeapPointableViewer
//
//  Created by Jens Rosén on 2014-04-08.
//  Copyright (c) 2014 Jens Rosén. All rights reserved.
//

#import "AppDelegate.h"
#import "Sample.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    _sample = [[Sample alloc] init];
    [_sample run:_leapView];
    
    [_window setLevel:NSFloatingWindowLevel];
    [_window setAspectRatio:_window.frame.size];
    
}

@end
