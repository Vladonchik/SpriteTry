//
//  BaseObjectsManager.m
//  SpriteTry
//
//  Created by Vladysalv Vyshnevksyy on 1/24/17.
//  Copyright © 2017 Vladysalv Vyshnevksyy. All rights reserved.
//

#import "BasicObjectsManager.h"
#import "GlobalFunctions.h"

@implementation BasicObjectsManager


#pragma mark - General

-(void) spawnLevel:(NSNumber*) level {
    [self spawnWithDelay:2 forLevel:[level integerValue]];
}

-(void) spawnWithDelay:(NSTimeInterval) delay forLevel:(NSInteger) level {
    
    __weak BasicObjectsManager *weakSelf = self;
    
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


@end
