//
//  GameStartNode.m
//  SpriteTry
//
//  Created by Vladysalv Vyshnevksyy on 1/14/17.
//  Copyright © 2017 Vladysalv Vyshnevksyy. All rights reserved.
//

#import "GameStartNode.h"

@implementation GameStartNode

{
    SKLabelNode *scoreNode;
}

- (instancetype)initWithSize:(CGSize) size
{
    self = [super init];
    if (self) {
        
        SKLabelNode* label = [SKLabelNode labelNodeWithFontNamed:@"AvenirNext-Heavy"];
        label.fontSize = 32;
        label.fontColor = [SKColor whiteColor];
        label.text = @"Space Fun";
        [self addChild:label];
        
        label.alpha = 0;
        label.xScale = 0.2;
        label.yScale = 0.2;
        SKAction* fadeIn = [SKAction fadeAlphaTo:1 duration:2];
        SKAction* scaleIn = [SKAction scaleTo:1 duration:2];
        // run at the same time (both animations)
        SKAction* fadeAndScale = [SKAction group:@[fadeIn, scaleIn]];
        [label runAction:fadeAndScale];
        
        SKLabelNode* instructions = [SKLabelNode labelNodeWithFontNamed:@"AvenirNext-Medium"];
        instructions.fontSize = 14;
        instructions.fontColor = [SKColor whiteColor];
        instructions.text = @"Tap to start game";
        instructions.position = CGPointMake(0, - size.height * 0.05);
        [self addChild:instructions];
        
        instructions.alpha = 0;
        SKAction* wait = [SKAction waitForDuration:2];
        SKAction* appear = [SKAction fadeAlphaTo:1 duration:2];
        SKAction* popUp = [SKAction scaleTo:1.1 duration:0.1];
        SKAction* dropDown = [SKAction scaleTo:1 duration:0.1];
        SKAction* pauseAndAppear = [SKAction sequence:@[wait,appear, popUp, dropDown]];
        SKAction* repeatForever = [SKAction repeatActionForever:pauseAndAppear];
        [instructions runAction:repeatForever];

        scoreNode = [SKLabelNode labelNodeWithFontNamed:@"AvenirNext-Medium"];
        scoreNode.fontSize = 16;
        scoreNode.fontColor = [SKColor whiteColor];
        scoreNode.position = CGPointMake(0, - size.height * 0.7);
        [self addChild:scoreNode];
    }
    return self;
}

-(void) setScore:(NSString*) score {
    scoreNode.text = score;
}

@end
