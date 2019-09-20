//
//  ViewController.h
//  StrangeInterviewQuestions
//
//  Created by 刘帅仪 on 2019/9/19.
//  Copyright © 2019 刘帅仪. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PropertyProtocol <NSObject>

@required
@property (nonatomic, assign) NSUInteger speed;

@end

@interface ViewController : UIViewController


@end

