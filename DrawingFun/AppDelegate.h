//
//  AppDelegate.h
//  DrawingFun
//
//  Created by jinren on 24/11/2016.
//  Copyright © 2016 jinren. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "StretchView.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>
@property (weak) IBOutlet StretchView *stretchView;

- (IBAction)showOpenPanel:(id)sender;

@end

