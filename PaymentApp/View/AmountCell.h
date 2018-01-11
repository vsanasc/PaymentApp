//
//  AmountCell.h
//  PaymentApp
//
//  Created by Vitor Santos do Nascimento on 1/10/18.
//

#import <UIKit/UIKit.h>

@interface AmountCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIView *top;
@property (weak, nonatomic) IBOutlet UILabel *topValue;
@property (strong, nonatomic) IBOutlet UIView *content;
@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) IBOutlet UIView *contentTextField;


@end
