//
//  ControlPanel.h
//  SpriteTry
//
//  Created by Vladysalv Vyshnevksyy on 1/21/17.
//  Copyright © 2017 Vladysalv Vyshnevksyy. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "Rocket.h"

@interface ControlPanel : SKSpriteNode

+ (instancetype) controlPanelSpriteWithScene:(SKScene*) scene;

//handler
-(void) moveRocket:(Rocket*) rocket withTouches:(NSSet<UITouch*> *) touches;
-(void) clearJostic;

@end
