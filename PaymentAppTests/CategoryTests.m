//
//  CategoryTests.m
//  PaymentAppTests
//
//  Created by Vitor Santos do Nascimento on 1/14/18.
//

#import <XCTest/XCTest.h>
#import "UIView+Effects.h"
#import "UIColor+MercadoPago.h"

@interface CategoryTests : XCTestCase

@end

@implementation CategoryTests

- (void)testFadeIn{
	
	UIView *view = [[UIView alloc]initWithFrame:CGRectZero];
	view.alpha = 0;
	[view fadeIn:nil];
	XCTAssertEqual(view.alpha, 1.0);
	
}

- (void)testFadeOut{
	
	UIView *view = [[UIView alloc]initWithFrame:CGRectZero];
	
	[view fadeOut:nil];
	XCTAssertEqual(view.alpha, 0);
	
}

-(void)testMpBlue{
	
	UIColor *color = [UIColor colorWithRed:0.00 green:0.14 blue:0.55 alpha:1.0];
	XCTAssertEqualObjects(color, [UIColor mpBlue]);
	
}
-(void)testMpLightBlue{
	
	UIColor *color = [UIColor colorWithRed:0.00 green:0.62 blue:0.89 alpha:1.0];
	XCTAssertEqualObjects(color, [UIColor mpLightBlue]);
	
}
@end
