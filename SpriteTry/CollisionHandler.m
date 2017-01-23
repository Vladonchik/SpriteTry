//
//  CollisionHandler.m
//  SpriteTry
//
//  Created by Vladysalv Vyshnevksyy on 1/22/17.
//  Copyright © 2017 Vladysalv Vyshnevksyy. All rights reserved.
//

#import "CollisionHandler.h"
#import "Constants.h"
#import "Rocket.h"

@implementation CollisionHandler

SKNode* rememberPowerUpFireRate;

#pragma mark - Collisions

// enemy and missile
-(void) missileAndEnemy:(EnemiesManager*) enemiesManager forContact:(SKPhysicsContact*) contact {
    if (contact.bodyA.categoryBitMask == enemyCategory) {
        [self clearNode:contact.bodyA.node];
        [enemiesManager enemyKilled:(Enemy*)contact.bodyA.node];
    }
    else if (contact.bodyB.categoryBitMask == enemyCategory) {
        [self clearNode:contact.bodyB.node];
        [enemiesManager enemyKilled:(Enemy*)contact.bodyA.node];
    }
}

// enemy and world (top edge of screen)
-(void) missileAndWorld:(SKPhysicsContact*) contact {
    if (contact.bodyA.categoryBitMask == missileCategory) {
        [self clearNode:contact.bodyA.node];
    }
    else if (contact.bodyB.categoryBitMask == missileCategory) {
        [self clearNode:contact.bodyB.node];
    }
}


// remove object if they were created at one location
-(void) enemyAndObstacle:(SKPhysicsContact*) contact {
    int rand = arc4random_uniform(2);
    rand == 0 ? [self clearNode:contact.bodyA.node] : [self clearNode:contact.bodyB.node];
}

// rocket and power up
-(void) rocketAndPowerUpFastShoot:(SKPhysicsContact*) contact {
    
    
    if (contact.bodyA.categoryBitMask == powerUpFastShootCategory && contact.bodyA.node != rememberPowerUpFireRate) {
        rememberPowerUpFireRate = contact.bodyA.node;
        [self clearNode:contact.bodyA.node];
        Rocket* rocket = (Rocket* )contact.bodyB.node;
        [rocket powerUpFireRate];
    }
    else if (contact.bodyB.categoryBitMask == powerUpFastShootCategory && contact.bodyB.node != rememberPowerUpFireRate) {
        rememberPowerUpFireRate = contact.bodyB.node;
        [self clearNode:contact.bodyB.node];
        Rocket* rocket = (Rocket* )contact.bodyA.node;
        [rocket powerUpFireRate];
    }
}


#pragma mark - Clear Nodes

//clear node
-(void) clearNode:(SKNode*) node {
    [node removeAllActions];
    [node removeFromParent];
}

@end
