//
//  SATScore.h
//  20200416-HugoFlores-NYCSchools
//
//  Created by Hugo Flores Perez on 4/17/20.
//  Copyright © 2020 Hugo Flores Perez. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SATScore : NSObject
@property (nonatomic, copy) NSString *dbn;
@property (nonatomic, copy) NSString *schoolName;
@property (nonatomic, copy) NSString *numOfSatTestTakers;
@property (nonatomic, copy) NSString *satCriticalReadingAvgScore;
@property (nonatomic, copy) NSString *satMathAvgScore;
@property (nonatomic, copy) NSString *satWritingAvgScore;
@end

NS_ASSUME_NONNULL_END
