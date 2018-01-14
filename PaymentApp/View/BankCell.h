//
//  BankCell.h
//  PaymentApp
//
//  Created by Vitor Santos do Nascimento on 1/11/18.
//

#import <UIKit/UIKit.h>

@interface BankCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIView *top;
@property (weak, nonatomic) IBOutlet UILabel *topValue;
@property (strong, nonatomic) IBOutlet UIView *content;
@property (strong, nonatomic) IBOutlet UIView *selectContent;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *topHeight;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *contentHeight;

@end
