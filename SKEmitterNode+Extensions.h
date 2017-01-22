//
//  Extensions.h
//  SpriteTry
//
//  Created by Vladysalv Vyshnevksyy on 1/14/17.
//  Copyright © 2017 Vladysalv Vyshnevksyy. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface  SKEmitterNode (Extensions)

+(SKEmitterNode*) nodeWithFile:(NSString*) fileName;
-(void) dieInDuration:(NSTimeInterval) duration;

@end
