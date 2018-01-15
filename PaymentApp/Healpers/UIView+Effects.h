//
//  UIView+Fade.h
//  PaymentApp
//
//  Created by Vitor Santos do Nascimento on 1/14/18.
//

#import <UIKit/UIKit.h>

@interface UIView (Effects)

-(void)scalePress:(void (^ __nullable)(BOOL finished))completion;

-(void)scaleChange:(void (^ __nullable)(BOOL finished))completion;

-(void)fadeOut:(void (^ __nullable)(BOOL finished))completion;
-(void)fadeIn:(void (^ __nullable)(BOOL finished))completion;

@end
