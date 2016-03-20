//
//  NSObject+BKProperty.h
//  MJExtensionExample
//
//  Created by bekin on 16/3/20.
//  Copyright © 2016年 小码哥. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+MJClass.h"

typedef NSDictionary * (^MJObjectClassInProperty)();

@interface NSObject (BKProperty)

+ (NSDictionary *)bk_objectClassInModel;

+ (Class)bk_propertyObjectClassInModel:(NSString *)propertyName;

/**
 *  设置property 所对应的 object class
 *
 *  @param objectClassInProperty 设置property 所对应的 object class
 */
+ (void)bk_setupObjectClassInProperty:(MJObjectClassInProperty)objectClassInProperty;

@end
