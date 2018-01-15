//
//  UIView+Fade.m
//  PaymentApp
//
//  Created by Vitor Santos do Nascimento on 1/14/18.
//

#import "UIView+Effects.h"

@implementation UIView (Effects)

-(void)scalePress:(void (^ __nullable)(BOOL finished))completion;{
	
	[UIView animateWithDuration:0.1f delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
		self.transform = CGAffineTransformMakeScale(0.8, 0.8);
		self.alpha = 0.8;
	} completion:^(BOOL finished) {
		
		[UIView animateWithDuration:0.1f delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
			self.transform = CGAffineTransformMakeScale(1, 1);
			self.alpha = 1;
		} completion:completion];
		
	}];
	
	
}
-(void)scaleChange:(void (^ __nullable)(BOOL finished))completion{
	
	[UIView animateWithDuration:0.3f delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
		self.transform = CGAffineTransformMakeScale(1.3, 1.3);
	} completion:^(BOOL finished) {
		
		[UIView animateWithDuration:0.3f delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
			self.transform = CGAffineTransformMakeScale(1, 1);
		} completion:completion];
		
	}];
}

-(void)fadeOut:(void (^ __nullable)(BOOL finished))completion{
	
	[UIView transitionWithView: self duration: 0.35f options: UIViewAnimationOptionTransitionCrossDissolve animations: ^(void){
		self.alpha = 0;
	 } completion: completion];
	
}
-(void)fadeIn:(void (^ __nullable)(BOOL finished))completion{
	
	[UIView transitionWithView: self duration: 0.35f options: UIViewAnimationOptionTransitionCrossDissolve animations: ^(void){
		self.alpha = 1;
	} completion: completion];
	
}

@end
