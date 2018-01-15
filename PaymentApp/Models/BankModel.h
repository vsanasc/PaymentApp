//
//  BankModel.h
//  PaymentApp
//
//  Created by Vitor Santos do Nascimento on 1/11/18.
//

#import <Foundation/Foundation.h>

@interface BankModel : NSObject

@property (strong,nonatomic) NSString *id;
@property (strong,nonatomic) NSString *name;
@property (strong,nonatomic) NSString *logo;


+(void)listByMethod:(NSString *)method completionHandler:(void (^)(NSArray<BankModel *> *elements))completion;

@end
