//
//  NSObject+Swizzle.h
//
//  Created by John AppleSeed on 21/11/13.
//

#import <Foundation/Foundation.h>

@interface NSObject (Swizzle)
+ (void)mvl_swizzleClassMethod:(SEL)origSel with:(SEL)newSel;
+ (void)mvl_swizzleClassMethod:(SEL)origSel with:(SEL)newSel of:(Class)c2;
+ (void)mvl_swizzleInstanceMethod:(SEL)origSel with:(SEL)newSel;
@end
