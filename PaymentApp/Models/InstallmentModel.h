//
//  InstallmentModel.h
//  PaymentApp
//
//  Created by Vitor Santos do Nascimento on 1/11/18.
//

#import <Foundation/Foundation.h>

@interface InstallmentModel : NSObject

@property (nonatomic) int installments;
@property (nonatomic) int value;
@property (nonatomic, strong) NSString *message;

+(void)listByParams:(int)amount withMethod:(NSString *)method withBank:(NSString *)bank completionHandler:(void (^)(NSArray<InstallmentModel *> *elements))completion;

@end
