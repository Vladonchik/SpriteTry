//
//  TitleScene.m
//  SpriteTry
//
//  Created by Vladysalv Vyshnevksyy on 1/14/17.
//  Copyright © 2017 Vladysalv Vyshnevksyy. All rights reserved.
//

#import "TitleScene.h"
#import "GameScene.h"
#import "Stars.h"
#import "SKEmitterNode+Extensions.h"
#import "GameStartNode.h"

@implementation TitleScene

-(instancetype)initWithSize:(CGSize)size {
    
    if (self  = [super initWithSize:size]) {
        
        self.backgroundColor = [SKColor blackColor];
        
        // Create Stars
        Stars* starsField = [Stars node];
        [self addChild:starsField];
        
        
        // Hero
        SKSpriteNode* hero = [SKSpriteNode spriteNodeWithImageNamed:@"spaceship"];
        hero.size = CGSizeMake(100, 100);
        hero.position = CGPointMake(size.width / 2, size.height / 2);
        [self addChild:hero];
        
        // Engine Fire
        SKEmitterNode* engine = [SKEmitterNode nodeWithFile:@"fireBug.sks"];
        engine.position = CGPointMake(0, - hero.size.height / 2);
        [hero addChild:engine];
        
        // Game Start Text
        GameStartNode* gameStartNode = [GameStartNode node];
        gameStartNode.position = CGPointMake(self.size.width / 2, self.size.height - 120);
        [self addChild:gameStartNode];
        
        // High Scores
        NSNumberFormatter* scoreFormatter = [[NSNumberFormatter alloc] init];
        scoreFormatter.numberStyle = NSNumberFormatterDecimalStyle;
        
        NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
        [defaults registerDefaults:@{@"highScore" : @0}];
        
        NSNumber* score = [defaults valueForKey:@"highScore"];
        NSString* scoreText = [NSString stringWithFormat:@"High Score: %@", [scoreFormatter stringFromNumber:score]];
        [gameStartNode setScore:scoreText];
    }
    return self;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    GameScene* gameScene = [GameScene sceneWithSize:self.frame.size];
    SKTransition* transition = [SKTransition fadeWithDuration:1.0];
    [self.view presentScene:gameScene transition:transition];
}

- (void)dealloc {
    NSLog(@"object: %@ dealloced", NSStringFromClass(self.class));
}


@end


