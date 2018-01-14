//
//  CreditCardTableViewCell.m
//  PaymentApp
//
//  Created by Vitor Santos do Nascimento on 1/10/18.
//

#import "CreditCardCell.h"
#import "UIColor+MercadoPago.h"


@implementation CreditCardCell

- (void)awakeFromNib {
    [super awakeFromNib];
	
	[self setSelectionStyle:UITableViewCellSelectionStyleNone];
	
	self.selectContent.clipsToBounds = YES;
	[self.selectContent.layer setCornerRadius:(self.selectContent.frame.size.height / 2)];
	[self.selectContent.layer setBorderColor:[UIColor mpBlue].CGColor];
	[self.selectContent.layer setBorderWidth:1];
	
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
