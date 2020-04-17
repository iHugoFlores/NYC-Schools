//
//  SchoolsAPI.h
//  20200416-HugoFlores-NYCSchools
//
//  Created by Hugo Flores Perez on 4/17/20.
//  Copyright © 2020 Hugo Flores Perez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "School.h"

NS_ASSUME_NONNULL_BEGIN

@interface SchoolsAPI : NSObject
+ (void)getSchoolsWithHandler: (void(^)(NSMutableArray<School *>*)) handler;
+ (void)getSATScoreForSchool: (void(^)(void)) handler;
@end

NS_ASSUME_NONNULL_END
