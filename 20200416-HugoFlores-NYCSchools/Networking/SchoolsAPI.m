//
//  SchoolsAPI.m
//  20200416-HugoFlores-NYCSchools
//
//  Created by Hugo Flores Perez on 4/17/20.
//  Copyright © 2020 Hugo Flores Perez. All rights reserved.
//

#import "SchoolsAPI.h"
#import "School.h"

@implementation SchoolsAPI

NSString *schoolsEndpoint = @"https://data.cityofnewyork.us/resource/s3k6-pzi2.json";
NSString *satScoresEndpoint = @"https://data.cityofnewyork.us/resource/f9bf-2cp4.json";

+ (void)getSchoolsWithHandler: (void(^)(NSMutableArray<School *>*)) handler {
    NSURL *url = [NSURL URLWithString:schoolsEndpoint];
    [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        //NSString *res = [[NSString alloc] initWithData:data encoding: NSUTF8StringEncoding];
        NSError *err;
        NSArray *schoolsDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&err];
        if (err) {
            NSLog(@"Failed to serialize JSON: %@", err);
            return;
        }
        NSMutableArray<School *> *res = NSMutableArray.new;
        for (NSDictionary *schoolDict in schoolsDict) {
            School *new = School.new;
            [new initWithDictionary:schoolDict];
            [res addObject:new];
        }
        handler(res);
    }] resume];
}

+ (void)getSATScoreForSchool: (void(^)(void)) handler {
    
}

@end
