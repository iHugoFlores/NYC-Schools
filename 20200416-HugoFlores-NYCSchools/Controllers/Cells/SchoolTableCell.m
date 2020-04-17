//
//  SchoolTableCell.m
//  20200416-HugoFlores-NYCSchools
//
//  Created by Hugo Flores Perez on 4/17/20.
//  Copyright © 2020 Hugo Flores Perez. All rights reserved.
//

#import "SchoolTableCell.h"

@implementation SchoolTableCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    [self initObjects];
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)setUpView {
    UIStackView *addresView = [[UIStackView alloc] initWithArrangedSubviews:@[_stateLabel, _cityLabel, _addressLabel]];
    addresView.axis = UILayoutConstraintAxisHorizontal;
    addresView.spacing = 6;
    addresView.alignment = UIStackViewDistributionEqualSpacing;

    UIStackView *mainView = [[UIStackView alloc] initWithArrangedSubviews:@[_schoolNameLabel, _descriptionLabel, addresView]];
    mainView.translatesAutoresizingMaskIntoConstraints = false;
    mainView.axis = UILayoutConstraintAxisVertical;
    mainView.spacing = 8;
    [mainView setLayoutMarginsRelativeArrangement:true];
    mainView.layoutMargins = UIEdgeInsetsMake(12, 12, 12, 12);
    
    [self.contentView addSubview:mainView];
    
    [[mainView.topAnchor constraintEqualToAnchor: self.contentView.topAnchor] setActive:true];
    [[mainView.bottomAnchor constraintEqualToAnchor: self.contentView.bottomAnchor] setActive:true];
    [[mainView.leftAnchor constraintEqualToAnchor: self.contentView.leftAnchor] setActive:true];
    [[mainView.rightAnchor constraintEqualToAnchor: self.contentView.rightAnchor] setActive:true];
}

- (void) initObjects {
    _schoolNameLabel =  [[UILabel alloc] init];
    [_schoolNameLabel setFont:[UIFont fontWithName:@"AcademyEngravedLetPlain" size:30]];
    _schoolNameLabel.numberOfLines = 0;

    _descriptionLabel = [[UILabel alloc] init];
    [_descriptionLabel setFont:[UIFont fontWithName:@"AmericanTypewriter" size:15]];
    _descriptionLabel.numberOfLines = 0;

    _stateLabel = [[UILabel alloc] init];
    _cityLabel = [[UILabel alloc] init];
    _addressLabel = [[UILabel alloc] init];
    [self setUpView];
}

- (void)setView {
    _schoolNameLabel.text = _model.schoolName;
    _descriptionLabel.text = _model.academicopportunities1;
    _stateLabel.text = _model.stateCode;
    _cityLabel.text = _model.city;
    _addressLabel.text = _model.primaryAddressLine1;
}

@end
