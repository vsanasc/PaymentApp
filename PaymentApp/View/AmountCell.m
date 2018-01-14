//
//  AmountCell.m
//  PaymentApp
//
//  Created by Vitor Santos do Nascimento on 1/10/18.
//

#import "AmountCell.h"
#import "UIColor+MercadoPago.h"

@implementation AmountCell

- (void)awakeFromNib {
    [super awakeFromNib];
	
	[self setSelectionStyle:UITableViewCellSelectionStyleNone];
	
	self.contentCurrency.clipsToBounds = YES;
	[self.contentCurrency.layer setCornerRadius:10.0];
	
	self.textField.delegate = self;
	
	
	
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
	
	NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init] ;
	NSString *separator = @".";
	[formatter setGroupingSeparator:separator];
	[formatter setGroupingSize:2];
	[formatter setUsesGroupingSeparator:YES];
	if (![string  isEqual: @""] && (textField.text != nil && textField.text.length > 0)) {
		NSString *num = textField.text;
		num = [num stringByReplacingOccurrencesOfString:separator withString:@""];
		NSString *str = [formatter stringFromNumber:[NSNumber numberWithDouble:[num doubleValue]]];
		textField.text = str;
	}
	return YES;
	
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}

@end
