//
//  InfoViewController.m
//  Calculator
//
//  Created by MF839-004 on 2016. 6. 16..
//  Copyright © 2016년 MF839-004. All rights reserved.
//

#import "InfoViewController.h"

@implementation InfoViewController
- (IBAction)closeWindow:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)changeColor:(id)sender {
    if([self.delegate respondsToSelector:@selector(changeColor:)]){
        [self.delegate changeColor:[UIColor redColor]];
    }
}

@end
