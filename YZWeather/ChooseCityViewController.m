//
//  ChooseCityViewController.m
//  YZWeather
//
//  Created by 杨舟 on 15/11/25.
//  Copyright © 2015年 Yang. All rights reserved.
//

#import "ChooseCityViewController.h"
#import "MySearchBar.h"
#import "CitysCell.h"
#import "MJExtension.h"
#import "HotCity.h"
#import "CityManageViewController.h"
#import "WeatherDataCacheTool.h"
#import "HUDTool.h"
#import "RipeCityViewController.h"

@interface ChooseCityViewController ()<UISearchBarDelegate,UISearchDisplayDelegate>

@property (nonatomic ,strong ) UISearchDisplayController *search;

@property (nonatomic ,strong ) NSMutableArray *hotArray;

@property (nonatomic ,strong ) NSArray *allCitys;

@property (nonatomic ,strong ) NSMutableArray *results;

@property (nonatomic ,weak ) UISearchBar *searchbar;

@end

@implementation ChooseCityViewController

- (NSMutableArray *)hotArray
{
    if (!_hotArray) {
        _hotArray = [NSMutableArray array];
    }
    return _hotArray;
}

- (NSMutableArray *)results
{
    if (!_results) {
        _results = [NSMutableArray array];
    }
    return _results;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.backgroundColor = RGBA(237, 237, 237, 1);
    
    [self setupHotCityArray];
    
    
    
    [self setupNav];
    
    [self setupHeader];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 界面初始化
- (void)setupNav
{
    self.title = @"选择城市（国内）";
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"back_normal"] forState:UIControlStateNormal];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"back_hilight"] forState:UIControlStateHighlighted];
    [backBtn addTarget:self action:@selector(popClick) forControlEvents:UIControlEventTouchUpInside];
    backBtn.frame = CGRectMake(0, 0, 25, 25);
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    
}

- (void)setupHeader
{
    MySearchBar *searchBar = [[MySearchBar alloc] init];
    searchBar.backgroundColor = [UIColor clearColor];
    [searchBar sizeToFit];
    searchBar.placeholder = @"搜索城市（中文/拼音）";
    self.searchbar = searchBar;
    
    self.tableView.tableHeaderView = searchBar;
    self.tableView.tableHeaderView.backgroundColor = [UIColor clearColor];
    
    UISearchDisplayController *searchController = [[UISearchDisplayController alloc] initWithSearchBar:searchBar contentsController:self];
    searchController.delegate = self;
    searchController.searchResultsDataSource = self;
    searchController.searchResultsDelegate = self;
    self.search = searchController;
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"allcitys.plist" ofType:nil];
    self.allCitys = [NSArray arrayWithContentsOfFile:path];
}

- (void)setupHotCityArray
{
    NSString *pathString1 = [[NSBundle mainBundle] pathForResource:@"hotCity.plist" ofType:nil];
    NSArray *hotArray1 = [[NSArray alloc] initWithContentsOfFile:pathString1];
    NSArray *hotCityArray1 = [HotCity mj_objectArrayWithKeyValuesArray:hotArray1];
    
    NSString *pathString2 = [[NSBundle mainBundle] pathForResource:@"hotScenery.plist" ofType:nil];
    NSArray *hotArray2 = [[NSArray alloc] initWithContentsOfFile:pathString2];
    NSArray *hotCityArray2 = [HotCity mj_objectArrayWithKeyValuesArray:hotArray2];
    
    [self.hotArray addObject:hotCityArray1];
    [self.hotArray addObject:hotCityArray2];
}

