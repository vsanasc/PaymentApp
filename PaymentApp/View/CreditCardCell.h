//
//  CreditCardTableViewCell.h
//  PaymentApp
//
//  Created by Vitor Santos do Nascimento on 1/10/18.
//

#import <UIKit/UIKit.h>
#import "BaseCell.h"

@interface CreditCardCell : BaseCell

@property (nonatomic, strong) IBOutlet UIView *top;
@property (nonatomic, weak) IBOutlet UILabel *topValue;
@property (nonatomic, strong) IBOutlet UIView *content;
@property (nonatomic, weak) IBOutlet UIView *selectContent;

@property (nonatomic, weak) IBOutlet UIView *cardContent;

@property (nonatomic, weak) IBOutlet UIImageView *logoCard;
@property (nonatomic, weak) IBOutlet UILabel *nameCard;

@end
