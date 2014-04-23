//
//  SkyBase.m
//  SkyBase
//
//  Created by Grigor Yeghiazaryan on 4/23/14.
//  Copyright (c) 2014 Applifica. All rights reserved.
//

#import "SkyBase.h"

@implementation SkyBase

+(void)getUserNameInBackground:(void (^)(NSString *))callback
{
    NSString *parseRestTestUrl = @"http://parse-rest-test.herokuapp.com/";
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:[NSURL URLWithString:parseRestTestUrl]
            completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSString* result = [NSString stringWithUTF8String:[data bytes]];
        callback(result);
    }] resume];
}

@end
