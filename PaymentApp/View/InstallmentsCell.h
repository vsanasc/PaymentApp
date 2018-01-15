//
//  InstallmentsCell.h
//  PaymentApp
//
//  Created by Vitor Santos do Nascimento on 1/11/18.
//

#import <UIKit/UIKit.h>
#import "BaseCell.h"

@interface InstallmentsCell : BaseCell

@property (nonatomic, strong) IBOutlet UIView *top;
@property (nonatomic, weak) IBOutlet UILabel *topValue;
@property (nonatomic, strong) IBOutlet UIView *content;
@property (nonatomic, weak) IBOutlet UIView *selectContent;

@property (nonatomic, weak) IBOutlet UILabel *text;



@end
