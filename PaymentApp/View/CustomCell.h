//
//  CustomCell.h
//  PaymentApp
//
//  Created by Vitor Santos do Nascimento on 1/14/18.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "CustomCellDelegate.h"

#import "MethodModel.h"
#import "BankModel.h"
#import "InstallmentModel.h"
#import "TransactionModel.h"

@class MainViewController;

typedef NS_ENUM(NSInteger, CellType) {
	Amount,
	CreditCard,
	Bank,
	Installments
};

@interface CustomCell : NSObject<CustomCellDelegate,UITextFieldDelegate>

@property (nonatomic,strong) NSArray *contentHeights;

@property (nonatomic, weak) MainViewController *parent;

@property (nonatomic, strong) NSArray<MethodModel*> *listMethods;
@property (nonatomic, strong) NSArray<BankModel*> *listBanks;
@property (nonatomic, strong) NSArray<InstallmentModel*> *listInstallment;


-(instancetype)initWithParent:(MainViewController *)parent;

@end
