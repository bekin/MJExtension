//
//  MJProperty+BKProperty.m
//  MJExtensionExample
//
//  Created by bekin on 16/3/20.
//  Copyright © 2016年 小码哥. All rights reserved.
//

#import "MJProperty+BKProperty.h"
#import "MJExtensionConst.h"

@implementation MJProperty (BKProperty)

+ (instancetype)bk_cachedPropertyWithProperty:(objc_property_t)property objectClass:(Class)objectClass{
    MJProperty *propertyObj = objc_getAssociatedObject(self, property);
    if (propertyObj == nil) {
        propertyObj = [[self alloc] init];
        [propertyObj bk_setProperty:property propertyObjectClass:objectClass];
        objc_setAssociatedObject(self, property, propertyObj, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return propertyObj;
}

- (void)bk_setProperty:(objc_property_t)property propertyObjectClass:(Class)propertyObjectClass{
        _property = property;
    
    MJExtensionAssertParamNotNil(property);
    
    // 1.属性名
    _name = @(property_getName(property));
    
    // 2.成员类型
    NSString *code = nil;
    if (propertyObjectClass){
        code = [NSString stringWithFormat:@"@\"%@\"", NSStringFromClass(propertyObjectClass)];
    }else{
        NSString *attrs = @(property_getAttributes(property));
        NSUInteger dotLoc = [attrs rangeOfString:@","].location;
        NSUInteger loc = 1;
        if (dotLoc == NSNotFound) { // 没有,
            code = [attrs substringFromIndex:loc];
        } else {
            code = [attrs substringWithRange:NSMakeRange(loc, dotLoc - loc)];
        }
    }
    _type = [MJPropertyType cachedTypeWithCode:code];
}


@end
