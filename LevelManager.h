//
//  LevelManager.h
//  SpriteTry
//
//  Created by Vladysalv Vyshnevksyy on 1/24/17.
//  Copyright © 2017 Vladysalv Vyshnevksyy. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "ObstaclesManager.h"
#import "PowerUpsManager.h"
#import "EnemiesManager.h"
#import "BasicObjectsManager.h"

@interface LevelManager : SKNode

-(void) startLevel:(NSInteger) level;

@property (strong, nonatomic) EnemiesManager* enemiesManager;
@property (strong, nonatomic) ObstaclesManager* obstacleManager;
@property (strong, nonatomic) PowerUpsManager* powerUpsManager;

@end
