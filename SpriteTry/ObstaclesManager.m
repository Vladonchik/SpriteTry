//
//  ObstaclesManager.m
//  SpriteTry
//
//  Created by Vladysalv Vyshnevksyy on 1/19/17.
//  Copyright © 2017 Vladysalv Vyshnevksyy. All rights reserved.
//

#import "ObstaclesManager.h"
#import "Obstacle.h"

@implementation ObstaclesManager

CGFloat obstacleWidthScale;
CGFloat obstacleHeightScale;

-(void) setObtaclesSpeed:(CGFloat)obtaclesSpeed {
    _obtaclesSpeed = obtaclesSpeed;
    [self removeAllActions];
    [self spawn];
}

-(void) setObtaclesFrequency:(CGFloat)obtaclesFrequency {
    _obtaclesFrequency = obtaclesFrequency;
    [self removeAllActions];
    [self spawn];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        obstacleWidthScale = 0.3;
        obstacleHeightScale = 0.03;
        self.obtaclesSpeed = 20;
        self.obtaclesFrequency = 30;
    }
    return self;
}

-(void) spawn {
    __weak ObstaclesManager *weakSelf = self;
    
    //CGFloat randomBetween_0_1 = (CGFloat)arc4random() / UINT32_MAX;
    
    SKAction* delay = [SKAction waitForDuration: 2 + arc4random_uniform(100 / self.obtaclesFrequency)];
    SKAction *update = [SKAction runBlock:^{
        [weakSelf createObstacles];
    }];
    SKAction* updateLoop = [SKAction sequence:@[delay, update]];
    
    [self runAction:[SKAction repeatActionForever:updateLoop]];
}

-(void) createObstacles {

    Obstacle * obstacle = [Obstacle obstacleSpriteWithSize:CGSizeMake(self.scene.size.width * obstacleWidthScale,  self.scene.size.height * obstacleHeightScale)];
    
    CGFloat startX = arc4random_uniform(self.scene.size.width - obstacle.size.width) + obstacle.size.width / 2;
    CGFloat startY = self.scene.size.height + obstacle.size.height;
    obstacle.position = CGPointMake(startX, startY);
    [self addChild:obstacle];
    
    CGFloat destinationY = 0 - self.scene.size.height - obstacle.size.height;
    CGFloat duration = 100 / self.obtaclesSpeed;
    SKAction* move = [SKAction moveByX:0 y:destinationY duration:duration];
    SKAction* remove = [SKAction removeFromParent];
    
    [obstacle runAction:[SKAction sequence:@[move, remove]]];
}

- (void)dealloc
{
    NSLog(@"object: %@ dealloced", NSStringFromClass(self.class));
}

@end
