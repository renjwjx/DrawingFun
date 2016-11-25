//
//  AppDelegate.m
//  DrawingFun
//
//  Created by jinren on 24/11/2016.
//  Copyright © 2016 jinren. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (void)showOpenPanel:(id)sender
{
    __block NSOpenPanel *panel = [NSOpenPanel openPanel];
    [panel setAllowedFileTypes:[NSImage imageTypes]];
    [panel beginSheetModalForWindow:[_stretchView window] completionHandler:^(NSInteger result) {
        if (result == NSModalResponseOK) {
            NSImage *image = [[NSImage alloc] initWithContentsOfURL:[panel URL]];
            [_stretchView setImage:image];
        }
    }];
    
}

@end
