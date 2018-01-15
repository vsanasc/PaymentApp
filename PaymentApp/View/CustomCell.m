//
//  CustomCell.m
//  PaymentApp
//
//  Created by Vitor Santos do Nascimento on 1/14/18.
//

#import <ActionSheetPicker-3.0/ActionSheetPicker.h>
#import <SDWebImage/UIImageView+WebCache.h>

#import "CustomCell.h"
#import "MainViewController.h"
#import "MainTableView.h"

#import "AmountCell.h"
#import "CreditCardCell.h"
#import "BankCell.h"
#import "InstallmentsCell.h"
#import "SummaryView.h"

@implementation CustomCell


-(instancetype)initWithParent:(MainViewController *)parent{
	self = [super init];
	if(self) {
		self.parent = parent;
		self.contentHeights = @[@170.0, @270.0, @160.0,@95.0];
		self.listInstallment = [[NSMutableArray alloc]init];
		self.listBanks = [[NSMutableArray alloc]init];
		self.listMethods = [[NSMutableArray alloc]init];
		
		[MethodModel all:^(NSArray<MethodModel *> *elements) {
			self.listMethods = elements;
		}];
		
	}
	return self;
	
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	
	switch ((CellType) indexPath.row) {
			
		case Amount:{
			AmountCell *cell = (AmountCell *)[tableView dequeueReusableCellWithIdentifier:@"amount"];
			[self updateHeights:cell indexPath:indexPath];
			
			NSString *value = [NSString stringWithFormat:@"%i", self.parent.transaction.value,nil];
			[cell.topValue setText:value];
			[cell.textField setText:value];
			cell.textField.delegate = self;
			
			return cell;
			
		}
			
		case CreditCard:{
			CreditCardCell *cell = (CreditCardCell *)[tableView dequeueReusableCellWithIdentifier:@"creditCard"];
			[self updateHeights:cell indexPath:indexPath];
			
			[cell.selectContent addGestureRecognizer: [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectMethod:)]];
			
			if(self.parent.transaction.method != nil){
				
				[cell.topValue setText:self.parent.transaction.method.name];
				[cell.nameCard setText:self.parent.transaction.method.name];
				[cell.logoCard sd_setImageWithURL:[NSURL URLWithString:self.parent.transaction.method.logo]];
			}
			
			
			
			return cell;
		}
		
		case Bank:{
			
			BankCell *cell = (BankCell *)[tableView dequeueReusableCellWithIdentifier:@"bank"];
			[self updateHeights:cell indexPath:indexPath];
			
			
			
			[cell.selectContent addGestureRecognizer: [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectBank:)]];
			
			if(self.parent.transaction.bank != nil){
				[cell.topValue setText:self.parent.transaction.bank.name];
				[cell.name setText:self.parent.transaction.bank.name];
				[cell.logo sd_setImageWithURL:[NSURL URLWithString:self.parent.transaction.bank.logo]];
			}else{
				cell.name.text = @"";
			}
			
			return cell;
			
		}
			
		case Installments:{
			InstallmentsCell *cell = (InstallmentsCell *)[tableView dequeueReusableCellWithIdentifier:@"installment"];
			[self updateHeights:cell indexPath:indexPath];
			
			[cell.selectContent addGestureRecognizer: [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectInstallments:)]];
			
			return cell;
		}
			
	}
	
}
-(void)textFieldDidBeginEditing:(UITextField *)textField{
	if([textField.text isEqualToString:@"0"]){
		textField.text = @"";
	}
}
-(void)textFieldDidEndEditing:(UITextField *)textField{
	self.parent.transaction.value = [textField.text intValue];
	[self.parent stateContinue];
}
-(void)selectMethod:(UITapGestureRecognizer *)sender{
	
	if(self.listMethods.count == 0){
		
		return;
	}
	
	NSMutableArray<NSString *> *rows = [[NSMutableArray alloc]init];
	
	int initialSelection = 0;
	
	for (int i=0; i<self.listMethods.count; i++){
		[rows addObject: self.listMethods[i].name];
		if(self.parent.transaction.method.id == self.listMethods[i].id){
			initialSelection = i;
		}
	}
	
	[ActionSheetStringPicker showPickerWithTitle:@"Método de pago" rows:rows initialSelection:initialSelection doneBlock:^(ActionSheetStringPicker *picker, NSInteger selectedIndex, id selectedValue) {
		
		[self.parent.transaction setMethod:self.listMethods[selectedIndex]];
		[self.parent stateContinue];
		
		[BankModel listByMethod:self.listMethods[selectedIndex].id completionHandler:^(NSArray<BankModel *> *elements) {
			self.listBanks = elements;
		}];
		
		dispatch_async(dispatch_get_main_queue(), ^{
			[self.parent.tableView reloadData];
		});
		
		
	} cancelBlock:^(ActionSheetStringPicker *picker) {
		
	} origin:sender.view];
}

