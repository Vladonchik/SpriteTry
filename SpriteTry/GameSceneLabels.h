//
//  GameSceneLabels.h
//  SpriteTry
//
//  Created by Vladysalv Vyshnevksyy on 1/23/17.
//  Copyright © 2017 Vladysalv Vyshnevksyy. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface GameSceneLabels : SKSpriteNode

- (instancetype)initWithSize:(CGSize) size;


-(void) enemiesKilled:(NSInteger) killed;
-(void) coinsCollected:(NSInteger) coins;

@end
