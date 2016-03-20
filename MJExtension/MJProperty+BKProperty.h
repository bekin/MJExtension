//
//  MJProperty+BKProperty.h
//  MJExtensionExample
//
//  Created by bekin on 16/3/20.
//  Copyright © 2016年 小码哥. All rights reserved.
//

#import "MJProperty.h"
#import "NSObject+MJClass.h"

@interface MJProperty (BKProperty)

/**
 *  初始化
 *
 *  @param property    property
 *  @param objectClass property 所对应的object class
 *
 *  @return instance
 */
+ (instancetype)bk_cachedPropertyWithProperty:(objc_property_t)property objectClass:(Class)objectClass;

/**
 *  设置属性
 *
 *  @param property            property
 *  @param propertyObjectClass property 所对应的object class
 */
- (void)bk_setProperty:(objc_property_t)property propertyObjectClass:(Class)propertyObjectClass;

@end
