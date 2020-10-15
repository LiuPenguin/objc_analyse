//
//  PHFather.m
//  KCObjc
//
//  Created by YDKJ on 2020/9/28.
//


#import "PHFather.h"

#import "PHAnimal.h"

#import <objc/message.h>

@implementation PHFather

-(void)sdddddd{
    
}

+(BOOL)resolveInstanceMethod:(SEL)sel{
    NSLog(@" >> Instance resolving %@", NSStringFromSelector(sel));
    if (sel == @selector(sdd)) {
        class_addMethod([self class], sel, (IMP)dynamicMethodIMP, "v@:");
        
    }
//    if (sel == @selector(sdd)) {
//          NSLog(@"%@ 来了", NSStringFromSelector(sel));
//          //获取sayMaster方法的imp
//          IMP imp = class_getMethodImplementation(self, @selector(sdddddd));
//          //获取sayMaster的实例方法
//          Method sayMethod  = class_getInstanceMethod(self, @selector(sdddddd));
//          //获取sayMaster的丰富签名
//          const char *type = method_getTypeEncoding(sayMethod);
//          //将sel的实现指向sayMaster
//          return class_addMethod(self, sel, imp, type);
//      }
    return [super resolveInstanceMethod:sel];
}


//- (id)forwardingTargetForSelector:(SEL)aSelector{
//    NSLog(@"%s - %@",__func__,NSStringFromSelector(aSelector));
////     runtime + aSelector + addMethod + imp
//    //将消息的接收者指定为LGStudent，在LGStudent中查找say666的实现
////    return [PHAnimal alloc];
//    return [super forwardingTargetForSelector:aSelector];
//}
//
//
//- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
//    NSLog(@"%s - %@",__func__,NSStringFromSelector(aSelector));
//    return [NSMethodSignature signatureWithObjCTypes:"v@:"];
//}
//
//- (void)forwardInvocation:(NSInvocation *)anInvocation{
//    NSLog(@"%s - %@",__func__,anInvocation);
////    PHAnimal * animal = [PHAnimal alloc];
////    anInvocation.target = animal;
////    [anInvocation invoke];
//}

//- (id)forwardingTargetForSelector:(SEL)aSelector{
//    NSLog(@"%s - %@",__func__,NSStringFromSelector(aSelector));
////     runtime + aSelector + addMethod + imp
//    //将消息的接收者指定为LGStudent，在LGStudent中查找say666的实现
////    return [PHAnimal alloc];
//    return [super forwardingTargetForSelector:aSelector];
//}

void dynamicMethodIMP(id self, SEL _cmd) {
    NSLog(@" >> dynamicMethodIMP");
}
//
//
//+(BOOL)resolveInstanceMethod:(SEL)sel{
//    NSLog(@" >> Instance resolving %@", NSStringFromSelector(sel));
//    if (sel == @selector(sdd)) {
//        class_addMethod([self class], sel, (IMP)dynamicMethodIMP, "v@:");
//        return YES;
//    }
//    return [super resolveInstanceMethod:sel];
//}



//void dynamicClassMethodIMP(id self, SEL _cmd) {
//    NSLog(@" >> dynamicClassMethodIMP");
//}
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
