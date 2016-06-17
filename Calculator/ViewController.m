//
//  ViewController.m
//  Calculator
//
//  Created by MF839-004 on 2016. 6. 15..
//  Copyright © 2016년 MF839-004. All rights reserved.
//

#import "ViewController.h"
#import "Calculator.h"
#import "InfoViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    char op;
    int currentNumber;
    BOOL firstOperand, isNumerator;
    Calculator *myCalculator;
    NSMutableString *displayString;
}

@synthesize display;

- (void)viewDidLoad {
    firstOperand = YES;
    isNumerator = YES;
    displayString = [NSMutableString stringWithCapacity: 40];
    myCalculator = [[Calculator alloc] init];
    display.text = @"";
    
    for (int i = 0; i <self.myButtons.count; i++) {
        UIButton *btn = [self.myButtons objectAtIndex:i];
        btn.enabled = NO;
    }

}

-(void) processDigit:(int)digit
{
    currentNumber = currentNumber * 10 + digit;
    
    [displayString appendString:[NSString stringWithFormat:@"%i", digit]];
    display.text = displayString;
}

- (IBAction)clickDgit:(UIButton *)sender
{
    int digit = sender.tag;
    
    [self processDigit: digit];
}

-(void) processOp:(char)theOp
{
    NSString *opStr;
    
    op = theOp;
    
    switch (theOp) {
        case '+':
            opStr = @" + ";
            break;
        case '-':
            opStr = @" - ";
            break;
        case '*':
            opStr = @" * ";
            break;
        case '/':
            opStr = @" / ";
            break;
    }
    
    [self storeFracPart];
    firstOperand = NO;
    isNumerator = YES;
    
    [displayString appendString: opStr];
    display.text = displayString;
}

-(void) storeFracPart
{
    if(firstOperand){
        if(isNumerator){
            myCalculator.operand1.numerator = currentNumber;
            myCalculator.operand1.denominator = 1;
        }else{
            myCalculator.operand1.denominator = currentNumber;
        }
    }else if(isNumerator){
        myCalculator.operand2.numerator = currentNumber;
        myCalculator.operand2.denominator = 1;
    }else{
        myCalculator.operand2.denominator = currentNumber;
        firstOperand = YES;
    }
    currentNumber = 0;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickPlus:(id)sender {
    [self processOp: '+'];
}

- (IBAction)clickMinus:(id)sender {
    [self processOp: '-'];
}

- (IBAction)clickMultiply:(id)sender {
    [self processOp: '*'];
}

- (IBAction)clickDivide:(id)sender {
    [self processOp: '/'];
}

- (IBAction)clickEquals:(id)sender {
    if(firstOperand == NO){
        [self storeFracPart];
        [myCalculator performOperation: op];
        
        [displayString appendString: @" = "];
        [displayString appendString: [myCalculator.accumulator convertToString]];
        display.text = displayString;
        
        currentNumber = 0;
        isNumerator = YES;
        firstOperand = YES;
        [displayString setString:@""];
    }
}

- (IBAction)clickOver:(id)sender {
    [self storeFracPart];
    isNumerator = NO;
    [displayString appendFormat:@"/"];
    display.text = displayString;
    //self.myButton.enabled = NO;
}

- (IBAction)clickClear:(id)sender {
    isNumerator = YES;
    firstOperand = YES;
    currentNumber = 0;
    [myCalculator clear];
    
    [displayString setString: @""];
    display.text = displayString;
}

- (IBAction)setDisabled:(id)sender {
}
- (IBAction)openNewView:(id)sender {
    [self performSegueWithIdentifier:@"pink" sender:self];
}

-(IBAction)unwindToViewController:(UIStoryboardSegue *) sender{
   
};

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSLog(@"Segue ID = %@", segue.identifier);
    
    if ([segue.identifier isEqualToString: @"gray"]) {
        InfoViewController *infoView = [segue destinationViewController];
    }
}




@end
