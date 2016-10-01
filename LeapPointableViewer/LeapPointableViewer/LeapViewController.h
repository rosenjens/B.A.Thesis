//
//  LeapViewController.h
//  LeapPointableViewer
//
//  Created by Jens Rosén on 2014-04-08.
//  Copyright (c) 2014 Jens Rosén. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LeapView.h"

@interface LeapViewController : NSObject

- (void) onFrame:(NSNotification *) notification;

@property (nonatomic) LeapView *leapView;
@property (nonatomic) LeapPointable *pointableWithHighestYV;
@property (nonatomic) LeapPointable *pointablePressing;

@end
