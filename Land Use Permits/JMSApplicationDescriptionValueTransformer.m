//
//  JMSApplicationDescriptionValueTransformer.m
//  Land Use Permits
//
//  Created by Jared Sorge on 12/8/13.
//  Copyright (c) 2013 jsorge. All rights reserved.
//

#import "JMSApplicationDescriptionValueTransformer.h"

@implementation JMSApplicationDescriptionValueTransformer

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
    
    if (value == nil) {
        return nil;
    } else if ([value isKindOfClass:[NSString class]]) {
        NSString *input = value;
        output = [[NSAttributedString alloc] initWithString:input attributes:nil];
    } else if ([value isKindOfClass:[NSAttributedString class]]) {
        NSAttributedString *input = value;
        output = input.string;
    }
    
    return output;
}

- (id)reverseTransformedValue:(id)value
{
    return [self transformedValue:value];
}

@end
