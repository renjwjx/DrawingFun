//
//  StretchView.h
//  DrawingFun
//
//  Created by jinren on 24/11/2016.
//  Copyright © 2016 jinren. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface StretchView : NSView
{
    NSBezierPath *path;
    float       _opacity;
    NSImage   *_image;
    NSPoint     downPoint;
    NSPoint     currentPoint;
}

@property (strong, readwrite) NSImage   *image;
@property (assign, readwrite)          float       opacity;

-(NSPoint)randomPoint;
-(NSRect)currentRect;
@end
