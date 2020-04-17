//
//  SchoolTableCell.h
//  20200416-HugoFlores-NYCSchools
//
//  Created by Hugo Flores Perez on 4/17/20.
//  Copyright © 2020 Hugo Flores Perez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "School.h"

NS_ASSUME_NONNULL_BEGIN

@interface SchoolTableCell : UITableViewCell
@property UILabel *schoolNameLabel;
@property UILabel *descriptionLabel;
@property UILabel *stateLabel;
@property UILabel *cityLabel;
@property UILabel *addressLabel;
@property School *model;
- (void)setView;
@end

NS_ASSUME_NONNULL_END
