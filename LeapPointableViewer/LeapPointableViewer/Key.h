//
//  Key.h
//  LeapPointableViewer
//
//  Created by Jens Rosén on 2014-05-05.
//  Copyright (c) 2014 Jens Rosén. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Key : NSObject

@property (nonatomic) NSPoint position;
@property (nonatomic) BOOL pressed;
@property (nonatomic) NSString *letter;
@property (nonatomic) NSInteger sizeX;
@property (nonatomic) NSInteger sizeY;
@property (nonatomic) CGKeyCode keyCode;

@end
