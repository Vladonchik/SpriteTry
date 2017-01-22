//
//  Extensions.m
//  SpriteTry
//
//  Created by Vladysalv Vyshnevksyy on 1/14/17.
//  Copyright © 2017 Vladysalv Vyshnevksyy. All rights reserved.
//

#import "SKEmitterNode+Extensions.h"

@implementation SKEmitterNode (Extensions)

+(SKEmitterNode*) nodeWithFile:(NSString*) fileName {
    
    NSString* baseFileName = [fileName stringByDeletingPathExtension];
    NSString* fileExtension = [fileName pathExtension];
    
    if ([fileExtension length] == 0) {
        fileExtension = @"sks";
    }
    
    NSString* filePath = [[NSBundle mainBundle] pathForResource:baseFileName ofType:fileExtension];
    SKEmitterNode* node = (id)[NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    return node;
}


-(void) dieInDuration:(NSTimeInterval) duration {
    
    SKAction* firstWait = [SKAction waitForDuration:duration];
    __weak SKEmitterNode *weakSelf = self;
    
    SKAction* stop = [SKAction runBlock:^{
        weakSelf.particleBirthRate = 0;
    }];
    
    SKAction* secondWait = [SKAction waitForDuration:self.particleLifetime];
    SKAction* remove = [SKAction removeFromParent];
    SKAction* die = [SKAction sequence:@[firstWait, stop, secondWait, remove]];
    [self runAction:die];
}



@end
