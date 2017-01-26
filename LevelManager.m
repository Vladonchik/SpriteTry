//
//  LevelManager.m
//  SpriteTry
//
//  Created by Vladysalv Vyshnevksyy on 1/24/17.
//  Copyright © 2017 Vladysalv Vyshnevksyy. All rights reserved.
//

#import "LevelManager.h"
#import "GlobalFunctions.h"

@interface LevelManager()

@property (strong, nonatomic) NSMutableArray* managers;

@end

@implementation LevelManager



-(NSMutableArray*) managers {
    if (!_managers) {
        _managers = [[NSMutableArray alloc] init];
    }
    return _managers;
}

#pragma mark - Initialization

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setUp];
    }
    return self;
}

-(void) setUp {
    
    // Obstacles
    self.obstacleManager = [ObstaclesManager node];
    [self addChild:self.obstacleManager];
    
    // Enemies
    self.enemiesManager = [EnemiesManager node];
    [self addChild:self.enemiesManager];
    
    // Power Ups
    self.powerUpsManager = [PowerUpsManager node];
    [self addChild:self.powerUpsManager];
    
    [self.managers addObject:self.obstacleManager];
    [self.managers addObject:self.enemiesManager];
    [self.managers addObject:self.powerUpsManager];
}

#pragma mark - Start Level #

-(void) startLevel:(NSInteger) level {
    
    //SEL levelSelector = NSSelectorFromString(@"spawnLevel:");
    
    for (BasicObjectsManager* manager in self.managers) {
        if ([manager respondsToSelector:@selector(spawnLevel:)]) {
            [manager performSelector:@selector(spawnLevel:) withObject:[NSNumber numberWithInteger:level]];
        }
    }
}







@end





