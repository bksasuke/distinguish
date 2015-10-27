//
//  BootLogic.m
//  TechmasterApp
//
//  Created by techmaster on 9/7/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

#import "BootLogic.h"
#import "MainScreen.h"


@implementation BootLogic
+ (void) boot: (UIWindow*) window
{
    MainScreen* mainScreen = [[MainScreen alloc] initWithStyle:UITableViewStyleGrouped];
    //--------- From this line, please customize your menu data -----------
    NSDictionary* basic = @{SECTION: @"Illustrate Pinch & Rotate", MENU: @[
                                    @{TITLE: @"Case 1", CLASS: @"Case1"},
                                    @{TITLE: @"Case 2", CLASS: @"Case2"},
                                    @{TITLE: @"Case 3", CLASS: @"Case3"},
                                    @{TITLE: @"Case 4", CLASS: @"Case4"},
                                    @{TITLE: @"Case 5", CLASS: @"Case5"},
                                    @{TITLE: @"Case 6", CLASS: @"Case6"},
                                    @{TITLE: @"Case 7", CLASS: @"Case7"}
                          ]};
    NSDictionary* intermediate = @{SECTION: @"UIGestureRecognizerDelegate", MENU: @[
                                    @{TITLE: @"Simultanous Recognizer", CLASS: @"SimulRecognizer"},
                                  ]};

    
    mainScreen.menu = @[basic, intermediate];
    mainScreen.title = @"Gesture Recognizer";
    mainScreen.about = @"Written by cuong@techmaster.vn";
    //--------- End of customization -----------
    UINavigationController* nav = [[UINavigationController alloc] initWithRootViewController: mainScreen];
    
    window.rootViewController = nav;
}
@end
