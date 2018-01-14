//
//  UIView+Fade.m
//  PaymentApp
//
//  Created by Vitor Santos do Nascimento on 1/14/18.
//

#import "UIView+Fade.h"

@implementation UIView (Fade)

-(void)fadeOut{
	
	[UIView transitionWithView: self duration: 0.35f options: UIViewAnimationOptionTransitionCrossDissolve animations: ^(void){
		self.alpha = 0;
	 } completion: nil];
	
}
-(void)fadeIn{
	
	[UIView transitionWithView: self duration: 0.35f options: UIViewAnimationOptionTransitionCrossDissolve animations: ^(void){
		self.alpha = 1;
	} completion: nil];
	
}

@end
