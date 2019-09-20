//
//  Person.m
//  StrangeInterviewQuestions
//
//  Created by 刘帅仪 on 2019/9/20.
//  Copyright © 2019 刘帅仪. All rights reserved.
//

#import "Person.h"

@implementation Person

- (id)init {
    self = [super init];
    if (self) {
        NSLog(@"%@", NSStringFromClass([self class]));
        NSLog(@"%@", NSStringFromClass([super class]));
    }
    return self;
}

- (void)print {
    NSLog(@"self.name = %@", self.name);
}

@end
