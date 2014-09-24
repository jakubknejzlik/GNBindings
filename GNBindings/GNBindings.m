    //
//  NSKBindings.m
//  Aqualog
//
//  Created by Jakub Knejzlik on 13/12/13.
//  Copyright (c) 2013 TheFuntasty. All rights reserved.
//

#import "GNBindings.h"
#import "GNBinding.h"


@interface GNBindings ()
@end

@implementation GNBindings

+(instancetype)bindings{
    return [[self alloc] init];
}

-(id)init{
    self = [super init];
    if (self) {
        _allBindings = [NSMutableSet set];
    }
    return self;
}

-(void)dealloc{
//    NSLog(@"destroying");
}

-(GNBinding *)addBindingForKey:(NSString *)key ofObject:(NSObject *)object toBindingForKey:(NSString *)otherKey ofObject:(NSObject *)otherObject{
    GNBinding *binding = [[GNBinding alloc] initWithObjects:@[object,otherObject] andKeys:@[key,otherKey]];
    [self.allBindings addObject:binding];
    return binding;
}
-(void)removeBinding:(GNBinding *)binding{
    [binding unbindAllObjects];
    [self.allBindings removeObject:binding];
}
-(void)removeBindings:(NSArray *)bindings{
    for (GNBinding *binding in bindings) {
        [self removeBinding:binding];
    }
}
-(void)removeAllBindings{
    [self removeBindings:[self.allBindings copy]];
}

@end


@implementation GNBindings (ObjectGetters)

-(void)removeBindingsForObject:(id)object{
    [self removeBindingsForObject:object key:nil];
}
-(void)removeBindingsForObject:(id)object key:(NSString *)key{
    for (GNBinding *binding in self.allBindings) {
        [binding unbindObject:object forKey:key];
//        for (GNBindingObject *bo in binding.bindingObjects) {
//            if (bo.object == object) {
//                [binding unbindObject:object forKey:key];
//            }
//        }
    }
}

@end