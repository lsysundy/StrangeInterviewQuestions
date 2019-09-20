//
//  ViewController.m
//  StrangeInterviewQuestions
//
//  Created by 刘帅仪 on 2019/9/19.
//  Copyright © 2019 刘帅仪. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+Test.h"
#import "Person.h"

@interface ViewController ()<PropertyProtocol>
{
    //方式二，.m文件中添加合成speed属性的成员变量_speed和对应的getter和setter方法
    NSUInteger _speed;
}

@end


/**
  OC语言的协议里面是支持声明属性的，而在协议中声明属性其实和在其中定义方法一样只是声明了getter和setter方法，并没有具体实现，所以当这个协议属性修饰符为@required时，如果不实现编译器就会报出警告，最简单的方式就是加上属性同步语句@synthesize propertyName;
 
      其实iOS的UIKit中就有协议中声明属性的例子：
      打开UIKit中的协议UIApplicationDelegate声明就可以看到属性window；
 
  属性和方法其实都是一个事物的特性，协议正是描述某类行为和特性的一种规范，基于这个事实，所以在协议中定义属性是很符合道理的。之所以在iOS开发中很少看到有人这么使用过是因为，iOS开发中协议通常是被用作代理模式而存在的，并且如果在协议中定义了是属性，就必须在实现类中添加对属性自动同步或者手动添加属性实现代码
 
 */
@implementation ViewController
//方式一：
@synthesize speed;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1. 对于自定义的宏：#define MIN((X) < (Y) ? (X) : (Y))
//    float x = 1.0;
//    float y = MIN(x++, 1.5);
//    NSLog(@"x=%.f---y=%.f\n", x, y);
//
//    //2. 在MRC下，如下代码 a b c d e的引用计数
//    NSString *a = @"abc";
//    NSString *b = [a retain];
//    NSString *c = [b copy];
//    NSString *d = [c mutableCopy];
//    NSString *e = [d copy];
//    NSLog(@"a=%ld\nb=%ld\nc=%ld\nd=%ld\ne=%ld\n",(unsigned long)[a retainCount],(unsigned long)[b retainCount],(unsigned long)[c retainCount],(unsigned long)[d retainCount],(unsigned long)[e retainCount]);
//
//    //3. 类继承图
//    [NSObject test];
//    [ClassA test];
////    [[[NSObject alloc] init] test]; //crash
////    [[[ClassA alloc] init] test]; //crash
//
//    NSLog(@"%@", [self getString]);
    
    
    id cls = [Person class];
    void *obj = &cls;
    [(__bridge id)obj print]; //输出ViewController中的self对象
    
    Person *person = [[Person alloc] init];
    
    
}


/**
 在MRC模式下,CoreFundation与Fundation框架的对象之间可以直接相互转换
 在ARC模式下,CoreFundation还是手动内存管理,而Fundation框架中的对象由ARC帮我们管理
 所以在ARC模式下,CoreFundation与Fundation框架之间相互转换后,就存在一个问题,对象的生命周期到底由谁来管理

 一下考虑在arc下讨论
 以下代码会造成内存泄漏
 */
- (NSString *)getString {
    
    CFStringRef cfString = CFStringCreateWithCString(NULL, "string", kCFStringEncodingUTF8);
    NSString *string = (__bridge NSString *)cfString;
    //需要手动释放
    CFRelease(cfString);
    
    NSString *string1 = @"string";
    CFStringRef cfString1 = (__bridge CFStringRef)string1;
    //无需手动释放
    
    return (__bridge NSString *)CFStringCreateWithCString(NULL, "h", kCFStringEncodingUTF8);
    
}

- (void)setSpeed:(NSUInteger)speed {
    _speed = speed;
}

- (NSUInteger)speed {
    return _speed;
}


@end
