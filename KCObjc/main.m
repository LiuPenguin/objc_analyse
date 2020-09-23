//
//  main.m
//  KCObjc
//
//  Created by Cooci on 2020/7/24.
//

#import <Foundation/Foundation.h>
#import "PHPerson.h"
#import <objc/runtime.h>
#import "PHFather.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool { 
        
        PHPerson * person = [[PHPerson alloc]init];
        PHFather * father = [[PHFather alloc]init];
        Class cls = object_getClass(person);
        [father performSelector:@selector(sdd)];
        [person doFirst];
        [person doSecond];
        [person doThird];
        NSLog(@"");
    }
    return 0;
}



void lgIMP_classToMetaclass(Class pClass){
    
    const char *className = class_getName(pClass);
    Class metaClass = objc_getMetaClass(className);

    // - (void)sayHello;
    // + (void)sayHappy;
    
    // 对象方法 存在类里面
    // 类方法 存在元类
    
    // 0x1002c3440-
    // 0x1002c3440
    
    IMP imp1 = class_getMethodImplementation(pClass, @selector(sayHello));
    IMP imp2 = class_getMethodImplementation(metaClass, @selector(sayHello)); // 0x0

    IMP imp3 = class_getMethodImplementation(pClass, @selector(sayHappy)); // 0x0
    IMP imp4 = class_getMethodImplementation(metaClass, @selector(sayHappy));

    NSLog(@"%p-%p-%p-%p",imp1,imp2,imp3,imp4);
    NSLog(@"%s",__func__);

}

void test(Class pClass){

    lgIMP_classToMetaclass(pClass);
    // isKindOfClass 类方法: 类和元类的继承连 对比
    
    // clang 属性 - attribute
    // T@"NSString",C,N,V_nickName
    // T ; type 类型
    // C : copy
    // N : nonatomic
    // V : varible
    
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList(pClass, &outCount);
    for (i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
        fprintf(stdout, "%s %s\n", property_getName(property), property_getAttributes(property));
    }

    
    BOOL re1 = [(id)[NSObject class] isKindOfClass:[NSObject class]];       //
    BOOL re2 = [(id)[NSObject class] isMemberOfClass:[NSObject class]];     //
    BOOL re3 = [(id)[PHPerson class] isKindOfClass:[PHPerson class]];       //
    BOOL re4 = [(id)[PHPerson class] isMemberOfClass:[PHPerson class]];     //
    NSLog(@" re1 :%hhd\n re2 :%hhd\n re3 :%hhd\n re4 :%hhd\n",re1,re2,re3,re4);

    BOOL re5 = [(id)[NSObject alloc] isKindOfClass:[NSObject class]];       //
    BOOL re6 = [(id)[NSObject alloc] isMemberOfClass:[NSObject class]];     //
    BOOL re7 = [(id)[PHPerson alloc] isKindOfClass:[PHPerson class]];       //
    BOOL re8 = [(id)[PHPerson alloc] isMemberOfClass:[PHPerson class]];     //
    NSLog(@" re5 :%hhd\n re6 :%hhd\n re7 :%hhd\n re8 :%hhd\n",re5,re6,re7,re8);
}
