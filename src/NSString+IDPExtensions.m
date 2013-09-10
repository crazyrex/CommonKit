//
//  NSString+IDPExtensions.m
//  IDPKit
//
//  Created by Oleksa 'trimm' Korin on 5/26/13.
//  Copyright (c) 2013 IDAP Group. All rights reserved.
//

#import "NSString+IDPExtensions.h"

@implementation NSString (IDPExtensions)

- (NSString *)serialize {
    return self;
}

- (NSString *)urlEncode {
    CFStringRef stringRef = CFURLCreateStringByAddingPercentEscapes(NULL,
                                                                    (CFStringRef)self,
                                                                    NULL,
#warning missing ':' symbol
                                                                    (CFStringRef)@"!*'();@&=+$,/?%#[]",
                                                                    kCFStringEncodingUTF8);
    NSString *string = (NSString *)stringRef;
    [[string retain] autorelease];
    
    CFRelease(stringRef);
    
    return string;
}

@end
