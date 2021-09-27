//
//  FYFCollectionViewController.m
//  FYFTableCollectionMiddleWare
//
//  Created by kingstar on 2021/8/17.
//

#import "FYFCollectionViewController.h"
#import "Masonry.h"
#import "FYFListData.h"
#import "UICollectionView+Middleware.h"
#import "FYFCollectionModel.h"

#define KPadding 15

#define KLineSpacing 5
#define KInteritemSpacing 5

#define KItemWith ([UIScreen mainScreen].bounds.size.width - KInteritemSpacing - 2* KPadding)/2
#define KItemHeight 100


@interface FYFCollectionViewController ()
<UICollectionViewDelegate,
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView * collectionView;

@end

@implementation FYFCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(KItemWith, KItemHeight);
    flowLayout.minimumLineSpacing = KLineSpacing;
    flowLayout.minimumInteritemSpacing = KInteritemSpacing;
    flowLayout.sectionInset = UIEdgeInsetsZero;
    
    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:flowLayout delegate:self dataSource:self];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsZero);
    }];

    NSArray *texts = @[@"测试文本测试文本",@"测试文本测试文本测试文本测试文本",@"测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本",@"测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本",@"测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本",@"测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本",@"测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本",@"测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本",@"helloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworld"];
    NSMutableArray *dataSource = [[NSMutableArray alloc] initWithCapacity:texts.count];

    for (int i = 0; i < texts.count; i++) {
        FYFCollectionModel *model = [[FYFCollectionModel alloc] init];
        model.text = [NSString stringWithFormat:@"%@:%d",texts[i],i];
        [dataSource addObject:model];
    }
    
    FYFListData *listData = [FYFListData listData];
    [listData appendModels:[dataSource copy]];
    
    [self.collectionView addSectionData:listData];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
