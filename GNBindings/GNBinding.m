//
//  NSKBinding.m
//  Aqualog
//
//  Created by Jakub Knejzlik on 13/12/13.
//  Copyright (c) 2013 TheFuntasty. All rights reserved.
//

#import "GNBinding.h"
#import "GNBindingObject.h"

@interface GNBinding () <GNBindingObjectDelegate>
@property (nonatomic,strong) NSMutableArray *_bindingObjects;
@property BOOL updatingBindingObjectsValues;
@end

@implementation GNBinding

-(id)initWithObjects:(NSArray *)objects andKeys:(NSArray *)keys{
    self = [super init];
    if (self) {
        self._bindingObjects = [NSMutableArray array];
        
        for (NSInteger x = 0,l = keys.count; x < l; x++) {
            [self bindObject:[objects objectAtIndex:x] forKey:[keys objectAtIndex:x]];
        }
    }
    return self;
}

-(NSArray *)bindingObjects{
    return self._bindingObjects;
}

-(void)bindObject:(id)object forKey:(NSString *)key{
    GNBindingObject *bindingObject = [[GNBindingObject alloc] initWithObject:object andKey:key];
    bindingObject.delegate = self;
    [self._bindingObjects addObject:bindingObject];
    [bindingObject bind];
}
-(void)unbindObject:(id)object{
    [self unbindObject:object forKey:nil];
}
-(void)unbindObject:(id)object forKey:(NSString *)key{
    for (GNBindingObject *bindingObject in [self.bindingObjects copy]) {
        if(bindingObject.object == object && ([bindingObject.key isEqualToString:key] || !key)){
            [self._bindingObjects removeObject:bindingObject];
            [bindingObject unbind];
        }
    }
}

-(void)unbindAllObjects{
    for (GNBindingObject *bindingObject in self.bindingObjects) {
        [bindingObject unbind];
    }
    [self._bindingObjects removeAllObjects];
}


-(void)bindingObjectDidUpdateValue:(GNBindingObject *)bindingObject{
    if(self.updatingBindingObjectsValues)return;
    self.updatingBindingObjectsValues = YES;
    id value = bindingObject.value;
    for (GNBindingObject *bo in self.bindingObjects) {
        if(bindingObject != bo){
            bo.value = value;
        }
    }
    self.updatingBindingObjectsValues = NO;
}

@end