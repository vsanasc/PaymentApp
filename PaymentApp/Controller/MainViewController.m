//
//  ViewController.m
//  PaymentApp
//
//  Created by Vitor Santos do Nascimento on 1/10/18.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "MainTableView.h"

#import "AmountCell.h"
#import "CreditCardCell.h"
#import "BankCell.h"
#import "InstallmentsCell.h"
#import "SummaryView.h"

#import "UIColor+MercadoPago.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	self.position = 0;
	self.contentHeights = @[@170.0, @270.0, @80.0,@95.0];
	self.tipTexts = @[@"Agregar monto",@"Elegir tarjeta de crédito",@"Elegir Banco",@"Elegir Cuotas"];
	
	
	self.tableView.delegate = self;
	self.tableView.dataSource = self;
	self.view.backgroundColor = [UIColor mpLightBlue];
	
	[self reloadData];
	
	
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return _position + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	switch ((CellType) indexPath.row) {
		
		case Amount:{
			AmountCell *cell = (AmountCell *)[tableView dequeueReusableCellWithIdentifier:@"amount"];
			
			if(self.position == indexPath.row){
				cell.topHeight.constant = 0;
				cell.contentHeight.constant = [self.contentHeights[indexPath.row]floatValue];
			}else{
				cell.topHeight.constant = 60;
				cell.contentHeight.constant = 0;
			}
			
			
			return cell;
			
		}
		
		case Bank:{
		
			BankCell *cell = (BankCell *)[tableView dequeueReusableCellWithIdentifier:@"bank"];
			
			if(self.position == indexPath.row){
				cell.topHeight.constant = 0;
				cell.contentHeight.constant = [self.contentHeights[indexPath.row]floatValue];
			}else{
				cell.topHeight.constant = 60;
				cell.contentHeight.constant = 0;
			}
			
			return cell;
		
		}
		
		case CreditCard:{
			CreditCardCell *cell = (CreditCardCell *)[tableView dequeueReusableCellWithIdentifier:@"creditCard"];
			
			if(self.position == indexPath.row){
				cell.topHeight.constant = 0;
				cell.contentHeight.constant = [self.contentHeights[indexPath.row]floatValue];
			}else{
				cell.topHeight.constant = 60;
				cell.contentHeight.constant = 0;
			}
			
			return cell;
		}
		
		case Installments:{
			InstallmentsCell *cell = (InstallmentsCell *)[tableView dequeueReusableCellWithIdentifier:@"installment"];
			
			if(self.position == indexPath.row){
				cell.topHeight.constant = 0;
				cell.contentHeight.constant = [self.contentHeights[indexPath.row]floatValue];
			}else{
				cell.topHeight.constant = 60;
				cell.contentHeight.constant = 0;
			}
			
			
			return cell;
		}
		
	}
	
	
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
	[self.tableView deselectRowAtIndexPath:indexPath animated:YES];
	
	self.position = (int)indexPath.row;
	[self setTip];
	[self reloadData];
	
	
}
	
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	
	if (indexPath.row < self.position){
		return 60.0;
	}else if(indexPath.row == self.position){
		return [self.contentHeights[indexPath.row] floatValue] + 60.0;
	}else{
		return 0;
	}
	
}
	
-(IBAction) nextAction:(id)sender{
	
	if(self.position < 3){
		self.position = self.position + 1;
		[self setTip];
		[self reloadData];
	}else{
		
		SummaryView *summary = (SummaryView *) [[[NSBundle mainBundle] loadNibNamed:@"Summary" owner:self options:nil] firstObject];
		
		AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication]delegate];
		[app.window addSubview:summary];
		[app.window bringSubviewToFront:summary];
		
		
		
	}
}

-(void)setTip{
	[self.tipText setText:self.tipTexts[self.position]];
}
-(void)reloadData{
	
	[UIView transitionWithView: self.tableView
					  duration: 0.35f
					   options: UIViewAnimationOptionTransitionCrossDissolve					animations: ^(void)
	 {
		 [self.tableView reloadData];
	 }
					completion: nil];
}

@end