-(void)selectBank:(UITapGestureRecognizer *)sender{
	
	if(self.listBanks.count == 0){
		
		return;
	}
	
	NSMutableArray<NSString *> *rows = [[NSMutableArray alloc]init];
	
	int initialSelection = 0;
	
	for (int i=0; i<self.listBanks.count; i++){
		[rows addObject: self.listBanks[i].name];
		if(self.parent.transaction.bank.id == self.listBanks[i].id){
			initialSelection = i;
		}
	}
	
	[ActionSheetStringPicker showPickerWithTitle:@"Bancos" rows:rows initialSelection:initialSelection doneBlock:^(ActionSheetStringPicker *picker, NSInteger selectedIndex, id selectedValue) {
		
		[self.parent.transaction setBank:self.listBanks[selectedIndex]];
		[self.parent stateContinue];
		
		[InstallmentModel listByParams:self.parent.transaction.value withMethod:self.parent.transaction.method.id withBank:self.parent.transaction.bank.id completionHandler:^(NSArray<InstallmentModel *> *elements) {
			self.listInstallment = elements;
		}];
		
		dispatch_async(dispatch_get_main_queue(), ^{
			[self.parent.tableView reloadData];
		});
		
		
	} cancelBlock:^(ActionSheetStringPicker *picker) {
		
	} origin:sender.view];
	
}
-(void)selectInstallments:(UITapGestureRecognizer *)sender{
	
	if(self.listInstallment.count == 0){
		
		return;
	}
	
	NSMutableArray<NSString *> *rows = [[NSMutableArray alloc]init];
	
	int initialSelection = 0;
	
	for (int i=0; i<self.listInstallment.count; i++){
		[rows addObject: self.listInstallment[i].message];
		if(self.parent.transaction.installments.installments == self.listInstallment[i].installments){
			initialSelection = i;
		}
	}
	
	[ActionSheetStringPicker showPickerWithTitle:@"Cuotas" rows:rows initialSelection:initialSelection doneBlock:^(ActionSheetStringPicker *picker, NSInteger selectedIndex, id selectedValue) {
		
		[self.parent.transaction setInstallments:self.listInstallment[selectedIndex]];
		[self.parent stateContinue];
		
		dispatch_async(dispatch_get_main_queue(), ^{
			[self.parent.tableView reloadData];
		});
		
	} cancelBlock:^(ActionSheetStringPicker *picker) {
		
	} origin:sender.view];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	if (indexPath.row < self.parent.position){
		return 60.0;
	}else if(indexPath.row == self.parent.position){
		return [self.contentHeights[indexPath.row] floatValue] + 60.0;
	}else{
		return 0;
	}
}

-(void)updateHeights:(BaseCell *)cell indexPath:(NSIndexPath *)indexPath{
	
	if(self.parent.position == indexPath.row){
		cell.topHeight.constant = 0;
		cell.contentHeight.constant = [self.contentHeights[indexPath.row]floatValue];
	}else{
		cell.topHeight.constant = 60;
		cell.contentHeight.constant = 0;
	}
	
}
/*
-(void)showAlert:(NSString *)text{
	UIAlertController * alert = [UIAlertController
								 alertControllerWithTitle:@"Title"
								 message:@"Message"
								 preferredStyle:UIAlertControllerStyleAlert];
	
	
	
	UIAlertAction* yesButton = [UIAlertAction
								actionWithTitle:@"Yes, please"
								style:UIAlertActionStyleDefault
								handler:^(UIAlertAction * action) {
									//Handle your yes please button action here
								}];
	
	UIAlertAction* noButton = [UIAlertAction
							   actionWithTitle:@"No, thanks"
							   style:UIAlertActionStyleDefault
							   handler:^(UIAlertAction * action) {
								   //Handle no, thanks button
							   }];
	
	[alert addAction:yesButton];
	[alert addAction:noButton];
	
	[self presentViewController:alert animated:YES completion:nil];
}
 */
@end
