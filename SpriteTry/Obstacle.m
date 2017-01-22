//
//  Obstacle.m
//  SpriteTry
//
//  Created by Vladysalv Vyshnevksyy on 1/19/17.
//  Copyright © 2017 Vladysalv Vyshnevksyy. All rights reserved.
//

#import "Obstacle.h"
#import "Constants.h"

@implementation Obstacle

+(instancetype) obstacleSpriteWithSize:(CGSize) size {

    Obstacle* obstacle = [Obstacle spriteNodeWithColor:[SKColor redColor] size:size];
    
    obstacle.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:obstacle.size];
    obstacle.physicsBody.dynamic = YES;
    
    obstacle.physicsBody.categoryBitMask = obstacleCategory;
    obstacle.physicsBody.collisionBitMask = obstacleCategory;
    obstacle.physicsBody.contactTestBitMask = obstacleCategory | rocketCategory | enemyCategory;
    
    obstacle.physicsBody.allowsRotation = NO;

    return obstacle;
}

@end
