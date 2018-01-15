//
//  MethodModel.m
//  PaymentApp
//
//  Created by Vitor Santos do Nascimento on 1/11/18.
//

#import "MethodModel.h"
#import "Req.h"

@implementation MethodModel


-(id)initWithDictionary:(NSDictionary *)data{
	
	self = [super init];
	if(self) {
		
		self.id = [data objectForKey:@"id"];
		self.name = [data objectForKey:@"name"];
		self.logo = [data objectForKey:@"secure_thumbnail"];
		
	}
	return self;
	
}

+(void)all:(void (^)(NSArray<MethodModel *> *elements))completion{
	
	[[Req instance] getWithAPI:@"payment_methods?public_key=444a9ef5-8a6b-429f-abdf-587639155d88" completionWithJSON:^(NSArray *data) {
		
		NSMutableArray<MethodModel *> *list = [[NSMutableArray alloc]init];
		
		for(int i=0;i<data.count;i++){
			MethodModel *item = [[MethodModel alloc]initWithDictionary:data[i]];
			[list addObject:item];
		}
		
		completion(list);
		
		
	}];
	
}

@end
