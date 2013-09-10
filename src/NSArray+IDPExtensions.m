//
//  NSArray+IDPExtensions.m
//  Accomplist
//
//  Created by Oleksa 'trimm' Korin on 4/14/13.
//  Copyright (c) 2013 IDAP Group. All rights reserved.
//

#import "NSArray+IDPExtensions.h"

@implementation NSArray (IDPExtensions)

- (id)firstObject {
    if ([self count] == 0) {
        return nil;
    }
    
    return [self objectAtIndex:0];
}

@end

@implementation NSMutableArray (IDPExtensions)

+ (NSMutableArray *)weakArray {
    return [IDPMutableWeakArray array];
}

+ (NSMutableArray *)observableArray {
    return [IDPKVOMutableArray array];
}

+ (NSMutableArray *)observableArrayWithArray:(NSArray *)array {
    return [IDPKVOMutableArray arrayWithArray:array];
}

@end
