//
//  EnemiesManager.m
//  SpriteTry
//
//  Created by Vladysalv Vyshnevksyy on 1/21/17.
//  Copyright © 2017 Vladysalv Vyshnevksyy. All rights reserved.
//

#import "EnemiesManager.h"

@interface EnemiesManager()

//@property (assign, nonatomic, readwrite) EnemiesKilled enemiesKilled;

@end

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
    
    SKAction* delay = [SKAction waitForDuration: 2 + arc4random_uniform(3)];
    SKAction *update = [SKAction runBlock:^{
        [weakSelf createEnemies];
    }];
    SKAction* updateLoop = [SKAction sequence:@[delay, update]];
    
    [self runAction:[SKAction repeatActionForever:updateLoop]];
}

-(void) createEnemies {
    
    Enemy * enemy = [Enemy enemySpriteWithSize:CGSizeMake(40, 40)];
    
    CGFloat startX = arc4random_uniform(self.scene.size.width - enemy.size.width) + enemy.size.width / 2;
    CGFloat startY = self.scene.size.height + enemy.size.height * 3.5;
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
    
    NSLog(@"%f", self.enemiesKilled.totalEnemiesKilled);
}

@end
