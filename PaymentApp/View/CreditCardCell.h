//
//  CreditCardTableViewCell.h
//  PaymentApp
//
//  Created by Vitor Santos do Nascimento on 1/10/18.
//

#import <UIKit/UIKit.h>

@interface CreditCardCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIView *top;
@property (weak, nonatomic) IBOutlet UILabel *topValue;
@property (strong, nonatomic) IBOutlet UIView *content;

@property (strong, nonatomic) IBOutlet UIImageView *logoCard;
@property (strong, nonatomic) IBOutlet UILabel *nameCard;



@end
