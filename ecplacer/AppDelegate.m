//
//  AppDelegate.m
//  ecplacer
//
//  Created by Oliver Cermann on 13.07.18.
//  Copyright © 2018 Oliver Cermann. All rights reserved.
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

- (BOOL) applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)application {
    return YES;
}

@end
