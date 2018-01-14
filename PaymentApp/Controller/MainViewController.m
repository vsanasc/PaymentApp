//
//  ViewController.m
//  PaymentApp
//
//  Created by Vitor Santos do Nascimento on 1/10/18.
//

#import "MainViewController.h"
#import "MainTableView.h"

#import "AmountCell.h"
#import "CreditCardCell.h"
#import "BankCell.h"
#import "InstallmentsCell.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	_position = 0;
	
	
	self.tableView.delegate = self;
	self.tableView.dataSource = self;
	
	[self.tableView reloadData];
	
	
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	UITableViewCell *cell = [[UITableViewCell alloc]init];
	
	switch ((CellType) indexPath.row) {
		
		case Amount:{
			cell = (AmountCell *)[tableView dequeueReusableCellWithIdentifier:@"amount"];
			return cell;
			
		}
		
		case Bank:{
		
			cell = (BankCell *)[tableView dequeueReusableCellWithIdentifier:@"bank"];
			return cell;
		
		}
		
		case CreditCard:{
			cell = (CreditCardCell *)[tableView dequeueReusableCellWithIdentifier:@"creditCard"];
			return cell;
		}
		
		case Installments:{
			cell = (InstallmentsCell *)[tableView dequeueReusableCellWithIdentifier:@"installment"];
			return cell;
		}
		
		
		default:
		break;
	}
	

	
	
	
	return cell;
	
}
	
	
	
-(IBAction) nextAction:(id)sender{
	
}

@end
