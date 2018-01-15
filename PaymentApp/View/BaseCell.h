//
//  BaseCell.h
//  PaymentApp
//
//  Created by Vitor Santos do Nascimento on 1/14/18.
//

#import <UIKit/UIKit.h>

@interface BaseCell : UITableViewCell

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *topHeight;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *contentHeight;

@end
