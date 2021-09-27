/*
 #####################################################################
 # File    : KSKSTableMiddleware.h
 # Project : KSListView
 # Created : 2021/8/13 1:52 PM
 # DevTeam : Kingstar Development Team
 # Author  : kingstar
 # Notes   : UITableView的数据源管理类
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
#import "KSTableViewDataSource.h"
#import "KSListData.h"

NS_ASSUME_NONNULL_BEGIN


@interface KSTableMiddleware : NSObject<UITableViewDelegate,UITableViewDataSource>

// 实现部分代理
@property (nonatomic, weak) id<UITableViewDelegate> delegate;
// 这里的KSTableViewDataSource移除掉了已经实现的部分、剩余部分代理自由发挥
@property (nonatomic, weak) id<KSTableViewDataSource> dataSource;
// 是否重用cell 默认：NO 重用，YES 不重用
@property (nonatomic, assign) BOOL notReuseCell;
// section的数量
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


/// 获取一个section的数据源
/// @param sectionData 要查找的数据
- (NSInteger)indexOfSection:(KSListData *)sectionData;


/// 移除所有的section
- (void)removeAllSections;

@end

NS_ASSUME_NONNULL_END
