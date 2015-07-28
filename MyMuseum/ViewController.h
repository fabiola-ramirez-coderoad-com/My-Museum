//
//  ViewController.h
//  MyMuseum
//
//  Created by Fabiola Ramirez on 7/28/15.
//  Copyright (c) 2015 Fabiola Ramirez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <EstimoteSDK/EstimoteSDK.h>
#import "beacon1ViewController1.h"
#import "beacon1TableViewController3.h"
#import "beacon2ViewController2.h"
#import "beacon3ViewController3.h"


@interface ViewController : UIViewController


- (id)initWithBeacon:(CLBeacon *)beacon;

@end

