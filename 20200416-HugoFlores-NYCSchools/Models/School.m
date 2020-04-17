//
//  School.m
//  20200416-HugoFlores-NYCSchools
//
//  Created by Hugo Flores Perez on 4/17/20.
//  Copyright © 2020 Hugo Flores Perez. All rights reserved.
//

#import "School.h"

@implementation School
- (void)initWithDictionary: (NSDictionary *) dictionary {
    _dbn = dictionary[@"dbn"];
    _schoolName = dictionary[@"school_name"];
    _overviewParagraph = dictionary[@"overview_paragraph"];
    _academicopportunities1 = dictionary[@"academicopportunities1"];
    _academicopportunities2 = dictionary[@"academicopportunities2"];
    _ellPrograms = dictionary[@"ell_programs"];
    _languageClasses = dictionary[@"language_classes"];
    _startTime = dictionary[@"start_time"];
    _endTime = dictionary[@"end_time"];
    _extracurricularActivities = dictionary[@"extracurricular_activities"];
    _admissionspriority11 = dictionary[@"admissionspriority11"];
    _city = dictionary[@"city"];
    _zip = dictionary[@"zip"];
    _stateCode = dictionary[@"state_code"];
    _primaryAddressLine1 = dictionary[@"primary_address_line_1"];
}

- (instancetype)initDummy {
    int r = arc4random_uniform(200);
    School *res = [School new];
    res.dbn = @"dbn";
    res.schoolName = [NSString stringWithFormat:@"School Number %d", r];
    res.overviewParagraph = @"overview_paragraph";
    res.academicopportunities1 = @"academicopportunities1";
    res.ellPrograms = @"ell_programs";
    res.languageClasses = @"language_classes";
    res.startTime = @"start_time";
    res.endTime = @"end_time";
    res.extracurricularActivities = @"extracurricular_activities";
    res.admissionspriority11 = @"admissionspriority11";
    res.city = @"city";
    res.zip = @"zip";
    res.stateCode = @"state_code";
    res.primaryAddressLine1 = @"primary_address_line_1";
    return res;
}
@end
