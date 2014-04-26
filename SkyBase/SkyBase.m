//
//  SkyBase.m
//  SkyBase
//
//  Created by Grigor Yeghiazaryan on 4/23/14.
//  Copyright (c) 2014 Applifica. All rights reserved.
//

#import "SkyBase.h"

@implementation SkyBase

NSString *parseRestTestUrl = @"http://parse-rest-test.herokuapp.com/";

+(void)getUserNameInBackground:(void (^)(NSString *))callback
{
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:[NSURL URLWithString:parseRestTestUrl]
            completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSString* result = [NSString stringWithUTF8String:[data bytes]];
        callback(result);
    }] resume];
}

+ (void)createUserInBackground:(NSDictionary*)userData withBlock:(void (^)(NSString *))callback
{
    NSError *error;
    NSData *postData = [NSJSONSerialization dataWithJSONObject:userData options:0 error:&error];
    NSString *url = [parseRestTestUrl stringByAppendingString:@"/users"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:postData];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request
            completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSString *result = data ?
                [NSString stringWithUTF8String:[data bytes]] :
                [error localizedDescription];
        callback(result);
    }] resume];
}

@end
