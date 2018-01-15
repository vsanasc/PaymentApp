//
//  UIView+Fade.m
//  PaymentApp
//
//  Created by Vitor Santos do Nascimento on 1/14/18.
//

#import "UIView+Effects.h"

@implementation UIView (Effects)

-(void)scale:(void (^ __nullable)(BOOL finished))completion{
	
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
