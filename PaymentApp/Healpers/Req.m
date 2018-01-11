//
//  Req.m
//  PaymentApp
//
//  Created by Vitor Santos do Nascimento on 1/10/18.
//

#import "Req.h"

@implementation Req

+(instancetype) instance{
	
	static Req *instance = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		instance = [[Req alloc]init];
	});
	
	return instance;
}

-(void)getWithAPI:(NSString*) api{
	
	NSLog(@"Request api: %@", api);
	
}

@end
