//
//  NSObject+GNBindingsValue.h
//  ey
//
//  Created by Jakub Knejzlik on 04/09/14.
//  Copyright (c) 2014 Funtasty Digital s.r.o. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (GNBindingsValue)
+(BOOL)gn_friendlyValue:(id)value isEqual:(id)otherValue;
-(BOOL)gn_isEqualToFriendlyValue:(id)value;
-(NSString *)gn_stringValue;
-(NSNumber *)gn_numberValue;
-(BOOL)gn_boolValue;
-(NSDate *)gn_dateValue;
@end
