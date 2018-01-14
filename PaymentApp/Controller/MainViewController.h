//
//  ViewController.h
//  PaymentApp
//
//  Created by Vitor Santos do Nascimento on 1/10/18.
//

#import <UIKit/UIKit.h>

@class MainTableView;

@interface MainViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>

@property int position;
	
@property (nonatomic, strong) IBOutlet UILabel *textGuide;
@property (nonatomic, strong) IBOutlet MainTableView *tableView;
@property (nonatomic, strong) IBOutlet UIButton *next;
	
-(IBAction) nextAction:(id)sender;

@end

