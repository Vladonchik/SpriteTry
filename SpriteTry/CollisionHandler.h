//
//  CollisionHandler.h
//  SpriteTry
//
//  Created by Vladysalv Vyshnevksyy on 1/22/17.
//  Copyright © 2017 Vladysalv Vyshnevksyy. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "EnemiesManager.h"

@interface CollisionHandler : SKNode

-(void) missileAndEnemy:(EnemiesManager*) enemiesManager forContact:(SKPhysicsContact*) contact;

-(void) missileAndWorld:(SKPhysicsContact*) contact;

-(void) enemyAndObstacle:(SKPhysicsContact*) contact;

-(void) rocketAndPowerUpFastShoot:(SKPhysicsContact*) contact;

@end
