//
//  ScopeGuardTests.m
//  ScopeGuardTests
//
//  Created by mengfei.mf on 5/5/15.
//  Copyright (c) 2015 mengfei.mf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "ScopeGuard.h"


void func1()
{
    ON_SCOPE_EXIT([] {
        NSLog(@"i am leaving.");
    });

    return;
}


void func2(int i)
{
    feimengspirit::ScopeGuard sg([&]{
        NSLog(@"i: %d", i);
    });
    
    if (0 == i) {
        sg.Dismiss();
    }
    
    return;
}


@interface ScopeGuardTests : XCTestCase

@end

@implementation ScopeGuardTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testScopeGuard {
    func1();
    func2(1);
    func2(0);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
