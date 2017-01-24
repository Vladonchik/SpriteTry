//
//  ControlPanel.m
//  SpriteTry
//
//  Created by Vladysalv Vyshnevksyy on 1/21/17.
//  Copyright © 2017 Vladysalv Vyshnevksyy. All rights reserved.
//

#import "ControlPanel.h"
#import "Constants.h"
@implementation ControlPanel

SKSpriteNode* jostic;

+ (instancetype) controlPanelSpriteWithScene:(SKScene*) scene {
    
    ControlPanel* controlPanel = [ControlPanel spriteNodeWithColor:[SKColor clearColor] size:CGSizeMake(scene.size.width, scene.size.height * 1)];
    controlPanel.position = CGPointMake(scene.size.width / 2, controlPanel.size.height / 2);

    return controlPanel;
}


-(void) moveRocket:(Rocket*) rocket withTouches:(NSSet<UITouch*> *) touches {
    UITouch* touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInNode:self.scene];
    if (!jostic) {

        SKNode* touchedNode = [self.scene nodeAtPoint:touchLocation];
        
        if (touchedNode == self) {
            
            jostic = [SKSpriteNode spriteNodeWithColor:[UIColor redColor] size:CGSizeMake(40, 40)];
            jostic.position = touchLocation;
            jostic.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:jostic.size];
            jostic.physicsBody.categoryBitMask = josticCategory;
            jostic.physicsBody.collisionBitMask = josticCategory;
            [self.scene addChild:jostic];
            // attach jostic to rocket
            
            SKPhysicsJoint* joint = [SKPhysicsJointFixed  jointWithBodyA:jostic.physicsBody bodyB:rocket.physicsBody anchor:touchLocation];
            
            //SKPhysicsJoint* joint = [SKPhysicsJointSliding jointWithBodyA:jostic.physicsBody bodyB:rocket.physicsBody anchor:touchLocation axis:CGVectorMake(0, 1)];
            [self.scene.physicsWorld addJoint:joint];
        }
    }
    else {
        // remove jostic if out of controller panel
        if (CGRectContainsPoint(self.frame, jostic.position)) {
            jostic.position = touchLocation;
        }
        else {
            [self clearJostic];
        }        
    }
}

-(void) clearJostic {
    [jostic removeFromParent];
    jostic = nil;
}
@end
