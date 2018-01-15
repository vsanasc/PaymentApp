//
//  MethodModel.h
//  PaymentApp
//
//  Created by Vitor Santos do Nascimento on 1/11/18.
//

#import <Foundation/Foundation.h>

@interface MethodModel : NSObject

@property (nonatomic,strong) NSString *id;
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *logo;

+(void)all:(void (^)(NSArray<MethodModel *> *elements))completion;

@end
