//
//  FYFTableViewController.m
//  FYFTableCollectionMiddleWare
//
//  Created by kingstar on 2021/8/17.
//

#import "FYFTableViewController.h"

#import <Masonry/Masonry.h>

#import "FYFTableModel.h"
#import "FYFTableViewCell.h"

@interface FYFTableViewController ()<UITableViewDelegate,FYFTableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation FYFTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain delegate:self dataSource:self];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsZero);
    }];
    
    NSArray *texts = @[@"测试文本测试文本",@"测试文本测试文本测试文本测试文本",@"测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本",@"测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本",@"测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本",@"测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本",@"测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本",@"测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本",@"helloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworld"];
    NSMutableArray *dataSource = [[NSMutableArray alloc] initWithCapacity:texts.count];

    for (int i = 0; i < texts.count; i++) {
        FYFTableModel *model = [[FYFTableModel alloc] init];
        model.text = [NSString stringWithFormat:@"%@:%d",texts[i],i];
        [dataSource addObject:model];
    }
    
    FYFListData *listData = [FYFListData listData];
    [listData appendModels:[dataSource copy]];
    
    [self.tableView addSectionData:listData];
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
