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
    _opacity = 1.0;
    [path closePath];
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    NSRect bounds = [self bounds];
    [[NSColor greenColor] set];
    [NSBezierPath fillRect:bounds];
    
    [[NSColor whiteColor] set];
    [path fill];
    // Drawing code here.
    
    if (_image) {
        NSRect imageRect;
        imageRect.origin = NSZeroPoint;
        imageRect.size = _image.size;
        NSRect drawingRect = [self currentRect];

        [_image drawInRect:drawingRect fromRect:imageRect operation:NSCompositingOperationSourceOver fraction:_opacity];
    }
}

- (NSPoint)randomPoint
{
    NSPoint result;
    NSRect r = [self bounds];
    
    result.x = r.origin.x + random() % (int)r.size.width;
    result.y = r.origin.y + random() % (int)r.size.height;
    
    return result;
}

#pragma mark event

- (void)mouseUp:(NSEvent *)event
{
    NSLog(@"Mouse Up");
}

-(void)mouseDown:(NSEvent *)event
{
    NSLog(@"MouseDown: %ld", [event clickCount]);
    NSPoint p = [event locationInWindow];
    downPoint = [self convertPoint:p fromView:nil];
    currentPoint = downPoint;
    [self setNeedsDisplay:YES];
}

-(void)mouseDragged:(NSEvent *)event
{
    NSPoint p = [event locationInWindow];
    NSLog(@"mouseDragged:%@", NSStringFromPoint(p));
    currentPoint = [self convertPoint:p fromView:nil];
    [self autoscroll:event];
    [self setNeedsDisplay:YES];
}

- (NSRect)currentRect
{
    float minX = MIN(downPoint.x, currentPoint.x);
    float minY = MIN(downPoint.y, currentPoint.y);
    float maxX = MAX(downPoint.x, currentPoint.x);
    float maxY = MAX(downPoint.y, currentPoint.y);
    
    return NSMakeRect(minX, minY, maxX - minX, maxY - minY);
}

- (float)opacity
{
    return _opacity;
}

- (void)setOpacity:(float)o
{
    _opacity = o;
    [self setNeedsDisplay:YES];
}

- (NSImage *)image
{
    return _image;
}

-(void)setImage:(NSImage *)image
{
    _image = image;
    NSSize imageSize = [image size];
    downPoint = NSZeroPoint;
    currentPoint.x = 0 + imageSize.width;
    currentPoint.y = 0 + imageSize.height;
    
    [self setNeedsDisplay:YES];
}

@end
