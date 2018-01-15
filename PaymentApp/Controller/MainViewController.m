//
//  ViewController.m
//  PaymentApp
//
//  Created by Vitor Santos do Nascimento on 1/10/18.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "MainTableView.h"

#import "SummaryView.h"

#import "MethodModel.h"

#import "UIColor+MercadoPago.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	self.customCellDelegate = [[CustomCell alloc]initWithParent:self];
	self.transaction = [[TransactionModel alloc]init];
	
	self.position = 0;
	self.transaction.value = 0;
	self.tipTexts = @[@"Agregar monto",@"Elegir tarjeta de crédito",@"Elegir Banco",@"Elegir Cuotas"];
	[self setTip];
	[self stateContinue];
	
	self.tableView.delegate = self;
	self.tableView.dataSource = self;
	self.view.backgroundColor = [UIColor mpLightBlue];
	
	[self reloadData];
	
	
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return self.position + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	return [self.customCellDelegate tableView:tableView cellForRowAtIndexPath:indexPath];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
	[self.tableView deselectRowAtIndexPath:indexPath animated:YES];
	
	self.position = (int)indexPath.row;
	[self setTip];
	[self reloadData];
	
	
}
	
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	return [self.customCellDelegate tableView:tableView heightForRowAtIndexPath:indexPath];
}
	
-(IBAction) nextAction:(id)sender{

	if(self.position < 3){
		self.position = self.position + 1;
		[self setTip];
		[self reloadData];
	}else{
		
		SummaryView *summary = [[SummaryView alloc]initWithParent:self];
		
		AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication]delegate];
		[app.window addSubview:summary];
		
		[app.window addConstraint:[NSLayoutConstraint constraintWithItem:summary attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:app.window attribute:NSLayoutAttributeTop multiplier:1.0 constant:0]];
		
		[app.window addConstraint:[NSLayoutConstraint constraintWithItem:summary attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:app.window attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0]];
		
		[app.window addConstraint:[NSLayoutConstraint constraintWithItem:summary attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:app.window attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0]];
		
		[app.window addConstraint:[NSLayoutConstraint constraintWithItem:summary attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:app.window attribute:NSLayoutAttributeRight multiplier:1.0 constant:0]];
		
	}
}

-(void)setTip{
	[self.tipText setText:self.tipTexts[self.position]];
}
-(void)reloadData{
	
	[self stateContinue];
	
	[UIView transitionWithView: self.tableView duration: 0.35f options: UIViewAnimationOptionTransitionCrossDissolve animations: ^(void){
		 dispatch_async(dispatch_get_main_queue(), ^{
			 [self.tableView reloadData];
		 });
	 }completion: nil];
}

-(void)stateContinue{
	[self.next setEnabled:NO];
	
	if(self.position == 0 && self.transaction.value > 0){
		[self.next setEnabled:YES];
	}
	
	if(self.position == 1 && self.transaction.method != nil){
		[self.next setEnabled:YES];
	}
	
	if(self.position == 2 && self.transaction.bank != nil){
		[self.next setEnabled:YES];
	}
	
	if(self.position == 3 && self.transaction.installments != nil){
		[self.next setEnabled:YES];
	}
	
	
}

@end
