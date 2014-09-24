//
//  NSKBindings.h
//  Aqualog
//
//  Created by Jakub Knejzlik on 13/12/13.
//  Copyright (c) 2013 TheFuntasty. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GNBinding.h"

@interface GNBindings : NSObject
@property (nonatomic,readonly) NSMutableSet *allBindings;

+(instancetype)bindings;

-(GNBinding *)addBindingForKey:(NSString *)key ofObject:(NSObject *)object toBindingForKey:(NSString *)otherKey ofObject:(NSObject *)otherObject;

-(void)removeBinding:(GNBinding *)binding;
-(void)removeBindings:(NSArray *)bindings;
-(void)removeAllBindings;

@end


@interface GNBinding (ObjectGetters)
-(NSArray *)bindingsForObject:(id)object;
@end