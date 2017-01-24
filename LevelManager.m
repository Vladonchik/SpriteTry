//
//  LevelManager.m
//  SpriteTry
//
//  Created by Vladysalv Vyshnevksyy on 1/24/17.
//  Copyright © 2017 Vladysalv Vyshnevksyy. All rights reserved.
//

#import "LevelManager.h"

#import "ObstaclesManager.h"
#import "PowerUpsManager.h"
#import "EnemiesManager.h"

@implementation LevelManager

{
    
EnemiesManager* enemiesManager;
ObstaclesManager* obstacleManager;
PowerUpsManager* powerUpsManager;

}
-(void) setUp {
    
    // Obstacles
    obstacleManager = [ObstaclesManager node];
    [self addChild:obstacleManager];
    
    // Enemies
    enemiesManager = [EnemiesManager node];
    [self addChild:enemiesManager];
    
    // Power Ups
    powerUpsManager = [PowerUpsManager node];
    [self addChild:powerUpsManager];
    
}

-(void) startLevel_1 {
    
}

@end
