//
//  InstallmentModel.m
//  PaymentApp
//
//  Created by Vitor Santos do Nascimento on 1/11/18.
//

#import "InstallmentModel.h"
#import "Req.h"

@implementation InstallmentModel


-(id)initWithDictionary:(NSDictionary *)data{
	
	self = [super init];
	if(self) {
		
		self.installments = [[data valueForKey:@"installments"]intValue];
		self.value =  [[data valueForKey:@"total_amount"]intValue];
		self.message = (NSString *)[data valueForKey:@"recommended_message"];
		
	}
	return self;
	
}

+(void)listByParams:(int)amount withMethod:(NSString *)method withBank:(NSString *)bank completionHandler:(void (^)(NSArray<InstallmentModel *> *elements))completion{
	
	NSString *urlWithParam = [NSString stringWithFormat:@"payment_methods/installments?public_key=444a9ef5-8a6b-429f-abdf-587639155d88&amount=%i&payment_method_id=%@&issuer.id=%@",amount,method,bank,nil];
	
	[[Req instance] getWithAPI:urlWithParam completionWithJSON:^(NSArray *data) {
		
		NSMutableArray<InstallmentModel *> *list = [[NSMutableArray alloc]init];
		
		if(data.count > 0){
			
			NSArray *payer_costs = (NSArray *)[[data firstObject] valueForKey:@"payer_costs"];
			
			for(int i=0;i<payer_costs.count;i++){
				//NSLog(@"%@",payer_costs[i]);
				InstallmentModel *item = [[InstallmentModel alloc]initWithDictionary:payer_costs[i]];
				[list addObject:item];
			}
			
		}
		completion(list);
		
		
	}];
	
}

@end
