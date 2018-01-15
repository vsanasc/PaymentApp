//
//  TransactionModel.h
//  PaymentApp
//
//  Created by Vitor Santos do Nascimento on 1/14/18.
//

#import <Foundation/Foundation.h>

@class MethodModel,BankModel,InstallmentModel;

@interface TransactionModel : NSObject

@property (nonatomic) int value;
@property (nonatomic, strong) MethodModel *method;
@property (nonatomic, strong) BankModel *bank;
@property (nonatomic, strong) InstallmentModel *installments;
@property (nonatomic, strong) NSDate *date;

@end
