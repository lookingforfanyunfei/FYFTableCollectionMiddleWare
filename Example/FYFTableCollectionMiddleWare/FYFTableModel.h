//
//  FYFTableModel.h
//  FYFTableCollectionMiddleWare_Example
//
//  Created by kingstar on 2021/8/16.
//  Copyright © 2021 kingstar. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FYFTableModel : NSObject <FYFItemModelProtocol>

@property (nonatomic, strong) NSString * text;

@end

NS_ASSUME_NONNULL_END
