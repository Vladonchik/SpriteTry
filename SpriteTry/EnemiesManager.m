//
//  EnemiesManager.m
//  SpriteTry
//
//  Created by Vladysalv Vyshnevksyy on 1/21/17.
//  Copyright © 2017 Vladysalv Vyshnevksyy. All rights reserved.
//

#import "EnemiesManager.h"
#import "GlobalFunctions.h"



@implementation EnemiesManager



#pragma mark - General

-(void) spawnLevel:(NSNumber*) level {
    
    NSLog(@"%ld", (long)level);
    [self spawnWithDelay:2 forLevel:[level integerValue]];
}

-(void) spawnWithDelay:(NSTimeInterval) delay forLevel:(NSInteger) level {
    
    __weak EnemiesManager *weakSelf = self;
    
    NSString* selectorString = [NSString stringWithFormat:@"spawnLevel_%ld", (long)level];
    SEL selector = NSSelectorFromString(selectorString);
    
    SKAction* wait = [SKAction waitForDuration:delay];
    SKAction *update = [SKAction runBlock:^{
        if ([weakSelf respondsToSelector:selector]) {
            [GlobalFunctions invoceSelector:selector onObject:weakSelf];
        }
    }];
    
    SKAction* updateLoop = [SKAction sequence:@[wait, update]];
    
    [self runAction:[SKAction repeatActionForever:updateLoop]];
    
}

#pragma mark - Level 1


-(void) spawnLevel_1 {
    __weak EnemiesManager *weakSelf = self;
    
    Enemy* enemy = [weakSelf createEnemy];
    
    CGFloat destinationY = 0 - self.scene.size.height - enemy.size.height;
    CGFloat duration = 5;
    SKAction* move = [SKAction moveByX:0 y:destinationY duration:duration];
    SKAction* remove = [SKAction removeFromParent];
    
    [enemy runAction:[SKAction sequence:@[move, remove]]];
    
}

#pragma mark - Level 2

-(void) spawnLevel_2 {
    
    
#warning Remove Node (on collision or x position below screen lower bound) 
    Enemy* enemy = [self createEnemy];
    [enemy.physicsBody applyImpulse:CGVectorMake(1, -10)];
    
}


#pragma mark - Actions on Enemy

-(Enemy*) createEnemy {
    Enemy * enemy = [Enemy enemySpriteWithSize:CGSizeMake(self.scene.size.width * 0.1, self.scene.size.width * 0.1)];
    
    CGFloat startX = arc4random_uniform(self.scene.size.width - enemy.size.width) + enemy.size.width / 2;
    CGFloat startY = self.scene.size.height + enemy.size.height * 1.5;
    enemy.position = CGPointMake(startX, startY);
    [self addChild:enemy];
    
    return enemy;
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
