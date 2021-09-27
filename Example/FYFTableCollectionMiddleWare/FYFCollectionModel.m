//
//  FYFCollectionModel.m
//  FYFTableCollectionMiddleWare
//
//  Created by kingstar on 2021/8/18.
//

#import "FYFCollectionModel.h"
#import "FYFCollectionViewCell.h"

@implementation FYFCollectionModel

- (Class)itemClass {
    return [FYFCollectionViewCell class];
}

@end
