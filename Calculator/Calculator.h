//
//  Calculator.h
//  Calculator
//
//  Created by BOOM on 16/7/4.
//  Copyright © 2016年 DEVIL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Calculator : NSObject

@property (nonatomic, copy) NSString    *name;
@property (nonatomic, copy) NSString    *author;
@property (nonatomic, copy) NSString    *version;

- (NSNumber *)sumAddend:(NSNumber *)adder1 adder2:(NSNumber *)adder2;

- (NSNumber *)sumAddend:(NSNumber *)adder1 :(NSNumber *)adder2;

@end
