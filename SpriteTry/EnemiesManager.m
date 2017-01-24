//
//  EnemiesManager.m
//  SpriteTry
//
//  Created by Vladysalv Vyshnevksyy on 1/21/17.
//  Copyright © 2017 Vladysalv Vyshnevksyy. All rights reserved.
//

#import "EnemiesManager.h"


@implementation EnemiesManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self spawn];
    }
    return self;
}

-(void) spawn {
    
    __weak EnemiesManager *weakSelf = self;
    
    //CGFloat randomBetween_0_1 = (CGFloat)arc4random() / UINT32_MAX;
    
    SKAction* delay = [SKAction waitForDuration: 2 + arc4random_uniform(2)];
    SKAction *update = [SKAction runBlock:^{
        [weakSelf createObjects];
    }];
    
    SKAction* updateLoop = [SKAction sequence:@[delay, update]];
    
    [self runAction:[SKAction repeatActionForever:updateLoop]];
}

-(void)createObjects {
    Enemy * enemy = [Enemy enemySpriteWithSize:CGSizeMake(self.scene.size.width * 0.1, self.scene.size.width * 0.1)];
    
    CGFloat startX = arc4random_uniform(self.scene.size.width - enemy.size.width) + enemy.size.width / 2;
    CGFloat startY = self.scene.size.height + enemy.size.height * 1.5;
    enemy.position = CGPointMake(startX, startY);
    [self addChild:enemy];
    
    CGFloat destinationY = 0 - self.scene.size.height - enemy.size.height;
    CGFloat duration = 5;
    SKAction* move = [SKAction moveByX:0 y:destinationY duration:duration];
    SKAction* remove = [SKAction removeFromParent];
    
    [enemy runAction:[SKAction sequence:@[move, remove]]];
}


-(void) enemyKilled:(Enemy*) enemy {

    EnemiesKilled killed = self.enemiesKilled;
    killed.totalEnemiesKilled ++;
    
    if ([enemy isKindOfClass:[Enemy class]]) {
        killed.enemyType1KilledTimes ++;
    }
    
    self.enemiesKilled = killed;
}

@end
