//
//  DKWallUserViewController.m
//  VKWallPoster
//
//  Created by Дмитрий on 23.09.16.
//  Copyright © 2016 Dmitry Kuchin. All rights reserved.
//

#import "DKWallUserViewController.h"
#import "DKWallUserCell.h"
#import "DKAccessToken.h"
#import <VKSdk.h>

NSString *const WALL_PATH = @"wall.get";
NSString *const kRESPONSE = @"response";

@interface DKWallUserViewController () <UITableViewDelegate, UITableViewDataSource>
@property(weak, nonatomic)IBOutlet UITableView *tableView;
@property(strong, nonatomic)NSArray *arrayPosts;
@end

@implementation DKWallUserViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureWallUserViewController];
}

#pragma mark - Initional Methods

-(void)configureWallUserViewController {
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    NSString *nibName = NSStringFromClass([DKWallUserCell class]);
    [self.tableView registerNib:[UINib nibWithNibName:nibName bundle:nil] forCellReuseIdentifier:nibName];
    
    NSDictionary *parameters = @{@"count": @(10),
                                 @"access_token" : [DKAccessToken currentAccessToken].tokenString,
                                 @"v" : @"5.53"};
    
    VKRequest *posts = [VKRequest requestWithMethod:WALL_PATH parameters:parameters];
    
    [posts executeWithResultBlock:^(VKResponse * response) {
        NSLog(@"Json result: %@", response.responseString);
    } errorBlock:^(NSError * error) {
        if (error.code != VK_API_ERROR) {
            [error.vkError.request repeat];
        }
        else {
            NSLog(@"VK error: %@", error);
        }
    }];
}

#pragma mark - UITableViewDelegate

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [UITableViewCell new];
}

#pragma mark - Other

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
