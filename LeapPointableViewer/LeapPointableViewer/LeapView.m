//
//  LeapView.m
//  LeapPointableViewer
//
//  Created by Jens Rosén on 2014-04-08.
//  Copyright (c) 2014 Jens Rosén. All rights reserved.
//

#import "LeapView.h"
#import "Key.h"

@implementation LeapView{
        NSPoint _centerPoint;
        NSMutableDictionary * stringAttributes;
    int32_t inKlick;
}

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
        
        stringAttributes = [NSMutableDictionary dictionary];
        [stringAttributes setObject:[NSFont fontWithName:@"Monaco" size:10] forKey:NSFontAttributeName];
        [stringAttributes setObject:[NSColor blackColor] forKey:NSForegroundColorAttributeName];
        //[stringAttributes retain];
        
        inKlick = 0;
        
    }
    return self;
}

- (NSPoint) leapPositionToScreenPosistion:(float)x :(float)z{
    NSPoint newPoint;
    
    newPoint.x = _bounds.size.width/2 + (x/150) * _bounds.size.width/2;
    newPoint.y = _bounds.size.height/2 + ((1-z)/50) * _bounds.size.height/2;
    return newPoint;
}

-(void) drawKeyboard
{
    
    for (Key* key in [_keyboard keys]){
        
        NSPoint screenPos = [self leapPositionToScreenPosistion:[key position].x :[key position].y];
        int cx = (int) screenPos.x;
        int cy = (int) screenPos.y;
        
        float cw = (_bounds.size.width)*((float)[key sizeX]/300);
        float ch = (_bounds.size.height)*((float)[key sizeY]/100);
        
        NSRect myRect = NSMakeRect(cx, cy, cw, ch);
        
        if ([key pressed]) {
            [[NSColor colorWithCalibratedRed:0.8 green:0.8 blue:0.8 alpha:0.5] set];
            [[NSBezierPath bezierPathWithRoundedRect:myRect xRadius:8.0 yRadius:8.0] fill];
        }
        
        [[NSColor colorWithCalibratedRed:0.1 green:0.1 blue:0.1 alpha:0.5] set];
        [[NSBezierPath bezierPathWithRoundedRect:myRect xRadius:(2.0*(_bounds.size.height/100)) yRadius:(2.0*(_bounds.size.height/100))] stroke];
    }
    
    /*NSFont* font1= [NSFont fontWithName:@"Helvetica" size:9.0];
    NSString *test = @"test";
    
    NSString *displayText = @"(My Favorite's. Love this!)";*/
    
    //[test sizeWithAttributes:<#(NSDictionary *)#>];
    
    //NSMutableAttributedString *attributedString = [NSMutableAttributedString attributedStringWithString:displayText];
    
    //[attributedString setFont:[UIFont systemFontOfSize:15] range:[displayText rangeOfString:@"."]];

    NSMutableDictionary * stringAttributes2;
    stringAttributes2 = [NSMutableDictionary dictionary];
    [stringAttributes2 setObject:[NSFont fontWithName:@"Monaco" size:(7)*(_bounds.size.height/100)] forKey:NSFontAttributeName];
    [stringAttributes2 setObject:[NSColor blackColor] forKey:NSForegroundColorAttributeName];
    
    for (Key* key in [_keyboard keys]){
        NSString *letter =[[key letter] uppercaseString];
        NSSize s = [letter sizeWithAttributes:stringAttributes2];
        
        NSPoint sceenPosLetter = [self leapPositionToScreenPosistion:[key position].x + [key sizeX]/2 :[key position].y - [key sizeY]/2];
        
        [[[key letter] uppercaseString] drawAtPoint:NSMakePoint(sceenPosLetter.x -(s.width/2), sceenPosLetter.y - (s.height/2)) withAttributes:stringAttributes2];
    }
    
    
    

}

- (void) drawFingers{
    
    /*if (_leapKeyPressPointable != nil){
        
        NSPoint screenPos = [self leapPositionToScreenPosistion:_leapKeyPressPointable.tipPosition.x :_leapKeyPressPointable.tipPosition.z];
        
        [[NSColor colorWithCalibratedRed:0.7 green:0.9 blue:0.3 alpha:1.0] set];
        
        NSBezierPath* test = [NSBezierPath bezierPath];
        [test appendBezierPath:[NSBezierPath bezierPathWithOvalInRect:NSMakeRect(screenPos.x-25, screenPos.y-25, 50, 50)]];
        [test setLineWidth:5];
        [test stroke];
    }*/
    
    for (LeapPointable *pointable in [_leapFrame pointables]){
        NSPoint screenPos = [self leapPositionToScreenPosistion:pointable.tipPosition.x :pointable.tipPosition.z];
        
        int fingerSize = (6 - 0.02*abs(pointable.tipPosition.y -250))*(_bounds.size.height/100);
        //int fingerSize = 7*(_bounds.size.height/100);
        
        NSRect myRect = NSMakeRect(screenPos.x - fingerSize/2, screenPos.y - fingerSize/2, fingerSize, fingerSize);
        
        [[NSColor orangeColor] set];
        
        NSRectFill(myRect);
        
        //NSString *intString = [NSString stringWithFormat:@"%d", [pointable id]];
        
        //[intString drawAtPoint:NSMakePoint(screenPos.x, screenPos.y+20) withAttributes:stringAttributes];
        
        //[[NSString stringWithFormat:@"%d", (int)pointable.tipPosition.y ] drawAtPoint:NSMakePoint(screenPos.x, screenPos.y-20) withAttributes:stringAttributes];
    }
    
}

- (void) drawLeapInfo{
    [[NSColor blackColor] set];
    
    [[NSString stringWithFormat:@"Hands: %ld", [[_leapFrame hands] count] ] drawAtPoint:NSMakePoint(5, 5) withAttributes:stringAttributes];
    
    [[NSString stringWithFormat:@"Tools: %ld", [[_leapFrame tools] count] ] drawAtPoint:NSMakePoint(5, 20) withAttributes:stringAttributes];
}

- (void) drawHitPoints{
    
    for (LeapPointable *lp in [self keyStrokes]) {
        NSPoint screenPosition = [self leapPositionToScreenPosistion:lp.tipPosition.x :lp.tipPosition.z];
        
        int cx = (int) screenPosition.x - 1;
        int cy = (int) screenPosition.y - 1;
        [[NSColor colorWithCalibratedRed:0.1 green:0.1 blue:0.1 alpha:1.0] set];
        
        NSBezierPath* test = [NSBezierPath bezierPath];
        [test appendBezierPath:[NSBezierPath bezierPathWithOvalInRect:NSMakeRect(cx, cy, 2, 2)]];
        [test setLineWidth:5];
        [test fill];
    }
    
}


- (void)drawRect:(NSRect)dirtyRect
{
    [super drawRect:dirtyRect];
    
    // Drawing code here.
    _centerPoint.x = (_bounds.origin.x + _bounds.size.width)/2;
    _centerPoint.y = (_bounds.origin.y + _bounds.size.height)/2;
    
    
    [[NSColor whiteColor] set];
    NSRectFill([self bounds]);
    
    if (_leapFrame == nil) {
        return;
    }
    
    [self drawKeyboard];
    [self drawHitPoints];
    [self drawFingers];
    [self drawLeapInfo];
    
}

@end

