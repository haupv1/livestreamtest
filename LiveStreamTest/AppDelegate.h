//
//  AppDelegate.h
//  LiveStreamTest
//
//  Created by Pham Van Hau on 5/14/18.
//  Copyright © 2018 Pham Van Hau. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

