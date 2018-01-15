//
//  BankCell.h
//  PaymentApp
//
//  Created by Vitor Santos do Nascimento on 1/11/18.
//

#import <UIKit/UIKit.h>
#import "BaseCell.h"

@interface BankCell : BaseCell

@property (nonatomic, strong) IBOutlet UIView *top;
@property (nonatomic, weak) IBOutlet UILabel *topValue;
@property (nonatomic, strong) IBOutlet UIView *content;
@property (nonatomic, weak) IBOutlet UIView *selectContent;

@property (nonatomic, weak) IBOutlet UIImageView *logo;
@property (nonatomic, weak) IBOutlet UILabel *name;

@end
