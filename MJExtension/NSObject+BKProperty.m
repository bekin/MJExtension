//
//  NSObject+BKProperty.m
//  MJExtensionExample
//
//  Created by bekin on 16/3/20.
//  Copyright © 2016年 小码哥. All rights reserved.
//

#import "NSObject+BKProperty.h"
#import <objc/runtime.h>

static const char MJObjectClassInPropertyKey = '\0';

@implementation NSObject (BKProperty)

+ (Class)bk_propertyObjectClassInModel:(NSString *)propertyName{
    __block id clazz = nil;
    if ([self respondsToSelector:@selector(bk_objectClassInModel)]) {
        clazz = [self bk_objectClassInModel][propertyName];
    }
    if (!clazz) {
        [self mj_enumerateAllClasses:^(__unsafe_unretained Class c, BOOL *stop) {
            NSDictionary *dict = objc_getAssociatedObject(c, &MJObjectClassInPropertyKey);
            if (dict) {
                clazz = dict[propertyName];
            }
            if (clazz) *stop = YES;
        }];
    }
    return clazz;
}

+ (void)bk_setupObjectClassInProperty:(MJObjectClassInProperty)objectClassInProperty{
    [self mj_setupBlockReturnValue:objectClassInProperty key:&MJObjectClassInPropertyKey];
//        [[self dictForKey:&MJCachedPropertiesKey] removeAllObjects];
}

@end
