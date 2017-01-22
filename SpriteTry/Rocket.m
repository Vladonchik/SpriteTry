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

static CGFloat spaceShipWidthScale = 0.15;
static CGFloat spaceShipHeightScale = 0.1;

@implementation Rocket

+ (instancetype) rocketSprite
{
    
    SKTexture *rocketTexture = [SKTexture textureWithImageNamed:@"spaceship"];
    
    Rocket* rocket = [Rocket spriteNodeWithTexture:rocketTexture];
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    
    rocket.size = CGSizeMake(screenWidth * spaceShipWidthScale, screenHeight * spaceShipHeightScale);
    rocket.acceleration = 1;
    rocket.fireRate = 1.0;
    
    rocket.physicsBody = [SKPhysicsBody bodyWithTexture:rocketTexture size:rocket.size];

    rocket.physicsBody.dynamic = YES;
    rocket.physicsBody.allowsRotation = NO;
    
    rocket.physicsBody.categoryBitMask = rocketCategory;
    rocket.physicsBody.collisionBitMask =rocketCategory | worldCategory;;
    rocket.physicsBody.contactTestBitMask = obstacleCategory | enemyCategory;
    
    rocket.physicsBody.restitution = 0;
    rocket.physicsBody.friction = 0;
    rocket.physicsBody.linearDamping = 0;
    rocket.physicsBody.angularDamping = 0.2;
    
    // Engine fire
    SKEmitterNode * engine = [SKEmitterNode nodeWithFile:@"fireBugSmall.sks"];
    engine.position = CGPointMake(0, -rocket.size.height / 2);
    [rocket addChild:engine];
    
    return rocket;
}

-(void) stopMoving {
    [self.physicsBody setVelocity:CGVectorMake(0, 0)];
}

-(void) moveRight {
    [self.physicsBody applyImpulse:CGVectorMake(7 * self.acceleration, 0)];
}

-(void) moveLeft {
    [self.physicsBody applyImpulse:CGVectorMake(-7 * self.acceleration, 0)];
}

-(void) shoot {
    Missile* missile = [Missile missileSpriteWithSize:CGSizeMake(self.size.width * 0.2, self.size.height * 0.2)];
    missile.position = CGPointMake(self.position.x, self.position.y + missile.size.height / 2);
    [self.scene addChild:missile];
    
    [missile shootNormal];
}

@end
