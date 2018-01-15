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

-(void)getWithAPI:(NSString*)api completionWithJSON:(void (^)(NSArray *data))completion{
	
	NSString *fullURL = [@"https://api.mercadopago.com/v1/" stringByAppendingString:api];
	
	NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:fullURL]];
	request.HTTPMethod = @"GET";
	[request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
	
	[[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
		
		if (!error) {
			NSHTTPURLResponse *httpResp = (NSHTTPURLResponse*) response;
			if (httpResp.statusCode == 200) {
				
				NSError *error;
				NSArray *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
				
				completion(json);
				
				
			}
		}
	
		
		
	}]resume];
	
}

-(void) makeRequest:(NSString *)api withData:(NSData *)data{
	
}

@end
