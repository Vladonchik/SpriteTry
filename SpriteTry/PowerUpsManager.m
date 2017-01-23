//
//  PowerUpsManager.m
//  SpriteTry
//
//  Created by Vladysalv Vyshnevksyy on 1/23/17.
//  Copyright © 2017 Vladysalv Vyshnevksyy. All rights reserved.
//

#import "PowerUpsManager.h"
#import "PowerUpFastShoot.h"


@implementation PowerUpsManager

{
 
 CGFloat widthScale;
 CGFloat heightScale;
 CGFloat speed;

}

- (instancetype)init
{
    self = [super init];
    if (self) {
        widthScale = 0.08;
        heightScale = 0.06;
        speed = 10;
        
        [self spawn];
    }
    return self;
}

-(void) spawn {
    
    __weak PowerUpsManager *weakSelf = self;
    
    //CGFloat randomBetween_0_1 = (CGFloat)arc4random() / UINT32_MAX;
    
    SKAction* delay = [SKAction waitForDuration: 2 + arc4random_uniform(0)];
    SKAction *update = [SKAction runBlock:^{
        [weakSelf createPowerUps];
    }];
    SKAction* updateLoop = [SKAction sequence:@[delay, update]];
    
    [self runAction:[SKAction repeatActionForever:updateLoop]];
}

-(void) createPowerUps {
    
    PowerUpFastShoot * fastShoot = [PowerUpFastShoot powerUpFastShootSpriteWithSize:CGSizeMake(self.scene.size.width * widthScale,  self.scene.size.height * heightScale)];
    
    CGFloat startX = arc4random_uniform(self.scene.size.width - fastShoot.size.width) + fastShoot.size.width / 2;
    CGFloat startY = self.scene.size.height + fastShoot.size.height * 2.5;
    fastShoot.position = CGPointMake(startX, startY);
    [self addChild:fastShoot];
    
    CGFloat destinationY = 0 - self.scene.size.height - fastShoot.size.height;
    CGFloat duration = 100 / speed;
    SKAction* move = [SKAction moveByX:0 y:destinationY duration:duration];
    SKAction* remove = [SKAction removeFromParent];
    
    [fastShoot runAction:[SKAction sequence:@[move, remove]]];
}


@end
