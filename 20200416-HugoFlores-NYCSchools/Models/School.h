//
//  School.h
//  20200416-HugoFlores-NYCSchools
//
//  Created by Hugo Flores Perez on 4/17/20.
//  Copyright © 2020 Hugo Flores Perez. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface School : NSObject
@property (nonatomic, copy)   NSString *dbn;
@property (nonatomic, copy)   NSString *schoolName;
@property (nonatomic, copy)   NSString *boro;
@property (nonatomic, copy)   NSString *overviewParagraph;
@property (nonatomic, copy)   NSString *school10ThSeats;
@property (nonatomic, copy)   NSString *academicopportunities1;
@property (nonatomic, copy)   NSString *academicopportunities2;
@property (nonatomic, copy)   NSString *languageClasses;
@property (nonatomic, copy)   NSString *ellPrograms;
@property (nonatomic, copy)   NSString *neighborhood;
@property (nonatomic, copy)   NSString *buildingCode;
@property (nonatomic, copy)   NSString *location;
@property (nonatomic, copy)   NSString *phoneNumber;
@property (nonatomic, copy)   NSString *faxNumber;
@property (nonatomic, copy)   NSString *schoolEmail;
@property (nonatomic, copy)   NSString *website;
@property (nonatomic, copy)   NSString *subway;
@property (nonatomic, copy)   NSString *bus;
@property (nonatomic, copy)   NSString *grades2018;
@property (nonatomic, copy)   NSString *finalgrades;
@property (nonatomic, copy)   NSString *totalStudents;
@property (nonatomic, copy)   NSString *extracurricularActivities;
@property (nonatomic, copy)   NSString *schoolSports;
@property (nonatomic, copy)   NSString *attendanceRate;
@property (nonatomic, copy)   NSString *pctStuEnoughVariety;
@property (nonatomic, copy)   NSString *pctStuSafe;
@property (nonatomic, copy)   NSString *schoolAccessibilityDescription;
@property (nonatomic, copy)   NSString *directions1;
@property (nonatomic, copy)   NSString *requirement11;
@property (nonatomic, copy)   NSString *requirement21;
@property (nonatomic, copy)   NSString *requirement31;
@property (nonatomic, copy)   NSString *requirement41;
@property (nonatomic, copy)   NSString *requirement51;
@property (nonatomic, copy)   NSString *offerRate1;
@property (nonatomic, copy)   NSString *program1;
@property (nonatomic, copy)   NSString *code1;
@property (nonatomic, copy)   NSString *interest1;
@property (nonatomic, copy)   NSString *method1;
@property (nonatomic, copy)   NSString *seats9Ge1;
@property (nonatomic, copy)   NSString *grade9Gefilledflag1;
@property (nonatomic, copy)   NSString *grade9Geapplicants1;
@property (nonatomic, copy)   NSString *seats9Swd1;
@property (nonatomic, copy)   NSString *grade9Swdfilledflag1;
@property (nonatomic, copy)   NSString *grade9Swdapplicants1;
@property (nonatomic, copy)   NSString *seats101;
@property (nonatomic, copy)   NSString *admissionspriority11;
@property (nonatomic, copy)   NSString *admissionspriority21;
@property (nonatomic, copy)   NSString *admissionspriority31;
@property (nonatomic, copy)   NSString *grade9Geapplicantsperseat1;
@property (nonatomic, copy)   NSString *grade9Swdapplicantsperseat1;
@property (nonatomic, copy)   NSString *primaryAddressLine1;
@property (nonatomic, copy)   NSString *city;
@property (nonatomic, copy)   NSString *zip;
@property (nonatomic, copy)   NSString *stateCode;
@property (nonatomic, copy)   NSString *latitude;
@property (nonatomic, copy)   NSString *longitude;
@property (nonatomic, copy)   NSString *communityBoard;
@property (nonatomic, copy)   NSString *councilDistrict;
@property (nonatomic, copy)   NSString *censusTract;
@property (nonatomic, copy)   NSString *bin;
@property (nonatomic, copy)   NSString *bbl;
@property (nonatomic, copy)   NSString *nta;
@property (nonatomic, copy)   NSString *startTime;
@property (nonatomic, copy)   NSString *endTime;
- (void)initWithDictionary: (NSDictionary *) dictionary;
@end

NS_ASSUME_NONNULL_END
