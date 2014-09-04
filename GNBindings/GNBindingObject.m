//
//  GNBindingObject.m
//  ey
//
//  Created by Jakub Knejzlik on 04/09/14.
//  Copyright (c) 2014 Funtasty Digital s.r.o. All rights reserved.
//

#import "GNBindingObject.h"
#import "NSObject+GNBindingsValue.h"

@implementation GNBindingObject

-(id)initWithObject:(id)object andKey:(NSString *)key{
    self = [super init];
    if (self) {
        self.object = object;
        self.key = key;
    }
    return self;
}

-(void)bind{
    [self.object gn_bind:self];
}
-(void)unbind{
    [self.object gn_unbind:self];
}

-(id)value{
    return [self.object gn_valueForKey:self.key];
}
-(void)setValue:(id)value{
    [self.object gn_setValue:value forKey:self.key];
}
-(void)valueUpdated{
    [self.delegate bindingObjectDidUpdateValue:self];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    [self valueUpdated];
}
-(void)objectDidChangeNotificationHandler:(NSNotification *)notification{
    [self valueUpdated];
}

@end




@implementation NSObject (GNBindingObject)
-(void)gn_bind:(GNBindingObject *)bindingObject{
    [self addObserver:bindingObject forKeyPath:bindingObject.key options:0 context:nil];
}
-(void)gn_unbind:(GNBindingObject *)bindingObject{
    [self removeObserver:bindingObject forKeyPath:bindingObject.key];
}

-(void)gn_setValue:(id)value forKey:(NSString *)key{
    if(!value){
        [self setNilValueForKey:key];
    }else [self setValue:value forKey:key];
}
-(id)gn_valueForKey:(NSString *)key{
    return [self valueForKey:key];
}
@end


@implementation UITextField (GNBindingObject)
-(void)gn_bind:(GNBindingObject *)bindingObject{
    [[NSNotificationCenter defaultCenter] addObserver:bindingObject selector:@selector(objectDidChangeNotificationHandler:) name:UITextFieldTextDidChangeNotification object:self];
}
-(void)gn_unbind:(GNBindingObject *)bindingObject{
    [[NSNotificationCenter defaultCenter] removeObserver:bindingObject name:UITextFieldTextDidChangeNotification object:self];
}

-(void)gn_setValue:(id)value forKey:(NSString *)key{
    self.text = [value gn_stringValue];
}
-(id)gn_valueForKey:(NSString *)key{
    return self.text;
}

@end