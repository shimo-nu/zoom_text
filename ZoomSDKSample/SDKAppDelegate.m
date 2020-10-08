//
//  SDKAppDelegate.m
//  ZoomSDKSample
//
//  Created by TOTTI on 2018/11/19.
//  Copyright © 2018 zoom.us. All rights reserved.
//

#import "SDKAppDelegate.h"
#import "ZMSDKLoginWindowController.h"
#import "ZMSDKInitHelper.h"


#define kZoomSDKAppKey      @"R1HIZtgeFhwGrjBsrGOpzoEJSICBKNjcufol"
#define kZoomSDKAppSecret   @"wUkmSLeG3WeWfWfOYrJNSwH1J0s8Tg0Sz6QU"
#define kZoomSDKDomain      @"zoom.us"

#define kSDKUserID          @""
#define kSDKUserName        @""
#define kSDKUserToken       @""
#define kSDKMeetNumber      @""
#define kZoomPMINumber      @""

@implementation SDKAppDelegate
@synthesize loginWindowCtrl;

#pragma mark - app delegate
- (void)applicationWillFinishLaunching:(NSNotification *)notification
{
    self.loginWindowCtrl = [[ZMSDKLoginWindowController alloc] init];
    [self.loginWindowCtrl.window makeKeyAndOrderFront:nil];
    [self.loginWindowCtrl.window center];
    [_logOutMenuItem setHidden:YES];
    [[ZoomSDK sharedSDK] setSupportDarkModel:YES];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    signal(SIGPIPE, processSignal);
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    
    [self cleanUp];
}

#pragma mark - internal


-(void)cleanUp
{
    if (self.loginWindowCtrl) {
        [self.loginWindowCtrl release];
        self.loginWindowCtrl = nil;
    }
}
//for pipe error
void processSignal(int num)
{
    
}

-(IBAction)logout:(id)sender
{
    [self.loginWindowCtrl logOut];
}
@end
