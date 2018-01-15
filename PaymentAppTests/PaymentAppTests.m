//
//  PaymentAppTests.m
//  PaymentAppTests
//
//  Created by Vitor Santos do Nascimento on 1/10/18.
//

#import <XCTest/XCTest.h>
#import "BankModel.h"
#import "MethodModel.h"
#import "InstallmentModel.h"

@interface PaymentAppTests : XCTestCase

@end

@implementation PaymentAppTests

-(void)testMethodRequest{
	
	[MethodModel all:^(NSArray<MethodModel *> *elements) {
		XCTAssertTrue(YES);
	}];
	
}

-(void)testBankRequest{
	
	[BankModel listByMethod:@"visa" completionHandler:^(NSArray<BankModel *> *elements) {
		XCTAssertTrue(YES);
	}];

}

-(void)testInstallmentsRequest{
	
	[InstallmentModel listByParams:43000 withMethod:@"visa" withBank:@"288" completionHandler:^(NSArray<InstallmentModel *> *elements) {
		XCTAssertTrue(YES);
	}];
	
}

@end
