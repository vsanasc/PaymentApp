//
//  SummaryView.m
//  PaymentApp
//
//  Created by Vitor Santos do Nascimento on 1/14/18.
//

#import "SummaryView.h"
#import "UIView+Fade.h"

@implementation SummaryView

-(void)awakeFromNib{
	[super awakeFromNib];
	
	self.logo.clipsToBounds = YES;
	[self.logo.layer setCornerRadius:(self.logo.frame.size.height/2)];
	[self.logo.layer setBorderWidth:2];
	[self.logo.layer setBorderColor:[UIColor whiteColor].CGColor];
	
	
	[self.button.imageView setContentMode:UIViewContentModeScaleAspectFit];
	
	self.content.clipsToBounds = YES;
	[self.content.layer setCornerRadius:12.0];
	
}

-(IBAction)finishAction:(id)sender{
	[self.button setSelected:YES];
	[self.button setUserInteractionEnabled:NO];
	[self.cancel setTitle:@"Hacer otra operación" forState:UIControlStateNormal];
}
-(IBAction)cancelAction:(id)sender{
	
}





@end
