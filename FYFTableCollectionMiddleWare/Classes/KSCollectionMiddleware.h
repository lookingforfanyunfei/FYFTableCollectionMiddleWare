/*
 #####################################################################
 # File    : KSCollectionMiddleware.h
 # Project : KSListView
 # Created : 2021/8/13 1:52 PM
 # DevTeam : Kingstar Development Team
 # Author  : kingstar
 # Notes   : UICollectionView的管理类
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
#import <UIKit/UIKit.h>
#import "KSCollectionViewDataSource.h"
#import "KSListData.h"

NS_ASSUME_NONNULL_BEGIN

@interface KSCollectionMiddleware : NSObject<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>


/** UITableViewDelegate delegate*/
@property (nonatomic, weak) id<UICollectionViewDelegateFlowLayout> delegate;
/** KSTableViewDataSource dataSource*/
// 这里的KSTableViewDataSource移除掉了已经实现的部分、剩余部分代理自由发挥
@property (nonatomic, weak) id<KSCollectionViewDataSource> dataSource;


@property (nonatomic, assign) NSInteger count;

/// 添加一个section的数据
/// @param sectionData section的数据
- (void)addSectionData:(KSListData *)sectionData;


/// 获取一个section的数据
/// @param section section对应的位置
- (nullable KSListData *)dataOfSection:(NSInteger)section;


/// 移除一个section的数据
/// @param sectionData 对应的section数据
- (void)removeSectionData:(KSListData *)sectionData;


/// 插入一个section的数据
/// @param sectionData 要插入的数据
/// @param section 要插入数据的位置
- (void)insertSectionData:(KSListData *)sectionData atSection:(NSInteger)section;


/// 移除所有的section
- (void)removeAllSections;


@end

NS_ASSUME_NONNULL_END
