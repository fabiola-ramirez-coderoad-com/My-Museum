//
//  beacon1ViewController1.m
//  MyMuseum
//
//  Created by Fabiola Ramirez on 7/28/15.
//  Copyright (c) 2015 Fabiola Ramirez. All rights reserved.
//

#import "beacon1ViewController1.h"

@interface beacon1ViewController1 ()
- (IBAction)salir:(id)sender;
- (IBAction)salir1:(id)sender;

- (IBAction)touch:(id)sender;
@end



@implementation beacon1ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //[self.view setBackgroundColor:[UIColor colorWithRed:(142/255.0) green:(68/255.0) blue:(173/255.0) alpha:1]];
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



- (IBAction)salir1:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
