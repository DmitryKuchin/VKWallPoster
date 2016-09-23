//
//  DKWallUserCell.m
//  VKWallPoster
//
//  Created by Дмитрий on 23.09.16.
//  Copyright © 2016 Dmitry Kuchin. All rights reserved.
//

#import "DKWallUserCell.h"

@interface DKWallUserCell ()
@property(weak, nonatomic)IBOutlet UILabel *textPostLabel;
@property(weak, nonatomic)IBOutlet UILabel *nameTrackPostLabel;
@property(weak, nonatomic)IBOutlet UILabel *authorTrackPostLabel;
@property(weak, nonatomic)IBOutlet UILabel *likeLabel;
@property(weak, nonatomic)IBOutlet UILabel *repostLabel;
@property(weak, nonatomic)IBOutlet UIImageView *imagePost;
@end

@implementation DKWallUserCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
