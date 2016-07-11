//
//  MainViewController.m
//  侧滑
//
//  Created by GG on 16/7/1.
//  Copyright © 2016年 GG. All rights reserved.
//

#import "MainViewController.h"
#import "SlideMenuManager.h"
@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:[SlideMenuManager shareManager] action:@selector(pressTheSwitchOfMenu)];
    
    self.view.backgroundColor = [UIColor redColor];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
}

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
