//
//  EnemiesManager.h
//  SpriteTry
//
//  Created by Vladysalv Vyshnevksyy on 1/21/17.
//  Copyright © 2017 Vladysalv Vyshnevksyy. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "Enemy.h"
#import "BaseObjectsManager.h"

struct EnemiesKilled {
    NSInteger enemyType1KilledTimes;
    
    NSInteger totalEnemiesKilled;
};

typedef struct EnemiesKilled EnemiesKilled;

@interface EnemiesManager : BaseObjectsManager


@property (assign, nonatomic) EnemiesKilled enemiesKilled;

-(void) enemyKilled:(Enemy*) enemy;

@end
