//
//  XDSDemoViewController.m
//  XDSDropDownMenu
//
//  Created by cdj on 2018/6/9.
//  Copyright © 2018年 itiis. All rights reserved.
//

#import "XDSStartViewController.h"

#import "XDSViewController.h"

#import "XDSTableViewController.h"

@interface XDSStartViewController ()

@end

@implementation XDSStartViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   
    //普通UIView
    if (indexPath.section == 0) {
        
        XDSViewController *vc = [[XDSViewController alloc] init];
        
        [self presentViewController:vc animated:YES completion:nil];
    }
    
    //UITableView
    else if (indexPath.section == 1){
        
        UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"XDSTableViewController" bundle:nil];
        
        XDSTableViewController *vc = [storyBoard instantiateInitialViewController];
        
        [self presentViewController:vc animated:YES completion:nil];
        
    }

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
