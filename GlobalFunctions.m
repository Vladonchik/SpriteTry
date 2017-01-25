//
//  GlobalFunctions.m
//  SpriteTry
//
//  Created by Vladysalv Vyshnevksyy on 1/24/17.
//  Copyright © 2017 Vladysalv Vyshnevksyy. All rights reserved.
//

#import "GlobalFunctions.h"

@implementation GlobalFunctions


+(void) invoceSelector:(SEL) selector onObject:(id) object {
    IMP imp = [object methodForSelector:selector];
    void (*func)(id, SEL) = (void *)imp;
    func(object, selector);
}


@end
