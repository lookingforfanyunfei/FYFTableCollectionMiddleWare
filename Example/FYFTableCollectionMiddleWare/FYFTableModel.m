//
//  FYFTableModel.m
//  FYFTableCollectionMiddleWare_Example
//
//  Created by kingstar on 2021/8/16.
//  Copyright © 2021 kingstar. All rights reserved.
//

#import "FYFTableModel.h"

#import "FYFTableViewCell.h"

@implementation FYFTableModel

@dynamic itemClass;

- (Class)itemClass {
    return [FYFTableViewCell class];
}

@end
