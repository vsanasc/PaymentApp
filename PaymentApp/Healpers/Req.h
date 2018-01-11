//
//  Req.h
//  PaymentApp
//
//  Created by Vitor Santos do Nascimento on 1/10/18.
//

#import <Foundation/Foundation.h>

@interface Req : NSObject

@property (strong, nonatomic) NSString* server;

+(instancetype) instance;

-(void)getWithAPI:NSString;


@end
