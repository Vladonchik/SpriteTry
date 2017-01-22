//
//  EnemiesManager.h
//  SpriteTry
//
//  Created by Vladysalv Vyshnevksyy on 1/21/17.
//  Copyright © 2017 Vladysalv Vyshnevksyy. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "Enemy.h"

struct EnemiesKilled {
    CGFloat enemyType1KilledTimes;
    
    CGFloat totalEnemiesKilled;
};

typedef struct EnemiesKilled EnemiesKilled;

@interface EnemiesManager : SKSpriteNode


@property (assign, nonatomic) EnemiesKilled enemiesKilled;

-(void) enemyKilled:(Enemy*) enemy;

@end
