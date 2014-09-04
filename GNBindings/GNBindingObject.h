//
//  GNBindingObject.h
//  ey
//
//  Created by Jakub Knejzlik on 04/09/14.
//  Copyright (c) 2014 Funtasty Digital s.r.o. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol GNBindingObjectDelegate;

@interface GNBindingObject : NSObject
@property (nonatomic,assign) id<GNBindingObjectDelegate> delegate;
@property (nonatomic,weak) id object;
@property (nonatomic,copy) NSString *key;
@property (nonatomic,strong) id value;

-(id)initWithObject:(id)object andKey:(NSString *)key;

-(void)bind;
-(void)unbind;

@end


@protocol GNBindingObjectDelegate <NSObject>
-(void)bindingObjectDidUpdateValue:(GNBindingObject *)bindingObject;
@end



@interface NSObject (GNBindingObject)
-(void)gn_bind:(GNBindingObject *)bindingObject;
-(void)gn_unbind:(GNBindingObject *)bindingObject;

-(void)gn_setValue:(id)value forKey:(NSString *)key;
-(id)gn_valueForKey:(NSString *)key;
@end