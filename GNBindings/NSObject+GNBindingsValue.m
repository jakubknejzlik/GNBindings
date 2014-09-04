//
//  NSObject+GNBindingsValue.m
//  ey
//
//  Created by Jakub Knejzlik on 04/09/14.
//  Copyright (c) 2014 Funtasty Digital s.r.o. All rights reserved.
//

#import "NSObject+GNBindingsValue.h"


@implementation NSObject (GNBindingsValue)
+(BOOL)gn_friendlyValue:(id)value isEqual:(id)otherValue{
    return value == otherValue || [value gn_isEqualToFriendlyValue:otherValue];
}
-(BOOL)gn_isEqualToFriendlyValue:(id)value{
    return NO;
}
-(NSString *)gn_stringValue{
    return nil;
}
-(NSNumber *)gn_numberValue{
    return nil;
}
-(BOOL)gn_boolValue{
    return NO;
}
-(NSDate *)gn_dateValue{
    return [NSDate date];
}
@end


@implementation NSString (GNBindingsValue)
-(BOOL)gn_isEqualToFriendlyValue:(id)value{
    if([value isKindOfClass:[NSString class]] && [self isEqualToString:value]){
        return YES;
    }
    if([value isKindOfClass:[NSNumber class]]){
        return [value gn_isEqualToFriendlyValue:self];
    }
    return [super gn_isEqualToFriendlyValue:value];
}
-(NSString *)gn_stringValue{
    return self;
}
-(NSNumber *)gn_numberValue{
    return [self length]>0?[[[NSNumberFormatter alloc] init] numberFromString:self]:nil;
}
-(BOOL)gn_boolValue{
    return [[self gn_numberValue] boolValue];
}
@end


@implementation NSNumber (GNBindingsValue)
-(BOOL)gn_isEqualToFriendlyValue:(id)value{
    if([value isKindOfClass:[NSNumber class]] && [self isEqualToNumber:value]){
        return YES;
    }else if([value isKindOfClass:[NSString class]]){
        NSNumber *num = [value gn_numberValue];
        return num && [self isEqualToNumber:num];
    }
    return NO;
}
-(NSString *)gn_stringValue{
    return [self stringValue];
}
-(BOOL)gn_boolValue{
    return [self boolValue];
}
@end


@implementation NSDate (GNBindingsValue)
-(BOOL)gn_isEqualToFriendlyValue:(id)value{
    return [[value gn_dateValue] isEqualToDate:self];
}
-(NSString *)gn_stringValue{
    return self.description;
}
-(NSDate *)gn_dateValue{
    return self;
}
@end