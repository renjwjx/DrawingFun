//
//  StretchView.m
//  DrawingFun
//
//  Created by jinren on 24/11/2016.
//  Copyright © 2016 jinren. All rights reserved.
//

#import "StretchView.h"

@implementation StretchView

- (void)awakeFromNib
{
    [super awakeFromNib];

    srandom((unsigned)time(NULL));

    path = [NSBezierPath bezierPath];

    [path setLineWidth:3.0];
    NSPoint p = [self randomPoint];
    [path moveToPoint:p];
    int i;
    for (i = 0; i < 15; i++) {
        p = [self randomPoint];
        [path lineToPoint:p];
    }
    
    [path closePath];
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    NSRect bounds = [self bounds];
    [[NSColor greenColor] set];
    [NSBezierPath fillRect:bounds];
    
    [[NSColor whiteColor] set];
    [path stroke];
    // Drawing code here.
}

- (NSPoint)randomPoint
{
    NSPoint result;
    NSRect r = [self bounds];
    
    result.x = r.origin.x + random() % (int)r.size.width;
    result.y = r.origin.y + random() % (int)r.size.height;
    
    return result;
}

@end
