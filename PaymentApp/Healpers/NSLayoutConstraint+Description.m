//
//  NSLayoutConstraint+Description.m
//  PaymentApp
//
//  Created by Vitor Santos do Nascimento on 1/13/18.
//

#import "NSLayoutConstraint+Description.h"

@implementation NSLayoutConstraint (Description)

-(NSString *)description {
	return [NSString stringWithFormat:@"id: %@, constant: %f", self.identifier, self.constant];
}

@end
