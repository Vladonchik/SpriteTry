//
//  Rocket.h
//  SpriteTry
//
//  Created by Vladysalv Vyshnevksyy on 1/15/17.
//  Copyright © 2017 Vladysalv Vyshnevksyy. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>


@interface Rocket : SKSpriteNode

//properties
@property (assign, nonatomic) CGFloat acceleration;
@property (assign, nonatomic) CGFloat fireRate;

//create rocket
+ (instancetype) rocketSprite;

-(void) shoot;


-(void) stopMoving;
-(void) moveRight;
-(void) moveLeft;

@end
