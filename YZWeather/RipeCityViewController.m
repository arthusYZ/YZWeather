//
//  RipeCityViewController.m
//  YZWeather
//
//  Created by 杨舟 on 15/12/1.
//  Copyright © 2015年 Yang. All rights reserved.
//

#import "RipeCityViewController.h"
#import "MySearchBar.h"
#import "CityListCell.h"
#import "CityDetailCell.h"
#import "CityManageViewController.h"

@interface RipeCityViewController ()<UISearchBarDelegate,UISearchDisplayDelegate>

@property (nonatomic ,strong ) UISearchDisplayController *search;

@property (nonatomic ,strong ) NSMutableArray *ripeCityArray;

@property (nonatomic ,strong ) NSArray *allCitys;

@property (nonatomic ,strong ) NSMutableArray *results;

@property (nonatomic ,weak ) UISearchBar *searchbar;

@end

@implementation RipeCityViewController

- (NSMutableArray *)ripeCityArray
{
    if (!_ripeCityArray) {
        _ripeCityArray = [NSMutableArray array];
    }
    return _ripeCityArray;
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
    
    
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    
    [self setupnav];
    
    
    [self setupRipeCitys];
    
    [self setupHeader];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupnav
{
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"back_normal"] forState:UIControlStateNormal];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"back_hilight"] forState:UIControlStateHighlighted];
    [backBtn addTarget:self action:@selector(popClick) forControlEvents:UIControlEventTouchUpInside];
    backBtn.frame = CGRectMake(0, 0, 25, 25);
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    
    if (_viewtype == citylist) {
        if (_country == inland) {
            self.title = @"省份";
        }else if (_country == foreign){
            self.title = @"国家";
        }
    }
}

- (void)setupHeader
{
    MySearchBar *searchBar = [[MySearchBar alloc] init];
    searchBar.backgroundColor = [UIColor whiteColor];
    [searchBar sizeToFit];
    searchBar.frame = CGRectMake(0, 64, screenSize.width, 50);
    searchBar.placeholder = @"搜索城市（中文/拼音）";
//    [[UIApplication sharedApplication].keyWindow addSubview:searchBar];
    self.searchbar = searchBar;
    
    
//    self.tableView.tableHeaderView = searchBar;
//    self.tableView.tableHeaderView.backgroundColor = [UIColor clearColor];

    
    UISearchDisplayController *searchController = [[UISearchDisplayController alloc] initWithSearchBar:searchBar contentsController:self];
    searchController.delegate = self;
    searchController.searchResultsDataSource = self;
    searchController.searchResultsDelegate = self;
    self.search = searchController;
    
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"allcitys.plist" ofType:nil];
    self.allCitys = [NSArray arrayWithContentsOfFile:path];
}

- (void)setupRipeCitys
{
    NSDictionary *ripecitydict = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"ripecity.plist" ofType:nil]];
    NSDictionary *ripeinternatcity = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"ripeinternatcity.plist" ofType:nil]];
    if (_viewtype == citylist) {
        if (_country == inland) {
            
            NSArray *provinceArray = [ripecitydict allKeys];
            [self.ripeCityArray addObject:@"国际.国外"];
            [self.ripeCityArray addObjectsFromArray:provinceArray];
        }else{
            NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"ripecountry.plist" ofType:nil]];
            [self.ripeCityArray addObjectsFromArray:array];
        }
    }else{
        if (_country == inland) {
            NSArray *provinceArray = [ripecitydict allKeys];
            NSString *key;
            for (NSString *str in provinceArray) {
                if ([str containsString:self.title]) {
                    key = str;
                }
            }
            NSArray *ripecityArray = [ripecitydict valueForKey:key];
            [self.ripeCityArray addObjectsFromArray:ripecityArray];
        }else{
            NSArray *array = [ripeinternatcity allKeys];
            NSString *key;
            for (NSString *str in array) {
                if ([str containsString:self.title]) {
                    key = str;
                }
            }
            NSArray *ripeinternatcityArray = [ripeinternatcity valueForKey:key];
            [self.ripeCityArray addObjectsFromArray:ripeinternatcityArray];
        }
    }
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if ([tableView isKindOfClass:[_search.searchResultsTableView class]]) {
        return self.results.count;
    }else{
    return self.ripeCityArray.count;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([tableView isKindOfClass:[_search.searchResultsTableView class]]) {
        static NSString *ID = @"result";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        }
        NSRange range = [_results[indexPath.row] rangeOfString:@"#"];
        cell.textLabel.text = [_results[indexPath.row] substringToIndex:range.location];
        
        return cell;
    }else{
        if (_viewtype == citylist) {
            CityListCell *cell = [CityListCell cellWithTableView:tableView];
            NSString *text = self.ripeCityArray[indexPath.row];
            NSString *name = text;
            if (!(_country == inland && indexPath.row == 0)) {
                NSRange range = [text rangeOfString:@"#"];
                name = [text substringToIndex:range.location];
            }
            cell.textLabel.text = name;
            return cell;
        }else{
            CityDetailCell *cell = [CityDetailCell cellWithTableView:tableView];
            NSArray *array = self.ripeCityArray[indexPath.row];
            NSString *text = array[1];
            NSRange range = [text rangeOfString:@"#"];
            NSString *name = [text substringToIndex:range.location];
            cell.textLabel.text = name;
            return cell;
        }
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (tableView == _search.searchResultsTableView) {
        UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
        CityManageViewController *vc = self.navigationController.childViewControllers[0];
        vc.pop(cell.textLabel.text);
        [self.navigationController popToViewController:vc animated:YES];
    }else{
        if (_viewtype == citylist) {
            RipeCityViewController *vc = [[RipeCityViewController alloc] init];
            if (indexPath.row == 0 && _country == inland) {
                vc.viewtype = citylist;
                vc.country = foreign;
                vc.title = @"国家";
            }else{
                vc.viewtype = citydetail;
                vc.country = _country;
                NSString *title = [tableView cellForRowAtIndexPath:indexPath].textLabel.text;
                vc.title = title;
            }
            [self.navigationController pushViewController:vc animated:YES];
        }else{
            UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
            CityManageViewController *vc = self.navigationController.childViewControllers[0];
            vc.pop(cell.textLabel.text);
            [self.navigationController popToViewController:vc animated:YES];
        }
    }
}



- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if ([tableView isKindOfClass:[_search.searchResultsTableView class]]) {
        return nil;
    }else{
    
        return self.searchbar;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if ([tableView isKindOfClass:[_search.searchResultsTableView class]]) {
        return 0;
    }else{
    
        return 50;
    }
}

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    
    self.search.active = YES;
    return YES;
}


- (void) searchDisplayControllerDidEndSearch:(UISearchDisplayController *)controller
{
//    [self tableView:self.tableView viewForHeaderInSection:0];
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationNone];
}



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

- (void)popClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

////去掉UItableview headerview黏性(sticky)
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
////    CGFloat sectionHeaderHeight = 50;
////    if (scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
////        scrollView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
////    } else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
////        scrollView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
////    }
//    CGRect searchBarFrame = self.searchbar.frame;
//    searchBarFrame.origin.y = 64 + scrollView.contentOffset.y;
//    self.tableView.tableHeaderView.frame = searchBarFrame;
//    CGRect headerviewFrame = self.tableView.tableHeaderView.frame;
//}

@end
