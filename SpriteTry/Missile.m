//
//  Bullet.m
//  SpriteTry
//
//  Created by Vladysalv Vyshnevksyy on 1/19/17.
//  Copyright © 2017 Vladysalv Vyshnevksyy. All rights reserved.
//

#import "Missile.h"
#import "Constants.h"

static CGFloat shootNodeNormalSpeed = 6;
static CGFloat shootNodeFastSpeed = 10;

@implementation Missile

+ (instancetype) missileSpriteWithSize:(CGSize) size {
    
    Missile* missile = [Missile spriteNodeWithColor:[SKColor greenColor] size:size];

    missile.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:missile.size];
    missile.physicsBody.dynamic = YES;
    
    missile.physicsBody.categoryBitMask = missileCategory;
    missile.physicsBody.collisionBitMask = missileCategory;
    missile.physicsBody.contactTestBitMask = missileCategory | enemyCategory | worldCategory;
   
    missile.physicsBody.allowsRotation = NO;
    
    [missile runAction:[SKAction sequence:@[[SKAction waitForDuration:3.0f],
                                              [SKAction fadeOutWithDuration:1],
                                              [SKAction removeFromParent]]]];
    
    
    return missile;
}

-(void) shootNormal {
    [self.physicsBody applyImpulse:CGVectorMake(0, shootNodeNormalSpeed)];
}

-(void) shootFast {
    [self.physicsBody applyImpulse:CGVectorMake(0, 6 * shootNodeFastSpeed)];
}

-(void) shootWithCustomVelocity:(CGFloat) velocity {
    [self.physicsBody applyImpulse:CGVectorMake(0, velocity)];
}



@end
