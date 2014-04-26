//
//  SkyBase.h
//  SkyBase
//
//  Created by Grigor Yeghiazaryan on 4/23/14.
//  Copyright (c) 2014 Applifica. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SkyBase : NSObject
+(void)getUserNameInBackground:(void (^)(NSString *))callback;
+(void)createUserInBackground:(NSDictionary*)userData withBlock:(void (^)(NSString *))callback;
@end
