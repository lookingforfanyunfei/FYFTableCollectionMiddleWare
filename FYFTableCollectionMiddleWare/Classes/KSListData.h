/*
 #####################################################################
 # File    : KSListData.h
 # Project : KSListView
 # Created : 2021/8/13 1:52 PM
 # DevTeam : Kingstar Development Team
 # Author  : kingstar
 # Notes   : 列表的每个section的的数据源
 #####################################################################
 ### Change Logs   ###################################################
 #####################################################################
 ---------------------------------------------------------------------
 # Date  :
 # Author:
 # Notes :
 #
 #####################################################################
 */


#import <Foundation/Foundation.h>
#import "KSItemModelProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface KSListData : NSObject<NSFastEnumeration>

// 列表header Model
@property (nonatomic, strong) id<KSItemModelProtocol> headerModel;
// 列表footer Model
@property (nonatomic, strong) id<KSItemModelProtocol> footerModel;
// section的数据总数
@property (nonatomic, assign, readonly) NSInteger count;

/// 初始化
- (instancetype)init;

/// 便捷的初始化方式
+ (instancetype)listData;

/// 添加model
/// @param model 要添加的model
- (void)addModel:(id<KSItemModelProtocol>)model;


/// 添加model数组
/// @param modelArray 要添加的model数组
- (void)appendModels:(NSArray<id<KSItemModelProtocol>> *)modelArray;

/// 插入一条model数据
/// @param model 对应的数据model
/// @param index 对应的位置
- (void)insertModel:(id<KSItemModelProtocol>)model atIndex:(NSInteger)index;


/// 替换一个数据model在对应的位置
/// @param index 对应的index
/// @param model 数据model
- (void)replaceModelAtIndex:(NSInteger)index newModel:(id<KSItemModelProtocol>)model;


/// 移除所有的数据model
- (void)removeAllModels;


/// 移除对应的数据model
/// @param model 数据model
- (void)removeModel:(id<KSItemModelProtocol>)model;


/// 移除数据model在对应的位置
/// @param index 数据model的位置
- (void)removeModelAtIndex:(NSInteger)index;


/// 获取model
/// @param index 对应的index
- (nullable id<KSItemModelProtocol>)modelAtIndex:(NSInteger)index;
@end

NS_ASSUME_NONNULL_END
