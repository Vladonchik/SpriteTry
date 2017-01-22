//
//  Stars.m
//  SpriteTry
//
//  Created by Vladysalv Vyshnevksyy on 1/14/17.
//  Copyright © 2017 Vladysalv Vyshnevksyy. All rights reserved.
//

#import "Stars.h"

@implementation Stars

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        __weak Stars *weakSelf = self;
        
        SKAction* delay = [SKAction waitForDuration:0.01];
        SKAction *update = [SKAction runBlock:^{
            if (arc4random_uniform(10) < 3) {
                [weakSelf createStars];
            }
        }];
        SKAction* updateLoop = [SKAction sequence:@[delay, update]];
        
        [self runAction:[SKAction repeatActionForever:updateLoop]];
    }
    return self;
}

-(void) createStars {
    
    CGFloat randomX = arc4random_uniform(self.scene.size.width);
    CGFloat maxY = self.scene.size.height;
    CGPoint randomStart = CGPointMake(randomX, maxY);
    
    SKSpriteNode* star = [SKSpriteNode spriteNodeWithImageNamed:@"star"];
    star.position = randomStart;
    star.size = CGSizeMake(3, arc4random_uniform(10));
    star.alpha = 0.1 + (arc4random_uniform(10) / 10.0f);
    [self addChild:star];
    
    CGFloat destinationY = 0 - self.scene.size.height - star.size.height;
    CGFloat duration = 0.1 + arc4random_uniform(10) / 10.0f;
    SKAction* move = [SKAction moveByX:0 y:destinationY duration:duration];
    SKAction* remove = [SKAction removeFromParent];
    
    [star runAction:[SKAction sequence:@[move, remove]]];
}

@end
