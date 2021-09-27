/*
 #####################################################################
 # File    : UICollectionView+Middleware.h
 # Project : KSListView
 # Created : 2021/8/13 1:52 PM
 # DevTeam : Kingstar Development Team
 # Author  : kingstar
 # Notes   : 为UICollectionView添加方法
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

#import <UIKit/UIKit.h>
#import "KSCollectionMiddleware.h"

NS_ASSUME_NONNULL_BEGIN

@interface UICollectionView (Middleware)

// UICollectionView delegate
@property (nonatomic, weak, readonly) id<UICollectionViewDelegateFlowLayout> originDelegate;

// UICollectionView dataSource
@property (nonatomic, weak, readonly) id<KSCollectionViewDataSource> originDataSource;

/// 初始化一个collectionView、大小为零、默认UICollectionViewFlowLayout
/// @param delegate 代理
- (instancetype)initWithDelegate:(id<UICollectionViewDelegateFlowLayout,KSCollectionViewDataSource>)delegate;

/// 初始化一个collectionView、大小为零
/// @param layout 布局信息
/// @param delegate 代理
- (instancetype)initWithLayout:(UICollectionViewLayout *)layout delegate:(id<UICollectionViewDelegateFlowLayout,KSCollectionViewDataSource>)delegate;

/// 初始化一个collectionView、 大小为零
/// @param layout 布局信息
/// @param delegate 代理
/// @param dataSource 数据代理
- (instancetype)initWithLayout:(UICollectionViewLayout *)layout delegate:(id<UICollectionViewDelegateFlowLayout>)delegate dataSource:(id<KSCollectionViewDataSource>)dataSource;

/// 初始化一个collectionView
/// @param frame collectionView的大小
/// @param layout 布局信息
/// @param delegate 代理
/// @param dataSource 数据代理
- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout delegate:(id<UICollectionViewDelegateFlowLayout>)delegate dataSource:(id<KSCollectionViewDataSource>)dataSource;

/// 绑定代理给middleware同时保留其真实的代理
/// @param delegate 代理对象
/// @param dataSource 数据源代理对象
- (void)bindMiddlewareWithDelegate:(id<UICollectionViewDelegateFlowLayout>)delegate dataSource:(id<KSCollectionViewDataSource>)dataSource;

/// 添加一个Section数据源
/// @param sectionData section数据
- (void)addSectionData:(KSListData *)sectionData;

/// 添加一组数据到最后一个section
/// @param dataArray 要添加的数组
- (void)appendModelsToLastSection:(NSArray<id<KSItemModelProtocol>> *)dataArray;

/// 添加一组数据到最后一个section
/// @param dataArray 要添加的数组
/// @param section 对应的section
- (void)appendModels:(NSArray<id<KSItemModelProtocol>> *)dataArray atSection:(NSInteger)section;

/// 获取一个section的数据
/// @param section section对应的位置
- (nullable KSListData *)dataOfSection:(NSInteger)section;

/// 获取一条数据model
/// @param indexPath 所在位置
- (nullable id<KSItemModelProtocol>)dataOfIndexPath:(NSIndexPath *)indexPath;

/// 插入一个section的数据
/// @param sectionData 要插入的数据
/// @param section 要插入数据的位置
- (void)insertSectionData:(KSListData *)sectionData atSection:(NSInteger)section;

/// 移除一个section的数据
/// @param sectionData 对应的section数据
- (void)removeSectionData:(KSListData *)sectionData;

/// 获取列表section的数目
- (NSInteger)sectionsCount;

/// 清空所有数据源
- (void)clear;
@end

NS_ASSUME_NONNULL_END
