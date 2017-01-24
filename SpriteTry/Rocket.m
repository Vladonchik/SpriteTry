//
//  Rocket.m
//  SpriteTry
//
//  Created by Vladysalv Vyshnevksyy on 1/15/17.
//  Copyright © 2017 Vladysalv Vyshnevksyy. All rights reserved.
//

#import "Rocket.h"
#import "SKEmitterNode+Extensions.h"
#import "Constants.h"
#import "Missile.h"



@implementation Rocket

static CGFloat spaceShipWidthScale = 0.15;
static CGFloat spaceShipHeightScale = 0.1;

CGFloat normalFireRate = 1.0;

+ (instancetype) rocketSprite
{
    
    SKTexture *rocketTexture = [SKTexture textureWithImageNamed:@"spaceship"];
    
    Rocket* rocket = [Rocket spriteNodeWithTexture:rocketTexture];
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    
    rocket.fireRate = 1.0;
    
    rocket.size = CGSizeMake(screenWidth * spaceShipWidthScale, screenHeight * spaceShipHeightScale);
    
    rocket.physicsBody = [SKPhysicsBody bodyWithTexture:rocketTexture size:rocket.size];

    rocket.physicsBody.dynamic = YES;
    rocket.physicsBody.allowsRotation = NO;
    
    rocket.physicsBody.categoryBitMask = rocketCategory;
    rocket.physicsBody.collisionBitMask = rocketCategory | worldCategory;;
    rocket.physicsBody.contactTestBitMask = obstacleCategory | enemyCategory | powerUpFastShootCategory;
    
    rocket.physicsBody.restitution = 0;
    rocket.physicsBody.friction = 0;
    rocket.physicsBody.linearDamping = 0;
    rocket.physicsBody.angularDamping = 0.2;
    rocket.physicsBody.usesPreciseCollisionDetection = YES;
    // Engine fire
    SKEmitterNode * engine = [SKEmitterNode nodeWithFile:@"fireBugSmall.sks"];
    engine.position = CGPointMake(0, -rocket.size.height / 2);
    [rocket addChild:engine];
    
    return rocket;
}

-(void) shoot {
    [[self createMissile] shoot];
}

-(Missile*) createMissile {
    Missile* missile = [Missile missileSpriteWithSize:CGSizeMake(self.size.width * 0.2, self.size.height * 0.2)];
    missile.position = CGPointMake(self.position.x, self.position.y + missile.size.height / 2);
    [self.scene addChild:missile];
    return missile;
}

-(void) powerUpFireRate {
    
    // stack power ups until fire rate equls 0.1
    if (self.fireRate <= 0.5 && self.fireRate >= 0.2) {
        self.fireRate -= 0.1 ;
        [self removeActionForKey:@"powerUpFireRate"];
    }
    
    // first power up
    if (self.fireRate == normalFireRate) {
        self.fireRate = 0.5;
    }
    
    SKAction* wait = [SKAction waitForDuration:5.0];
    SKAction * normal = [SKAction runBlock:^{
        self.fireRate = normalFireRate;
    }];
    SKAction* waitAndBecomeNormal = [SKAction sequence:@[wait, normal]];
    [self runAction:waitAndBecomeNormal withKey:@"powerUpFireRate"];
    
    
   // NSLog(@"%f", self.fireRate);
}


@end
