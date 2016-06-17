//
//  InfoViewController.h
//  Calculator
//
//  Created by MF839-004 on 2016. 6. 16..
//  Copyright © 2016년 MF839-004. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol InfoViewProtocol <NSObject>
-(void)changeColor:(UIColor *)newColor;
@end

@interface InfoViewController : UIViewController

@property (nonatomic, strong) id<InfoViewProtocol> delegate;

@end
