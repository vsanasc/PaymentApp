//
//  MainTableView.m
//  PaymentApp
//
//  Created by Vitor Santos do Nascimento on 1/12/18.
//

#import "MainTableView.h"

@implementation MainTableView


-(void) commonInit{
	
	self.allowsSelection = NO;
	
	[self registerNib:[UINib nibWithNibName:@"AmountCell" bundle:nil] forCellReuseIdentifier:@"amount"];
	[self registerNib:[UINib nibWithNibName:@"CreditCardCell" bundle:nil] forCellReuseIdentifier:@"creditCard"];
	[self registerNib:[UINib nibWithNibName:@"BankCell" bundle:nil] forCellReuseIdentifier:@"bank"];
	[self registerNib:[UINib nibWithNibName:@"InstallmentsCell" bundle:nil] forCellReuseIdentifier:@"installment"];
	
}

-(instancetype)initWithFrame:(CGRect)frame{
	
	if((self =[super initWithFrame:frame])){
		[self commonInit];
	}
	
	return self;
	
}
-(id)initWithCoder:(NSCoder *)aDecoder{
	
	if(self = [super initWithCoder:aDecoder]){
		[self commonInit];
	}
	
	return self;
}


@end
