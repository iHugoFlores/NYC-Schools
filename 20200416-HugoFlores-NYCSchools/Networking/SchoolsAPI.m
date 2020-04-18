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
    //handler([NSMutableArray arrayWithArray:[SchoolsAPI getDummyData]]);
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

+ (void)getSATScoreForSchool: (NSString *) schoolId hander: (void(^)(SATScore *)) onDone {
    NSURL *url = [NSURL URLWithString:satScoresEndpoint];
    [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSError *err;
        NSArray *satDicts = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&err];
        if (err) {
            NSLog(@"Failed to serialize JSON: %@", err);
            return;
        }

        for (NSDictionary *satDict in satDicts) {
            NSString *dbn = satDict[@"dbn"];
            if ([dbn isEqualToString:schoolId]) {
                SATScore *new = SATScore.new;
                [new initWithDictionary:satDict];
                onDone(new);
                break;
            }
        }
    }] resume];
}

+ (NSArray<School *>*)getDummyData {
    School *new = School.new;
    return @[[new initDummy],[new initDummy],[new initDummy],[new initDummy],[new initDummy],[new initDummy],[new initDummy],[new initDummy],[new initDummy],[new initDummy],[new initDummy],[new initDummy],[new initDummy],[new initDummy],[new initDummy],[new initDummy],[new initDummy],[new initDummy],[new initDummy]];
}

@end
