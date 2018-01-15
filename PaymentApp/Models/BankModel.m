//
//  BankModel.m
//  PaymentApp
//
//  Created by Vitor Santos do Nascimento on 1/11/18.
//

#import "BankModel.h"
#import "Req.h"

@implementation BankModel


-(id)initWithDictionary:(NSDictionary *)data{
	
	self = [super init];
	if(self) {
		
		self.id = [data objectForKey:@"id"];
		self.name = [data objectForKey:@"name"];
		self.logo = [data objectForKey:@"secure_thumbnail"];
		
	}
	return self;
	
}

+(void)listByMethod:(NSString *)method completionHandler:(void (^)(NSArray<BankModel *> *elements))completion{
	
	NSString *urlWithParam = [@"payment_methods/card_issuers?public_key=444a9ef5-8a6b-429f-abdf-587639155d88&payment_method_id=" stringByAppendingString:method];
	
	[[Req instance] getWithAPI:urlWithParam completionWithJSON:^(NSArray *data) {
		
		NSMutableArray<BankModel *> *list = [[NSMutableArray alloc]init];
		
		for(int i=0;i<data.count;i++){
			BankModel *item = [[BankModel alloc]initWithDictionary:data[i]];
			[list addObject:item];
		}
		
		completion(list);
		
		
	}];
	
}


@end
