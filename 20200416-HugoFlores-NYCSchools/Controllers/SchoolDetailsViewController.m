//
//  SchoolDetailsViewController.m
//  20200416-HugoFlores-NYCSchools
//
//  Created by Hugo Flores Perez on 4/17/20.
//  Copyright © 2020 Hugo Flores Perez. All rights reserved.
//

#import "SchoolDetailsViewController.h"
#import "SchoolsAPI.h"

@interface SchoolDetailsViewController ()

@end

@implementation SchoolDetailsViewController

UIStackView *mainView;

SATScore *schoolScore;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initObjects];
    [self setUpView];
    [self setData];
    [SchoolsAPI getSATScoreForSchool:_model.dbn hander:^(SATScore * score) {
        schoolScore = score;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self setSatScore];
        });
    }];
}

- (void) initObjects {
    _schoolNameLabel =  [[UILabel alloc] init];
    [_schoolNameLabel setFont:[UIFont fontWithName:@"GillSans" size:40]];
    _schoolNameLabel.numberOfLines = 0;

    _descriptionLabel = [[UILabel alloc] init];
    [_descriptionLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:20]];
    _descriptionLabel.numberOfLines = 0;
    
    _description2Label = [[UILabel alloc] init];
    [_description2Label setFont:[UIFont fontWithName:@"HelveticaNeue" size:20]];
    _description2Label.numberOfLines = 0;

    _stateLabel = [[UILabel alloc] init];
    _cityLabel = [[UILabel alloc] init];
    _addressLabel = [[UILabel alloc] init];
    
    _programsLabel = [[UILabel alloc] init];
    [_programsLabel setFont:[UIFont fontWithName:@"GeezaPro" size:20]];
    _programsLabel.numberOfLines = 0;
    _programsLabel.textAlignment = NSTextAlignmentCenter;
    _programsLabel.layer.borderWidth = 2.0;
    _programsLabel.layer.cornerRadius = 8;
    _programsLabel.backgroundColor = UIColor.yellowColor;
    _programsLabel.layer.masksToBounds = true;
}

- (void)setUpView {
    UIStackView *addresView = [[UIStackView alloc] initWithArrangedSubviews:@[_stateLabel, _cityLabel, _addressLabel]];
    addresView.axis = UILayoutConstraintAxisVertical;
    addresView.spacing = 6;
    addresView.distribution = UIStackViewDistributionFillProportionally;
    addresView.alignment = UIStackViewAlignmentTrailing;

    mainView = [[UIStackView alloc] initWithArrangedSubviews:@[_schoolNameLabel, addresView, _programsLabel, _descriptionLabel, _description2Label]];
    mainView.translatesAutoresizingMaskIntoConstraints = false;
    mainView.axis = UILayoutConstraintAxisVertical;
    mainView.spacing = 24;
    [mainView setLayoutMarginsRelativeArrangement:true];
    mainView.layoutMargins = UIEdgeInsetsMake(12, 12, 24, 12);
    
    
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.translatesAutoresizingMaskIntoConstraints = false;
    [scrollView addSubview:mainView];

    [self.view addSubview:scrollView];
    
    [[scrollView.topAnchor constraintEqualToAnchor: self.view.topAnchor] setActive:true];
    [[scrollView.bottomAnchor constraintEqualToAnchor: self.view.bottomAnchor] setActive:true];
    [[scrollView.leftAnchor constraintEqualToAnchor: self.view.leftAnchor] setActive:true];
    [[scrollView.rightAnchor constraintEqualToAnchor: self.view.rightAnchor] setActive:true];
    
    [[mainView.topAnchor constraintEqualToAnchor: scrollView.topAnchor] setActive:true];
    [[mainView.bottomAnchor constraintEqualToAnchor: scrollView.bottomAnchor] setActive:true];
    [[mainView.leftAnchor constraintEqualToAnchor: scrollView.leftAnchor] setActive:true];
    [[mainView.rightAnchor constraintEqualToAnchor: scrollView.rightAnchor] setActive:true];
    
    [[mainView.widthAnchor constraintEqualToAnchor:self.view.widthAnchor] setActive:true];
}

- (void)setData {
    _schoolNameLabel.text = _model.schoolName;
    _descriptionLabel.text = [NSString stringWithFormat:@"• %@", _model.academicopportunities1];
    _description2Label.text = [NSString stringWithFormat:@"• %@", _model.academicopportunities2];
    _programsLabel.text = _model.ellPrograms;
    _stateLabel.text = _model.stateCode;
    _cityLabel.text = _model.city;
    _addressLabel.text = _model.primaryAddressLine1;
}

