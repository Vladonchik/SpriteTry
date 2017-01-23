//
//  GameScene.m
//  SpriteTry
//
//  Created by Vladysalv Vyshnevksyy on 1/13/17.
//  Copyright © 2017 Vladysalv Vyshnevksyy. All rights reserved.
//

#import "GameScene.h"
#import "Stars.h"
#import "Rocket.h"
#import "Obstacle.h"
#import "ObstaclesManager.h"
#import "Constants.h"
#import "TitleScene.h"
#import "EnemiesManager.h"
#import "Enemy.h"
#import "ControlPanel.h"
#import "CollisionHandler.h"
#import "GameSceneLabels.h"
#import "PowerUpsManager.h"

static CGFloat spaceShipeOffset = 25;

@interface GameScene() <SKPhysicsContactDelegate>

@property (strong, nonatomic) UITapGestureRecognizer* doubleTap;


@end

@implementation GameScene

EnemiesManager* enemiesManager;
ObstaclesManager* obstacleManager;
PowerUpsManager* powerUpsManager;

Rocket* rocket;
ControlPanel* controlPanel;
CollisionHandler* collisionHandler;
GameSceneLabels* gameSceneLabels;

SKShapeNode *spinnyNode;
CFTimeInterval lastUpdatedTime;

#pragma mark - Initialization

-(UITapGestureRecognizer*) doubleTap {
    if (!_doubleTap) {
        _doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDoubleTap:)];
        [_doubleTap setNumberOfTapsRequired:2];
    }
    return _doubleTap;
}

- (instancetype)initWithSize:(CGSize)size
{
    self = [super initWithSize:size];
    if (self) {
        self.physicsWorld.contactDelegate = self;
        self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
        self.physicsWorld.gravity = CGVectorMake(0,0);
        self.backgroundColor = [SKColor blackColor];
        self.physicsBody.categoryBitMask = worldCategory;
        self.physicsBody.collisionBitMask = worldCategory;
        self.physicsBody.contactTestBitMask = worldCategory;
        
        //Collision Handler
        collisionHandler = [CollisionHandler node];
        
        // Background Statrs
        Stars* stars = [Stars node];
        [self addChild:stars];
        
        // Obstacles
        obstacleManager = [ObstaclesManager node];
        [self addChild:obstacleManager];
        
        // Enemies
        enemiesManager = [EnemiesManager node];
        [self addChild:enemiesManager];
        
        // Power Ups
        powerUpsManager = [PowerUpsManager node];
        [self addChild:powerUpsManager];
        
        //Controll Panel
        controlPanel = [ControlPanel controlPanelSpriteWithScene:self];
        [self addChild:controlPanel];
        
        // Rocket
        rocket = [Rocket rocketSprite];
        rocket.position = CGPointMake(size.width / 2, controlPanel.size.height + rocket.size.height / 2 + spaceShipeOffset);
        [self addChild:rocket];
        
        // Labels
        gameSceneLabels = [[GameSceneLabels node] initWithSize:self.size];
        gameSceneLabels.position = CGPointMake(gameSceneLabels.calculateAccumulatedFrame.size.width / 2, self.size.height - gameSceneLabels.calculateAccumulatedFrame.size.height / 2);
        [self addChild:gameSceneLabels];
    }
    return self;
}

-(void)didMoveToView:(SKView *)view {
    [self.view addGestureRecognizer:self.doubleTap];
}

#pragma mark - Touches


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //move rocket
    [controlPanel moveRocket:rocket withTouches:touches];
}


-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [controlPanel clearJostic];
}


-(void)update:(CFTimeInterval)currentTime {
    
    if (lastUpdatedTime ==  0) {
        lastUpdatedTime = currentTime;
    }
    
    if (currentTime - lastUpdatedTime > rocket.fireRate) {
        [rocket shoot];
        lastUpdatedTime = currentTime;
    }
    
}


#pragma mark - Shoot Action

-(void) handleDoubleTap:(UITapGestureRecognizer*) doubleTap {
    CGPoint touchLocation = [doubleTap locationInView:doubleTap.view];
    CGPoint convertPoint = [self convertPointFromView:touchLocation];
    SKNode* touchedNode = [self nodeAtPoint:convertPoint];
    
//    if (touchedNode == controlPanel) {
//        // [rocket shoot];
//    }
}

#pragma mark - Contact Delegate

- (void)didBeginContact:(SKPhysicsContact *)contact {
    uint32_t contactTest = (contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask);
    switch (contactTest) {
        case rocketCategory | obstacleCategory:
            [self gameOver];
            break;
        case rocketCategory | enemyCategory:
            [self gameOver];
            break;
            
        case missileCategory | enemyCategory: {
            [collisionHandler missileAndEnemy:enemiesManager forContact:contact];
            NSInteger enemiesKilled = enemiesManager.enemiesKilled.totalEnemiesKilled;
            [gameSceneLabels enemiesKilled:enemiesKilled];
        }
            break;
        case obstacleCategory | enemyCategory: {
            [collisionHandler enemyAndObstacle:contact];
        }
            break;
        case missileCategory | worldCategory: {
            [collisionHandler missileAndWorld:contact];
        }
            break;
        case powerUpFastShootCategory | rocketCategory: {
            [collisionHandler rocketAndPowerUpFastShoot:contact];
        }
            break;
    }
    
}

-(void) gameOver {
    [self.scene removeAllActions];
    [self.scene removeFromParent];
    TitleScene* endGameScene = [TitleScene sceneWithSize:self.frame.size];
    SKTransition* transition = [SKTransition fadeWithDuration:1.0];
    [self.view presentScene:endGameScene transition:transition];
}


#pragma mark - Deinit

-(void)dealloc {
    [self.view removeGestureRecognizer:self.doubleTap];
    
    NSLog(@"object: %@ dealloced", NSStringFromClass(self.class));
}
@end
