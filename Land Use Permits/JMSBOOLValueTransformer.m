//
//  JMSBOOLValueTransformer.m
//  Land Use Permits
//
//  Created by Jared Sorge on 12/3/13.
//  Copyright (c) 2013 jsorge. All rights reserved.
//

#import "JMSBOOLValueTransformer.h"

@implementation JMSBOOLValueTransformer

+ (Class)transformedValueClass
{
    return [NSString class];
}

+ (BOOL)allowsReverseTransformation
{
    return YES;
}

- (id)transformedValue:(id)value
{
    id output;
    
    if ( value == nil ) {
        return nil;
    } else if ( [value isKindOfClass:[NSNumber class]] ) {
        NSNumber *input = (NSNumber *)value;
        if ( [input isEqualToNumber:@0]) {
            output = @"No";
        } else if ([input isEqualToNumber:@1]) {
            output = @"Yes";
        }
    } else if ( [value isKindOfClass:[NSString class]] ) {
        NSString *input = (NSString *)value;
        if ( [input isEqualToString:@"Yes"] ) {
            output = @1;
        } else if ([input isEqualToString:@"No"]) {
            output = @0;
        }
    }
    
    return output;
}

- (id)reverseTransformedValue:(id)value
{
    return [self transformedValue:value];
}

@end
