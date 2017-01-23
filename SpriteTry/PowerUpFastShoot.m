//
//  PowerUpFastShoot.m
//  SpriteTry
//
//  Created by Vladysalv Vyshnevksyy on 1/23/17.
//  Copyright © 2017 Vladysalv Vyshnevksyy. All rights reserved.
//

#import "PowerUpFastShoot.h"
#import "Constants.h"

@implementation PowerUpFastShoot


+(instancetype) powerUpFastShootSpriteWithSize:(CGSize) size {
    
    PowerUpFastShoot * power = [PowerUpFastShoot spriteNodeWithColor:[UIColor blueColor] size:size];
    
    power.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:power.size];
    power.physicsBody.dynamic = YES;
    
    power.physicsBody.categoryBitMask = powerUpFastShootCategory;
    power.physicsBody.collisionBitMask = powerUpFastShootCategory;
    power.physicsBody.contactTestBitMask = rocketCategory ;
    power.physicsBody.usesPreciseCollisionDetection=YES;
    
    return power;
}


@end
