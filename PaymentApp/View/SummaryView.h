//
//  SummaryView.h
//  PaymentApp
//
//  Created by Vitor Santos do Nascimento on 1/14/18.
//

#import <UIKit/UIKit.h>

@class MainViewController;

@interface SummaryView : UIView

@property (nonatomic,weak) MainViewController *parent;

@property (nonatomic, strong) IBOutlet UIImageView *logo;
@property (nonatomic, strong) IBOutlet UIView *content;

@property (nonatomic, weak) IBOutlet UILabel *value;
@property (nonatomic, weak) IBOutlet UILabel *installments;

@property (nonatomic, weak) IBOutlet UIImageView *methodImage;
@property (nonatomic, weak) IBOutlet UILabel *methodText;

@property (nonatomic, weak) IBOutlet UIImageView *bankImage;
@property (nonatomic, weak) IBOutlet UILabel *bankText;

@property (nonatomic, weak) IBOutlet UILabel *transaction;
@property (nonatomic, weak) IBOutlet UILabel *date;

@property (nonatomic, weak) IBOutlet UIButton *button;
@property (nonatomic, weak) IBOutlet UIButton *cancel;

-(instancetype)initWithParent:(MainViewController *)parent;

-(IBAction)finishAction:(id)sender;
-(IBAction)cancelAction:(id)sender;

@end
