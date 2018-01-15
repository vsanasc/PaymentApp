//
//  InstallmentsCell.m
//  PaymentApp
//
//  Created by Vitor Santos do Nascimento on 1/11/18.
//

#import "InstallmentsCell.h"
#import "UIColor+MercadoPago.h"


@implementation InstallmentsCell

- (void)awakeFromNib {
    [super awakeFromNib];
	
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
