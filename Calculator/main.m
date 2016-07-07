//
//  main.m
//  Calculator
//
//  Created by BOOM on 16/7/4.
//  Copyright © 2016年 DEVIL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Calculator.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool
    {
        Calculator *calc = [[Calculator alloc] init];
//        NSNumber *adden1 = @25;
//        NSNumber *adden2 = @10;
//        NSNumber *adden3 = @-15;
//        
//#pragma clang diagnostic push
//#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
//#pragma clang diagnostic ignored "-Wundeclared-selector"
//        
//        SEL selector = @selector(sumAddend:adder2:);
//        id sum1 = [calc performSelector:selector withObject:adden1 withObject:adden2];
//        
//        NSLog(@"Sum of %@ + %@ = %@", adden1, adden2, sum1);
//        
//        SEL selector2 = @selector(sumAddend::);
//        id sum2 = [calc performSelector:selector2 withObject:adden2 withObject:adden3];
//        
//        NSLog(@"Sum of %@ + %@ = %@", adden2, adden3, sum2);
//        
//        SEL selector3 = @selector(absoluteValueHaha:);
//        id val = [calc performSelector:selector3 withObject:adden3];
//        
//        NSLog(@"AbsoluteValue of %@ is %@", adden3, val);
//        
//#pragma clang diagnostic pop
        
        calc.name   = @"c++ primer";
        calc.author = @"Stanley B.Lippman";
        calc.version = @"5.0";
        
        NSLog(@"%@", calc.name);
        NSLog(@"%@", calc.author);
        NSLog(@"%@", calc.version);
        
    }
    return 0;
}
