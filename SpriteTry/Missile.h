//
//  Bullet.h
//  SpriteTry
//
//  Created by Vladysalv Vyshnevksyy on 1/19/17.
//  Copyright © 2017 Vladysalv Vyshnevksyy. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface Missile : SKSpriteNode


+ (instancetype) missileSpriteWithSize:(CGSize) size;


// Public API
-(void) shootNormal;
-(void) shootFast;
-(void) shootWithCustomVelocity:(CGFloat) velocity;


@end
