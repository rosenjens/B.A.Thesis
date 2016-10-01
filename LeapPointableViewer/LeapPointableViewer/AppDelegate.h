//
//  AppDelegate.h
//  LeapPointableViewer
//
//  Created by Jens Rosén on 2014-04-08.
//  Copyright (c) 2014 Jens Rosén. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@class Sample;

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSTextField *textarea;

@property (nonatomic, strong, readwrite) IBOutlet NSView *leapView;
@property (nonatomic, strong, readwrite) IBOutlet Sample *sample;

@end
