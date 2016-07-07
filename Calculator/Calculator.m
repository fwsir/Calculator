//
//  Calculator.m
//  Calculator
//
//  Created by BOOM on 16/7/4.
//  Copyright © 2016年 DEVIL. All rights reserved.
//

#import "Calculator.h"
#import <objc/runtime.h>

@interface Calculator ()

@property (nonatomic, strong) NSMutableDictionary *propertiesDict;

@end

@implementation Calculator
@dynamic name;
@dynamic author;

- (instancetype)init
{
    if (self = [super init])
    {
        self.propertiesDict = [[NSMutableDictionary alloc] init];
    }
    
    return self;
}

- (NSNumber *)sumAddend:(NSNumber *)adder1 adder2:(NSNumber *)adder2
{
    NSLog(@"Invoking method on %@ object with selector %@", [self className], NSStringFromSelector(_cmd));
    return [NSNumber numberWithInteger:(adder1.integerValue + adder2.integerValue)];
}

- (NSNumber *)sumAddend:(NSNumber *)adder1 :(NSNumber *)adder2
{
    NSLog(@"Invoking method on %@ object with selector %@", [self className], NSStringFromSelector(_cmd));
    return [NSNumber numberWithInteger:(adder1.integerValue + adder2.integerValue)];
}

+ (BOOL)resolveInstanceMethod:(SEL)sel
{
    NSString *method = NSStringFromSelector(sel);
    
    if ([method hasPrefix:@"absoluteValue"])
    {
        class_addMethod([self class], sel, (IMP)absoluteValue, "@@:@");
        NSLog(@"Dynamic added instance method %@ to %@ class", method, [self className]);
        
        return YES;
    }
    
    return [super resolveInstanceMethod:sel];
}

id absoluteValue(id self, SEL _cmd, id value)
{
    NSInteger intVal = [value integerValue];
    if (intVal < 0)
    {
        return [NSNumber numberWithInteger:(intVal * -1)];
    }
    
    return value;
}


- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    NSString *sel = NSStringFromSelector(aSelector);
    if ([sel rangeOfString:@"set"].location == 0)
    {
        return [NSMethodSignature signatureWithObjCTypes:"v@:@"];
    }
    else
    {
        return [NSMethodSignature signatureWithObjCTypes:"@@:"];
    }
}

- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    NSString *key = NSStringFromSelector([anInvocation selector]);
    if ([key rangeOfString:@"set"].location == 0)
    {
        key = [key substringWithRange:NSMakeRange(3, key.length - 4)].lowercaseString;
        
        NSString *obj;
        [anInvocation getArgument:&obj atIndex:2];
        [self.propertiesDict setObject:obj forKey:key];
    }
    else
    {
        NSString *obj = [self.propertiesDict objectForKey:key];
        [anInvocation setReturnValue:&obj];
    }
}

@end
