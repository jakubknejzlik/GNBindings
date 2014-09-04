//
//  NSKBinding.h
//  Aqualog
//
//  Created by Jakub Knejzlik on 13/12/13.
//  Copyright (c) 2013 TheFuntasty. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GNBindings;
@interface GNBinding : NSObject
@property (nonatomic,readonly) NSArray *bindingObjects;
@property (nonatomic,strong) id value;

-(id)initWithObjects:(NSArray *)objects andKeys:(NSArray *)keys;

-(void)bindObject:(id)object forKey:(NSString *)key;
-(void)unbindObject:(id)object forKey:(NSString *)key;

-(void)unbindAllObjects;

@end