//
//  Enemy.m
//  SpriteTry
//
//  Created by Vladysalv Vyshnevksyy on 1/21/17.
//  Copyright © 2017 Vladysalv Vyshnevksyy. All rights reserved.
//

#import "Enemy.h"
#import "Constants.h"



@implementation Enemy

+(instancetype) enemySpriteWithSize:(CGSize) size {
    
    SKTexture *rocketTexture = [SKTexture textureWithImageNamed:@"enemy1"];
    
    Enemy* enemy = [Enemy spriteNodeWithTexture:rocketTexture];
    
    enemy.size = size;
    
    enemy.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:enemy.size];
    enemy.physicsBody.dynamic = YES;
    
    enemy.physicsBody.categoryBitMask = enemyCategory;
    enemy.physicsBody.collisionBitMask = enemyCategory;
    enemy.physicsBody.contactTestBitMask = enemyCategory | rocketCategory | missileCategory | obstacleCategory;
    
    enemy.physicsBody.allowsRotation = NO;
    
    return enemy;
}


@end
