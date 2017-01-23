//
//  GameSceneLabels.m
//  SpriteTry
//
//  Created by Vladysalv Vyshnevksyy on 1/23/17.
//  Copyright © 2017 Vladysalv Vyshnevksyy. All rights reserved.
//

#import "GameSceneLabels.h"


@implementation GameSceneLabels

CGFloat widthScale = 0.5;
CGFloat heightScale = 0.15;
SKLabelNode* enemiesKilledLabel;
SKLabelNode* coinsLabel;

- (instancetype)initWithSize:(CGSize) size
{
    self = [super init];
    if (self) {
        
        self.size = CGSizeMake(size.width, size.height * heightScale);

        enemiesKilledLabel = [SKLabelNode labelNodeWithFontNamed:@"AvenirNext-Heavy"];
        enemiesKilledLabel.text = @"Enemies Killed: 0";
        enemiesKilledLabel.fontColor = [SKColor whiteColor];
        enemiesKilledLabel.fontSize = 16;
        
        enemiesKilledLabel.position = CGPointMake(- self.frame.size.width /2 + enemiesKilledLabel.frame.size.width / 2, self.frame.size.height / 2 - enemiesKilledLabel.frame.size.height );
        [self addChild:enemiesKilledLabel];

        coinsLabel = [SKLabelNode labelNodeWithFontNamed:@"AvenirNext-Heavy"];
        coinsLabel.text = @"Coins: 0";
        coinsLabel.fontColor = [SKColor whiteColor];
        coinsLabel.fontSize = 16;
        [self alignNode:coinsLabel toLeftEdge:self];
        [self alignNode:coinsLabel belowNode:enemiesKilledLabel];
        [self addChild:coinsLabel];
    }
    return self;
}


-(void) enemiesKilled:(NSInteger) killed {
    enemiesKilledLabel.text = [NSString stringWithFormat:@"Enemies Killed: %ld", (long)killed];
    [self alignNode:enemiesKilledLabel toLeftEdge:self];
}


-(void) coinsCollected:(NSInteger) coins {
    coinsLabel.text = [NSString stringWithFormat:@"Coins: %ld", (long)coins];
    [self alignNode:coinsLabel toLeftEdge:self];
    [self alignNode:coinsLabel belowNode:enemiesKilledLabel];
}

-(void) alignNode:(SKNode*) node toLeftEdge:(SKNode*) baseNode  {
    node.position = CGPointMake( -baseNode.frame.size.width /2 + node.frame.size.width / 2, node.position.y);
}

-(void) alignNode:(SKNode*) node belowNode:(SKNode*) baseNode {
    node.position = CGPointMake(node.position.x, baseNode.position.y - baseNode.frame.size.height);
}


@end
