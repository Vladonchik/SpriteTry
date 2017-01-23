//
//  GameSceneLabels.m
//  SpriteTry
//
//  Created by Vladysalv Vyshnevksyy on 1/23/17.
//  Copyright © 2017 Vladysalv Vyshnevksyy. All rights reserved.
//

#import "GameSceneLabels.h"

CGFloat const widthScale = 0.5;
CGFloat const heightScale = 0.15;

@implementation GameSceneLabels

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
        enemiesKilledLabel.position = CGPointMake(self.frame.origin.x + enemiesKilledLabel.frame.size.width / 2, self.frame.size.height / 2 - enemiesKilledLabel.frame.size.height );
        [self addChild:enemiesKilledLabel];

        coinsLabel = [SKLabelNode labelNodeWithFontNamed:@"AvenirNext-Heavy"];
        coinsLabel.text = @"Coins: 0";
        coinsLabel.fontColor = [SKColor whiteColor];
        coinsLabel.fontSize = 16;
        coinsLabel.position = CGPointMake(self.frame.origin.x + coinsLabel.frame.size.width / 2, enemiesKilledLabel.position.y - enemiesKilledLabel.frame.size.height);
        [self addChild:coinsLabel];
    }
    return self;
}


-(void) enemiesKilled:(NSInteger) killed {
    enemiesKilledLabel.text = [NSString stringWithFormat:@"Enemies Killed: %ld", (long)killed];
}



-(void) coinsCollected:(NSInteger) coins {
    coinsLabel.text = [NSString stringWithFormat:@"Coins: %ld", (long)coins];
}




@end
