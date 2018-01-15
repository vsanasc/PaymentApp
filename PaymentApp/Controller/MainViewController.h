//
//  ViewController.h
//  PaymentApp
//
//  Created by Vitor Santos do Nascimento on 1/10/18.
//

#import <UIKit/UIKit.h>
#import "CustomCell.h"

#import "TransactionModel.h"

@class MainTableView;

@interface MainViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic) int position;
@property (nonatomic, strong) NSArray *tipTexts;

@property (nonatomic, strong) IBOutlet UILabel *tipText;
@property (nonatomic, strong) IBOutlet MainTableView *tableView;
@property (nonatomic, strong) IBOutlet UIButton *next;

@property (nonatomic, strong) id<CustomCellDelegate> customCellDelegate;

@property (nonatomic, strong) TransactionModel *transaction;

-(void)reloadData;
-(IBAction) nextAction:(id)sender;
-(void)stateContinue;

@end

