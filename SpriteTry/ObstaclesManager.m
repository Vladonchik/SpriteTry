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

- (instancetype)init
{
    self = [super init];
    if (self) {
        obstacleWidthScale = 0.3;
        obstacleHeightScale = 0.03;
        obtaclesSpeed = 20;
    }
    return self;
}

#pragma mark - Level 1

-(void) spawnLevel_1 {
    
    //CGFloat randomBetween_0_1 = (CGFloat)arc4random() / UINT32_MAX;
    Obstacle* obstacle = [self createObstacle];
    
    CGFloat destinationY = 0 - self.scene.size.height - obstacle.size.height;
    CGFloat duration = 100 / obtaclesSpeed;
    SKAction* move = [SKAction moveByX:0 y:destinationY duration:duration];
    SKAction* remove = [SKAction removeFromParent];
    
    [obstacle runAction:[SKAction sequence:@[move, remove]]];
}


#pragma mark - Actions on Obstacle

-(Obstacle*) createObstacle {
    Obstacle * obstacle = [Obstacle obstacleSpriteWithSize:CGSizeMake(self.scene.size.width * obstacleWidthScale, self.scene.size.width * obstacleHeightScale)];
    
    CGFloat startX = arc4random_uniform(self.scene.size.width - obstacle.size.width) + obstacle.size.width / 2;
    CGFloat startY = self.scene.size.height + obstacle.size.height * 1.8;
    obstacle.position = CGPointMake(startX, startY);
    [self addChild:obstacle];
    
    return obstacle;
}

@end
