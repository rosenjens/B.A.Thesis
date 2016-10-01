//
//  Sample.m
//  LeapPointableViewer
//
//  Created by Jens Rosén on 2014-04-08.
//  Copyright (c) 2014 Jens Rosén. All rights reserved.
//

#import "Sample.h"
#import "LeapViewController.h"

@implementation Sample
{
    LeapController *_controller;
    //LeapOverlayViewController *_leapOverlayController;
    LeapViewController *_leapViewController;
    NSView *_leapView;
}

-(void) run:(NSView *)leapView
{
    _leapViewController = [[LeapViewController alloc]init];
    [_leapViewController setLeapView:leapView];
    
    _controller = [[LeapController alloc] init];
    [_controller addListener:self];
    [_controller setPolicyFlags:LEAP_POLICY_BACKGROUND_FRAMES];
    _leapView = leapView;
    NSLog(@"Running");
}

- (void)onInit:(NSNotification *)notification
{
    NSLog(@"Initialized");
}

- (void) onConnect:(NSNotification *)notification
{
    LeapController *aController = (LeapController *)[notification object];
    [aController enableGesture:LEAP_GESTURE_TYPE_KEY_TAP enable:YES];
    
    NSLog(@"Connected");
}

- (void) onDisconnect:(NSNotification *)notification
{
    NSLog(@"Disconnected");
}

- (void) onExit:(NSNotification *)notification
{
    NSLog(@"Exit");
}

- (void) onFrame:(NSNotification *)notification
{
    [_leapViewController onFrame:notification];
    return;
}

@end

