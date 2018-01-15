//
//  SummaryView.m
//  PaymentApp
//
//  Created by Vitor Santos do Nascimento on 1/14/18.
//
#import <SDWebImage/UIImageView+WebCache.h>

#import "SummaryView.h"
#import "UIView+Effects.h"
#import "MainViewController.h"

@implementation SummaryView

-(instancetype)initWithParent:(MainViewController *)parent{
	
	SummaryView *summary = (SummaryView *) [[[NSBundle mainBundle] loadNibNamed:@"Summary" owner:self options:nil] firstObject];
	summary.translatesAutoresizingMaskIntoConstraints = NO;
	
	self = summary;
	if(self) {
		self.parent = parent;
		[self loadData];
		
	}
	return self;
}

-(void)awakeFromNib{
	[super awakeFromNib];
	
	self.logo.clipsToBounds = YES;
	[self.logo.layer setCornerRadius:(self.logo.frame.size.height/2)];
	[self.logo.layer setBorderWidth:2];
	[self.logo.layer setBorderColor:[UIColor whiteColor].CGColor];
	
	self.transaction.alpha = 0;
	self.date.alpha = 0;
	
	[self.button.imageView setContentMode:UIViewContentModeScaleAspectFit];
	
	self.content.clipsToBounds = YES;
	[self.content.layer setCornerRadius:12.0];
	
	// Show with FadeIn
	self.alpha = 0;
	[self fadeIn:nil];
	
}
-(void)loadData{
	
	[self.value setText:[NSString stringWithFormat:@"%i",self.parent.transaction.value,nil]];
	[self.installments setText:self.parent.transaction.installments.message];
	
	[self.methodText setText:self.parent.transaction.method.name];
	[self.methodImage sd_setImageWithURL:[NSURL URLWithString:self.parent.transaction.method.logo]];
	
	[self.bankText setText:self.parent.transaction.bank.name];
	[self.bankImage sd_setImageWithURL:[NSURL URLWithString:self.parent.transaction.method.logo]];
	
}
-(IBAction)finishAction:(id)sender{
	
	[self updateDate];
	
	[self.transaction fadeIn:nil];
	[self.date fadeIn:nil];
	
	[self.button setSelected:YES];
	[self.button setUserInteractionEnabled:NO];
	
	[self.cancel setTitle:@"Hacer otra operación" forState:UIControlStateNormal];
	
}
-(IBAction)cancelAction:(id)sender{
	
	if(self.parent.transaction.date != nil){
		self.parent.position = 0;
		self.parent.transaction = [[TransactionModel alloc]init];
		[self.parent reloadData];
	}
	
	[self fadeOut:^(BOOL finished) {
		[self removeFromSuperview];
	}];
	
}
-(void)updateDate{
	
	NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
	[formatter setDateFormat:@"dd 'de' MMMM"];
	
	self.parent.transaction.date = [[NSDate alloc]init];
	self.date.text = [formatter stringFromDate:self.parent.transaction.date];
	
}




@end
