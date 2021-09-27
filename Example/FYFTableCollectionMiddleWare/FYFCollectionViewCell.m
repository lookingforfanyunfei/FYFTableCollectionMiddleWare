//
//  FYFCollectionViewCell.m
//  FYFTableCollectionMiddleWare
//
//  Created by kingstar on 2021/8/18.
//

#import "FYFCollectionViewCell.h"

#import "Masonry.h"

#import "FYFCollectionModel.h"

#define KPadding 15

#define KLineSpacing 5
#define KInteritemSpacing 5

#define KItemWith ([UIScreen mainScreen].bounds.size.width - KInteritemSpacing - 2* KPadding)/2
#define KItemHeight 100

@interface FYFCollectionViewCell ()

@property (nonatomic, strong) UILabel *textlabel;

@end

@implementation FYFCollectionViewCell

@synthesize collection;

@synthesize indexPath;

@dynamic model;


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    _textlabel = [[UILabel alloc] init];
    self.textlabel.numberOfLines = 0;
    [self.contentView addSubview:self.textlabel];
  
    [self.textlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(10);
        make.left.equalTo(self.contentView.mas_left).offset(10);
        make.right.equalTo(self.contentView.mas_right).offset(-10);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-10);
    }];
}

- (void)setModel:(FYFCollectionModel *)model {
    self.textlabel.text = model.text;
}

+ (CGSize)sizeForItem:(nonnull UICollectionView *)collectionView indexPath:(nonnull NSIndexPath *)indexPath {
    return CGSizeMake(KItemWith, 200);
}

@end