- (void) setSatScore {
    CGFloat maxScore = 800;

    UILabel *satTitleLabel = [[UILabel alloc] init];
    [satTitleLabel setFont:[UIFont fontWithName:@"Avenir-Book" size:30]];
    satTitleLabel.numberOfLines = 0;
    satTitleLabel.text = @"SAT Scores";
    [mainView addArrangedSubview:satTitleLabel];
    
    UILabel *satTakersLabel = [[UILabel alloc] init];
    [satTakersLabel setFont:[UIFont fontWithName:@"Verdana" size:18]];
    satTakersLabel.numberOfLines = 1;
    satTakersLabel.text = [NSString stringWithFormat:@"Number of SAT Takers: %@", schoolScore.numOfSatTestTakers];
    
    // Reading
    UILabel *readingLabel =  [[UILabel alloc] init];
    [readingLabel setFont:[UIFont fontWithName:@"Menlo-Regular" size:12]];
    readingLabel.numberOfLines = 1;
    readingLabel.text = [NSString stringWithFormat:@"Critical Reading Avg.: %@ / %.0f", schoolScore.satCriticalReadingAvgScore, maxScore];
    UIView *readingView =  [[UIView alloc] init];
    readingView.backgroundColor = [UIColor colorWithDisplayP3Red:0.1 green:0.1 blue:0.3 alpha:0.2];
    readingView.translatesAutoresizingMaskIntoConstraints = false;
    UIStackView *readingSView = [[UIStackView alloc] initWithArrangedSubviews:@[readingLabel, readingView]];
    readingSView.axis = UILayoutConstraintAxisVertical;
    readingSView.spacing = 6;
    
    // Writing
    UILabel *writingLabel =  [[UILabel alloc] init];
    [writingLabel setFont:[UIFont fontWithName:@"Menlo-Regular" size:12]];
    writingLabel.numberOfLines = 1;
    writingLabel.text = [NSString stringWithFormat:@"Writing Avg.: %@ / %.0f", schoolScore.satWritingAvgScore, maxScore];
    UIView *writingView = [[UIView alloc] init];
    writingView.backgroundColor = [UIColor colorWithDisplayP3Red:0.1 green:0.3 blue:0.1 alpha:0.2];
    writingView.translatesAutoresizingMaskIntoConstraints = false;
    UIStackView *writingSView = [[UIStackView alloc] initWithArrangedSubviews:@[writingLabel, writingView]];
    writingSView.axis = UILayoutConstraintAxisVertical;
    writingSView.spacing = 6;
    
    // Math
    UILabel *mathLabel =  [[UILabel alloc] init];
    [mathLabel setFont:[UIFont fontWithName:@"Menlo-Regular" size:12]];
    mathLabel.numberOfLines = 1;
    mathLabel.text = [NSString stringWithFormat:@"Math Avg.: %@ / %.0f", schoolScore.satMathAvgScore, maxScore];
    UIView *mathView = [[UIView alloc] init];
    mathView.backgroundColor = [UIColor colorWithDisplayP3Red:0.3 green:0.1 blue:0.1 alpha:0.2];
    mathView.translatesAutoresizingMaskIntoConstraints = false;
    UIStackView *mathSView = [[UIStackView alloc] initWithArrangedSubviews:@[mathLabel, mathView]];
    mathSView.axis = UILayoutConstraintAxisVertical;
    mathSView.spacing = 6;
    
    UIStackView *satView = [[UIStackView alloc] initWithArrangedSubviews:@[satTakersLabel, readingSView, writingSView, mathSView]];
    satView.axis = UILayoutConstraintAxisVertical;
    satView.spacing = 24;
    satView.distribution = UIStackViewDistributionFillProportionally;
    [satView setLayoutMarginsRelativeArrangement:true];
    satView.layoutMargins = UIEdgeInsetsMake(0, 24, 0, 24);
    
    [[readingView.heightAnchor constraintEqualToConstant:30] setActive:true];
    [[writingView.heightAnchor constraintEqualToConstant:30] setActive:true];
    [[mathView.heightAnchor constraintEqualToConstant:30] setActive:true];
    
    [mainView addArrangedSubview:satView];
    
    // Set SAT Score Chart
    UIView *readingScoreView = [[UIView alloc] init];
    readingScoreView.backgroundColor = [UIColor systemBlueColor];
    readingScoreView.translatesAutoresizingMaskIntoConstraints = false;
    UIView *writingScoreView = [[UIView alloc] init];
    writingScoreView.backgroundColor = [UIColor systemGreenColor];
    writingScoreView.translatesAutoresizingMaskIntoConstraints = false;
    UIView *mathScoreView = [[UIView alloc] init];
    mathScoreView.backgroundColor = [UIColor systemRedColor];
    mathScoreView.translatesAutoresizingMaskIntoConstraints = false;
    
    [readingView addSubview:readingScoreView];
    [writingView addSubview:writingScoreView];
    [mathView addSubview:mathScoreView];
    
    CGFloat readingScore = [schoolScore.satCriticalReadingAvgScore floatValue];
    CGFloat writingScore = [schoolScore.satWritingAvgScore floatValue];
    CGFloat mathScore = [schoolScore.satMathAvgScore floatValue];

    [[readingScoreView.widthAnchor constraintEqualToAnchor:readingView.widthAnchor multiplier:readingScore / maxScore] setActive:true];
    [[writingScoreView.widthAnchor constraintEqualToAnchor:writingView.widthAnchor multiplier:writingScore / maxScore] setActive:true];
    [[mathScoreView.widthAnchor constraintEqualToAnchor:mathView.widthAnchor multiplier:mathScore / maxScore] setActive:true];
    [[readingScoreView.heightAnchor constraintEqualToAnchor:readingView.heightAnchor] setActive:true];
    [[writingScoreView.heightAnchor constraintEqualToAnchor:writingView.heightAnchor] setActive:true];
    [[mathScoreView.heightAnchor constraintEqualToAnchor:mathView.heightAnchor] setActive:true];
}

@end
