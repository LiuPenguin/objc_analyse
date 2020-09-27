//
//  PHFather.m
//  KCObjc
//
//  Created by YDKJ on 2020/9/23.
//

#import "PHFather.h"

#import <objc/runtime.h>

@implementation PHFather


void dynamicMethodIMP(id self, SEL _cmd) {
    NSLog(@" >> dynamicMethodIMP");
}
//
//void dynamicClassMethodIMP(id self, SEL _cmd) {
//    NSLog(@" >> dynamicClassMethodIMP");
//}
//
+(BOOL)resolveInstanceMethod:(SEL)sel{
    NSLog(@" >> Instance resolving %@", NSStringFromSelector(sel));
    if (sel == @selector(sdd)) {
        class_addMethod([self class], sel, (IMP)dynamicMethodIMP, "v@:");
        return YES;
    }

    return [super resolveInstanceMethod:sel];
}
//
//+ (void)lgClassMethod{
//    NSLog(@"%s",__func__);
//}



//+ (BOOL)resolveClassMethod:(SEL)sel{
//    NSLog(@" >> Class resolving----- %@", NSStringFromSelector(sel));
//    if (sel == @selector(syy)) {
//        IMP imp           = class_getMethodImplementation(objc_getMetaClass("PHFather"), NSSelectorFromString(@"lgClassMethod"));
//        Method sayMMethod = class_getInstanceMethod(objc_getMetaClass("PHFather"), NSSelectorFromString(@"lgClassMethod"));
//        const char *type  = method_getTypeEncoding(sayMMethod);
//        return class_addMethod(objc_getMetaClass("PHFather"), sel, imp, type);
//    }
//    return YES;
//}


@end
