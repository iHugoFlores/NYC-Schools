//
//  SchoolDetailsViewController.m
//  20200416-HugoFlores-NYCSchools
//
//  Created by Hugo Flores Perez on 4/17/20.
//  Copyright © 2020 Hugo Flores Perez. All rights reserved.
//

#import "SchoolDetailsViewController.h"

@interface SchoolDetailsViewController ()

@end

@implementation SchoolDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initObjects];
    [self setUpView];
    [self setData];
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

    UIStackView *mainView = [[UIStackView alloc] initWithArrangedSubviews:@[_schoolNameLabel, addresView, _programsLabel, _descriptionLabel, _description2Label]];
    mainView.translatesAutoresizingMaskIntoConstraints = false;
    mainView.axis = UILayoutConstraintAxisVertical;
    mainView.spacing = 16;
    [mainView setLayoutMarginsRelativeArrangement:true];
    mainView.layoutMargins = UIEdgeInsetsMake(12, 12, 12, 12);
    
    
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

@end
