//
//  beacon3ViewController3.m
//  MyMuseum
//
//  Created by Fabiola Ramirez on 7/28/15.
//  Copyright (c) 2015 Fabiola Ramirez. All rights reserved.
//

#import "beacon3ViewController3.h"

@interface beacon3ViewController3 ()

- (IBAction)salir:(id)sender;


@end

@implementation beacon3ViewController3

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor colorWithRed:(52/255.0) green:(152/255.0) blue:(219/255.0) alpha:1]];
    
    
    UINavigationBar *navigationBar = self.navigationController.navigationBar;
    [navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [navigationBar setShadowImage:[UIImage new]];
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

- (IBAction)salir:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];     
}
@end
