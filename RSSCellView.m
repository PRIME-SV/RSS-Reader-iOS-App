//
//  RSSCellView.m
//  finalAsg
//
//  Created by Saurabh Vidhate on 02/12/21.
//

#import "RSSCellView.h"

@implementation RSSCellView
@synthesize imageView = _imageView;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.imageView.image = [UIImage imageNamed:@"rss" ];
    self.titleLabel.font = [UIFont boldSystemFontOfSize:20];
    self.titleLabel.numberOfLines = 2;
    self.descriptionLabel.textColor = [UIColor lightGrayColor];
    self.descriptionLabel.numberOfLines = 3;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
