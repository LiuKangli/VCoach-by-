//
//  AppDelegate.h
//  VCoach
//
//  Created by apple on 15/4/23.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BPush.h"
#import "Reachability.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate,BPushDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;
@property(strong,nonatomic) Reachability*reach;

@end
