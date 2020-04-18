//
//  SATScore.m
//  20200416-HugoFlores-NYCSchools
//
//  Created by Hugo Flores Perez on 4/17/20.
//  Copyright © 2020 Hugo Flores Perez. All rights reserved.
//

#import "SATScore.h"

@implementation SATScore
- (void)initWithDictionary: (NSDictionary *) dictionary {
    _dbn = dictionary[@"dbn"];
    _schoolName = dictionary[@"school_name"];
    _numOfSatTestTakers = dictionary[@"num_of_sat_test_takers"];
    _satCriticalReadingAvgScore = dictionary[@"sat_critical_reading_avg_score"];
    _satMathAvgScore = dictionary[@"sat_math_avg_score"];
    _satWritingAvgScore = dictionary[@"sat_writing_avg_score"];
}
@end
