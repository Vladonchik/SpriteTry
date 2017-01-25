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
CGFloat obtaclesSpeed;
CGFloat obtaclesFrequency;

- (instancetype)init
{
    self = [super init];
    if (self) {
        obstacleWidthScale = 0.3;
        obstacleHeightScale = 0.03;
        obtaclesSpeed = 20;
        obtaclesFrequency = 30;
    }
    return self;
}


-(void) spawnLevel_1 {
    __weak ObstaclesManager *weakSelf = self;
    
    //CGFloat randomBetween_0_1 = (CGFloat)arc4random() / UINT32_MAX;
    
    SKAction* delay = [SKAction waitForDuration: 2 + arc4random_uniform(100 / obtaclesFrequency)];
    SKAction *update = [SKAction runBlock:^{
        [weakSelf createObstacles];
    }];
    SKAction* updateLoop = [SKAction sequence:@[delay, update]];
    
    [self runAction:[SKAction repeatActionForever:updateLoop]];
}

-(void) createObstacles {

    Obstacle * obstacle = [Obstacle obstacleSpriteWithSize:CGSizeMake(self.scene.size.width * obstacleWidthScale,  self.scene.size.height * obstacleHeightScale)];
    
    CGFloat startX = arc4random_uniform(self.scene.size.width - obstacle.size.width) + obstacle.size.width / 2;
    CGFloat startY = self.scene.size.height + obstacle.size.height * 1.8;
    obstacle.position = CGPointMake(startX, startY);
    [self addChild:obstacle];
    
    CGFloat destinationY = 0 - self.scene.size.height - obstacle.size.height;
    CGFloat duration = 100 / obtaclesSpeed;
    SKAction* move = [SKAction moveByX:0 y:destinationY duration:duration];
    SKAction* remove = [SKAction removeFromParent];
    
    [obstacle runAction:[SKAction sequence:@[move, remove]]];
}

- (void)dealloc {
    NSLog(@"object: %@ dealloced", NSStringFromClass(self.class));
}

@end
