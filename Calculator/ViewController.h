//
//  ViewController.h
//  Calculator
//
//  Created by MF839-004 on 2016. 6. 15..
//  Copyright © 2016년 MF839-004. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *display;

-(void)processDigit:(int)digit;
-(void)processOp:(char)theOp;
-(void)storeFracPart;

- (IBAction)clickDgit:(UIButton *) sender;

- (IBAction)clickPlus:(id)sender;
- (IBAction)clickMinus:(id)sender;
- (IBAction)clickMultiply:(id)sender;
- (IBAction)clickDivide:(id)sender;

- (IBAction)clickEquals:(id)sender;
- (IBAction)clickOver:(id)sender;
- (IBAction)clickClear:(id)sender;
;
-(IBAction)unwindToViewController:(UIStoryboardSegue *)sender;

//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender

@property (weak, nonatomic) IBOutlet UIButton *myButton;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *myButtons;

@end