#pragma mark 界面跳转
- (void)popClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    return 2;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == _search.searchResultsTableView) {
        return _results.count;
    }else{
    return _hotArray.count;
    }
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == _search.searchResultsTableView) {
        static NSString *ID = @"result";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        }
        NSRange range = [_results[indexPath.row] rangeOfString:@"#"];
        cell.textLabel.text = [_results[indexPath.row] substringToIndex:range.location];
        
        return cell;
    }else{
        CitysCell *cell = [CitysCell cellWithTableView:tableView];
        
        cell.titleText = @"热门城市";
        if (indexPath.row == 2) {
            cell.titleText = @"热门景点";
        }
        cell.hotCityArray = _hotArray[indexPath.row];
        __weak typeof(self) weakself = self;
        cell.cityBtnPressed = ^(NSString *cityName){
            NSArray *citys = [WeatherDataCacheTool loadAllCitys];
            if ([citys containsObject:cityName]) {
                [HUDTool showTextOnly:[NSString stringWithFormat:@"您已经添加过%@",cityName] configParameter:^(HUDTool *config) {
                    config.margin = 20.f;
                    config.opacity = 0.7f;
                    config.cornerRadius = 10.f;
                    config.textFont = [UIFont systemFontOfSize:14];
                } duration:1.f inView:[UIApplication sharedApplication].keyWindow];
            }else{
            CityManageViewController *vc = weakself.navigationController.childViewControllers[0];
            vc.pop(cityName);
            [weakself.navigationController popToViewController:vc animated:YES];
            }
        };
        cell.moreBtnPressed = ^(NSString *cellTitle){
            RipeCityViewController *vc = [[RipeCityViewController alloc] init];
            vc.viewtype = citylist;
            vc.country = inland;
            vc.title = @"省份";
            [weakself.navigationController pushViewController:vc animated:YES];
        };
        
        return cell;
    }
}

- (CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == _search.searchResultsTableView) {
        return 40;
    }else{
    UITableViewCell *cell = [self tableView:self.tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
    }
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    [self tableView:tableView didDeselectRowAtIndexPath:indexPath];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (tableView == _search.searchResultsTableView) {
        UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
        CityManageViewController *vc = self.navigationController.childViewControllers[0];
        vc.pop(cell.textLabel.text);
        [self.navigationController popToViewController:vc animated:YES];
    }
}


- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    
    self.search.active = YES;
    return YES;
}

//- (void)searchDisplayControllerDidBeginSearch:(UISearchDisplayController *)controller
//{
////    UIButton *cancelButton;
////    
////    UIView *topView = controller.searchBar.subviews[0];
////    
////    for (UIView *subView in topView.subviews) {
////        
////        if ([subView isKindOfClass:NSClassFromString(@"UINavigationButton")]) {
////            
////            cancelButton = (UIButton*)subView;
////            
////            cancelButton.titleLabel.textColor = RGBA(90, 150, 250, 1);
////            
////        }
////        
////    }
//}


- (BOOL)searchDisplayController:(UISearchDisplayController *)controller

shouldReloadTableForSearchString:(NSString *)searchString

{
    //一旦SearchBar輸入內容有變化，則執行這個方法，詢問要不要重裝searchResultTableView的數據
    
    // Return YES to cause the search result table view to be reloaded.
    
    [self filterContentForSearchText:searchString
                               scope:[_searchbar scopeButtonTitles][_searchbar.selectedScopeButtonIndex]];
    
    return YES;
}


- (BOOL)searchDisplayController:(UISearchDisplayController *)controller

shouldReloadTableForSearchScope:(NSInteger)searchOption

{
    //如果设置了选项，当Scope Button选项有變化的时候，則執行這個方法，詢問要不要重裝searchResultTableView的數據
    
    // Return YES to cause the search result table view to be reloaded.
    
    [self filterContentForSearchText:_searchbar.text
                               scope:_searchbar.scopeButtonTitles[searchOption]];
    
    return YES;
}

//源字符串内容是否包含或等于要搜索的字符串内容
-(void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    NSMutableArray *tempResults = [NSMutableArray array];
    NSUInteger searchOptions = NSCaseInsensitiveSearch | NSDiacriticInsensitiveSearch;
    
    
    for (NSString *cityname in _allCitys) {
        NSRange storeRange = NSMakeRange(0, cityname.length);
        NSRange foundRange = [cityname rangeOfString:searchText options:searchOptions range:storeRange];
        if (foundRange.length) {
            [tempResults addObject:cityname];
        }
    }
    
    [self.results removeAllObjects];
    [self.results addObjectsFromArray:tempResults];
}

@end
