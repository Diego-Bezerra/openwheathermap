//
//  CityListViewController.m
//  OpenWeatherMap
//
//  Created by Diego Bezerra Souza on 01/07/17.
//  Copyright © 2017 Diego Bezerra Souza. All rights reserved.
//

#import "CityListViewController.h"
#import "WeatherService.h"
#import "CityVO.h"
#import "OpenWeatherMap-Swift.h"

@interface CityListViewController () <UITableViewDelegate, UITableViewDataSource>
    @property (weak, nonatomic) IBOutlet UITableView *cityTable;
    @property (weak, nonatomic) IBOutlet UILabel *noCitiesLabel;
    @property (nonatomic) double latitude;
    @property (nonatomic) double longitude;
    @property (nonatomic, strong) NSArray<CityVO*>* cityList;
@end

@implementation CityListViewController

static NSString* const cellIdent = @"cell";
    
-(CityListViewController*) initWithLatitude:(double) latitude andLongitude:(double) longitude {
    self = [super init];
    if (self) {
        self.latitude = latitude;
        self.longitude = longitude;
    }
    return self;
}
    
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = NSLocalizedString(@"CITY_LIST_TITLE", "");
    self.noCitiesLabel.text = NSLocalizedString(@"COULD_NOT_SHOW_CITIES", "");
    [self.cityTable registerClass:UITableViewCell.class forCellReuseIdentifier:cellIdent];
    [self showNoCitiesMessage:NO];
    [self getWeatherData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

-(void) showNoCitiesMessage:(BOOL) show {
    self.noCitiesLabel.hidden = !show;
    self.cityTable.hidden = show;
}
    
-(void) getWeatherData {
    WeatherService* ws = [[WeatherService alloc] init];
    __weak CityListViewController* weakSelf = self;
    [ws getWeatherDataWithLatitude:_latitude longitude:_longitude andCallback:^(WeatherResponse *weatherResponse, NSError *error) {
        if (error) {
            [weakSelf showNoCitiesMessage:YES];
        } else {
            weakSelf.cityList = weatherResponse.list;
            [weakSelf.cityTable reloadData];
        }
    }];
}
    
    -(void) openWeatherDatailViewController:(CityVO*) city {
    WeatherDetailsViewController* wdVC = [[WeatherDetailsViewController alloc] initWithCity:city];
    [self.navigationController pushViewController:wdVC animated:YES];
}
    
#pragma mark UITableViewDelegate
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    CityVO* city = self.cityList[indexPath.row];
    [self openWeatherDatailViewController:city];
}
    
#pragma mark UITableViewDataSource
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdent forIndexPath:indexPath];
    if (cell) {
        CityVO* city = self.cityList[indexPath.row];
        cell.textLabel.text = city.name;
        [cell.textLabel.font fontWithSize:15];
    }
    return cell;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cityList.count;
}
    
@end
