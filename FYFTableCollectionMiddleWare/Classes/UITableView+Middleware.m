/*
 #####################################################################
 # File    : UITableView+Middleware.m
 # Project : KSListView
 # Created : 2021/8/13 1:52 PM
 # DevTeam : Kingstar Development Team
 # Author  : kingstar
 # Notes   : 为tableView添加方法
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

#import "UITableView+Middleware.h"
#import <objc/runtime.h>

@interface UITableView ()
/** 私有属性 请勿直接操作此对象 */
@property (nonatomic, strong) KSTableMiddleware *tableMiddleware;

@end

@implementation UITableView (Middleware)

// 关联属性中间件
static void *KSTableMiddlewareKey = (void *)@"tableMiddlewareKey";
-(KSTableMiddleware *)tableMiddleware {
    return objc_getAssociatedObject(self, KSTableMiddlewareKey);
}
-(void)setTableMiddleware:(KSTableMiddleware *)KSTableMiddleware {
    objc_setAssociatedObject(self, KSTableMiddlewareKey, KSTableMiddleware, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

// 关联属性中间件
static void *kNotReuseCellKey = (void *)@"notReuseCellKey";
-(BOOL)notReuseCell {
    return [objc_getAssociatedObject(self, kNotReuseCellKey) boolValue];
}
-(void)setNotReuseCell:(BOOL)notReuseCell {
    objc_setAssociatedObject(self, kNotReuseCellKey, @(notReuseCell), OBJC_ASSOCIATION_ASSIGN);
    self.tableMiddleware.notReuseCell = notReuseCell;
}

- (id<UITableViewDelegate>)originDelegate {
    return self.tableMiddleware.delegate;
}
- (id<KSTableViewDataSource>)originDataSource {
    return self.tableMiddleware.dataSource;
}
#pragma mark- custom func


/// 初始化 一个frame为Zero，样式为 UITableViewStylePlain 的tableView并设置代理
/// @param delegate tableview代理、数据源代理
- (instancetype)initWithDelegate:(id<UITableViewDelegate,KSTableViewDataSource>)delegate {
    return [self initWithFrame:CGRectZero style:UITableViewStylePlain delegate:delegate dataSource:delegate];
}


/// 初始化 一个frame为Zero，样式为 UITableViewStylePlain 的tableView并设置代理
/// @param delegate tableview代理
/// @param dataSource tableView数据源代理
- (instancetype)initWithDelegate:(id<UITableViewDelegate>)delegate dataSource:(id<KSTableViewDataSource>)dataSource {
    return [self initWithFrame:CGRectZero style:UITableViewStylePlain delegate:delegate dataSource:dataSource];
}


/// 初始化 一个frame为Zero的tableView并设置代理
/// @param style tableview样式
/// @param delegate tableview代理
/// @param dataSource tableView数据源代理
- (instancetype)initWithStyle:(UITableViewStyle)style delegate:(id<UITableViewDelegate>)delegate dataSource:(id<KSTableViewDataSource>)dataSource {
    return [self initWithFrame:CGRectZero style:style delegate:delegate dataSource:dataSource];
}


/// 初始化tableView并设置代理
/// @param frame tableView的frame
/// @param style tableview样式
/// @param delegate tableview代理
/// @param dataSource tableView数据源代理
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style delegate:(id<UITableViewDelegate>)delegate dataSource:(id<KSTableViewDataSource>)dataSource {
    self = [self initWithFrame:frame style:style];
    [self bindMiddlewareWithDelegate:delegate dataSource:dataSource];
    return self;
}
/// 绑定代理给middleware同时保留其真实的代理
/// @param delegate 代理对象
/// @param dataSource 数据源代理对象
- (void)bindMiddlewareWithDelegate:(id<UITableViewDelegate>)delegate dataSource:(id<KSTableViewDataSource>)dataSource {
    // 每一个tableview都有一个自己管理的数据源
    self.tableMiddleware = [KSTableMiddleware new];
    self.tableMiddleware.delegate = delegate;
    self.tableMiddleware.dataSource = dataSource;
    self.delegate = self.tableMiddleware;
    self.dataSource = self.tableMiddleware;
    // 项目的分割线线都是由自己去绘制
    self.separatorStyle = UITableViewCellSeparatorStyleNone;
    // 项目使用系统的高度自适应方法
    self.estimatedRowHeight = 44.0;
    self.estimatedSectionHeaderHeight = 22.0;
    self.estimatedSectionFooterHeight = 22.0;
    self.rowHeight = UITableViewAutomaticDimension;
    self.sectionHeaderHeight = UITableViewAutomaticDimension;
    self.sectionFooterHeight = UITableViewAutomaticDimension;
    //调整listView在iOS11上出现返回上一级页面不平滑情况  ai.chen 2017-12-19
    if (@available(iOS 11.0,*)) {
        self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
}


#pragma mark- 数据源操作

/// 添加一个section数据
/// @param sectionData section数据
- (void)addSectionData:(KSListData *)sectionData {
    [self.tableMiddleware addSectionData:sectionData];
}


/// 添加一组数据到最后一个section
/// @param dataArray 要添加的数组
- (void)appendModelsToLastSection:(NSArray<id<KSItemModelProtocol>> *)dataArray {
    KSListData *sectionData = nil;
    if (self.tableMiddleware.count <= 0) {
        sectionData = [KSListData listData];
        [self.tableMiddleware addSectionData:sectionData];
    }else {
       sectionData = [self.tableMiddleware dataOfSection:self.tableMiddleware.count - 1];
    }
    
    if (sectionData == nil) {
        return;
    }
    [sectionData appendModels:dataArray];
}

/// 添加一组数据到最后一个section
/// @param dataArray 要添加的数组
/// @param section 对应的section
- (void)appendModels:(NSArray<id<KSItemModelProtocol>> *)dataArray atSection:(NSInteger)section {
    if (section >= self.tableMiddleware.count || section < 0 || dataArray == nil) {
        return;
    }
    KSListData *sectionData = [self.tableMiddleware dataOfSection:section];
    if (sectionData == nil) {
        return;
    }
    [sectionData appendModels:dataArray];
}

/// 获取一个section的数据
/// @param section section对应的位置
- (nullable KSListData *)dataOfSection:(NSInteger)section {
    if (section >= self.tableMiddleware.count || section < 0) {
        return nil;
    }
    return [self.tableMiddleware dataOfSection:section];
}

/// 获取一条数据model
/// @param indexPath 所在位置
- (nullable id<KSItemModelProtocol>)dataOfIndexPath:(NSIndexPath *)indexPath {
    KSListData *sectionData = [self dataOfSection:indexPath.section];
    return [sectionData modelAtIndex:indexPath.row];
}

/// 插入一个section的数据
/// @param sectionData 要插入的数据
/// @param section 要插入数据的位置
- (void)insertSectionData:(KSListData *)sectionData atSection:(NSInteger)section {
    [self.tableMiddleware insertSectionData:sectionData atSection:section];
}

/// 移除一个section的数据
/// @param sectionData 对应的section数据
- (void)removeSectionData:(KSListData *)sectionData {
    [self.tableMiddleware removeSectionData:sectionData];
}

/// 移除对应的row
/// @param indexPath row所在的IndexPath
- (void)removeRowAtIndexPath:(NSIndexPath *)indexPath {
    KSListData *sectionData = [self dataOfSection:indexPath.section];
    if (sectionData && sectionData.count > indexPath.row) {
        [sectionData removeModelAtIndex:indexPath.row];
    }
}

/// 获取section所在的位置 找不到返回NSNotFound
/// @param sectionData section的数据源
- (NSInteger)indexOfSection:(KSListData *)sectionData {
    return [self.tableMiddleware indexOfSection:sectionData];
}
/// 获取列表section的数目
- (NSInteger)sectionsCount {
    return self.tableMiddleware.count;
}

/// 清空所有数据源
- (void)clear {
    [self.tableMiddleware removeAllSections];
}
@end
