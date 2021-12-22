//
//  RSSTableViewCell.m
//  finalAsg
//
//  Created by Saurabh Vidhate on 01/12/21.
//

#import "RSSTableViewCell.h"

@implementation RSSTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.titleLabel.font = [UIFont boldSystemFontOfSize:20];
    self.descriptionLabel.textColor = [UIColor lightGrayColor];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
