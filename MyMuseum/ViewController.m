//
//  ViewController.m
//  MyMuseum
//
//  Created by Fabiola Ramirez on 7/28/15.
//  Copyright (c) 2015 Fabiola Ramirez. All rights reserved.
//

#import "ViewController.h"
#define BEACON_1UUID @"B9407F30-F5F8-466E-AFF9-25556B57FE6D"
#define BEACON_1MAJOR 51134
#define BEACON_1MINOR 6459

#define BEACON_2_UUID @"B9407F30-F5F8-466E-AFF9-25556B57FE6D"
#define BEACON_2_MAJOR 21580
#define BEACON_2_MINOR 50459


#define BEACON_3_UUID @"B9407F30-F5F8-466E-AFF9-25556B57FE6D"
#define BEACON_3_MAJOR 3144
#define BEACON_3_MINOR 41160

BOOL isBeaconWithUUIDMajorMinor(CLBeacon *beacon, NSString *UUIDString, CLBeaconMajorValue major, CLBeaconMinorValue minor) {
    return [beacon.proximityUUID.UUIDString isEqualToString:UUIDString] && beacon.major.unsignedShortValue == major && beacon.minor.unsignedShortValue == minor;
}

@interface ViewController () <ESTBeaconManagerDelegate>


@property (nonatomic, strong) CLBeacon *beacon;
@property (nonatomic, strong) ESTBeaconManager *beaconManager;
@property (nonatomic) CLBeaconRegion *beaconRegion;
@property (nonatomic) CLBeaconRegion *beaconRegion2;
@property (nonatomic) CLBeaconRegion *beaconRegion3;




@end

@implementation ViewController

- (id)initWithBeacon:(CLBeacon *)beacon
{
    self = [super init];
    if (self)
    {
        self.beacon = beacon;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    self.beaconManager = [[ESTBeaconManager alloc] init];
    self.beaconManager.delegate = self;
    
    [self.beaconManager requestAlwaysAuthorization];
    //[self.beaconManager requestWhenInUseAuthorization];
    self.beaconRegion = [[CLBeaconRegion alloc] initWithProximityUUID:[[NSUUID alloc] initWithUUIDString:BEACON_1UUID] major:BEACON_1MAJOR minor:BEACON_1MINOR identifier:@"beaconRegion1"];
    
    self.beaconRegion2 = [[CLBeaconRegion alloc] initWithProximityUUID:[[NSUUID alloc] initWithUUIDString:BEACON_2_UUID] major:BEACON_2_MAJOR minor:BEACON_2_MINOR identifier:@"beaconRegion2"];
    
    self.beaconRegion3 = [[CLBeaconRegion alloc] initWithProximityUUID:[[NSUUID alloc] initWithUUIDString:BEACON_3_UUID] major:BEACON_3_MAJOR minor:BEACON_3_MINOR identifier:@"beaconRegion3"];
    
    [self.beaconManager startMonitoringForRegion:self.beaconRegion];
    
    
    
}


- (void)viewWillAppear:(BOOL)animated {
    
    NSLog(@"viewWillAppear");
    
    [self.beaconManager startRangingBeaconsInRegion:self.beaconRegion];
    [self.beaconManager startRangingBeaconsInRegion:self.beaconRegion2];
    [self.beaconManager startRangingBeaconsInRegion:self.beaconRegion3];

}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    

        //[self startRangingBeacons];
   
}


- (void)viewDidDisappear:(BOOL)animated
{
    
    NSLog(@"viewDidDisappear");
    [self.beaconManager stopRangingBeaconsInRegion:self.beaconRegion];
    [self.beaconManager stopRangingBeaconsInRegion:self.beaconRegion2];
    [self.beaconManager stopRangingBeaconsInRegion:self.beaconRegion3];
    [super viewDidDisappear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - ESTBeaconManager delegate

- (void)beaconManager:(id)manager didRangeBeacons:(NSArray *)beacons inRegion:(CLBeaconRegion *)region
{
    
    NSLog(@"didRangeBeacons");
    if (beacons.count > 0)
    {
        CLBeacon *firstBeacon = [beacons firstObject];
        
        
        
        
        if (firstBeacon) {
            if (isBeaconWithUUIDMajorMinor(firstBeacon, BEACON_1UUID, BEACON_1MAJOR, BEACON_1MINOR)) {
                
                
                // beacon #1
                //self.titleLabel.text     = [self textForProximity:firstBeacon.proximity];
                if ([[self textForProximity:firstBeacon.proximity]isEqualToString:@"Far"]) {
                    
                    
                    beacon1ViewController1 *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"beacon1ViewController1x"];
                    
                    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
                    
                    [self presentViewController:navigationController animated:YES completion:nil];
                    
                    [self.beaconManager stopRangingBeaconsInRegion:self.beaconRegion];
                    
                }
                if ([[self textForProximity:firstBeacon.proximity]isEqualToString:@"Near"]) {
                    
        
                    
                    beacon1TableViewController3 *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"beacon1TableViewController3x"];
                    
                    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
                    
                    [self presentViewController:navigationController animated:YES completion:nil];
                    
                    [self.beaconManager stopRangingBeaconsInRegion:self.beaconRegion];
                    
                }
                
                if ([[self textForProximity:firstBeacon.proximity]isEqualToString:@"Immediate"]) {
                    
                    NSLog(@"entrandooo!!");
                    
                    beacon1TableViewController3 *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"beacon1TableViewController3x"];
                    
                    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
                    
                    [self presentViewController:navigationController animated:YES completion:nil];
                    
                    [self.beaconManager stopRangingBeaconsInRegion:self.beaconRegion];
                    
                }
                
            } else if (isBeaconWithUUIDMajorMinor(firstBeacon, BEACON_2_UUID, BEACON_2_MAJOR, BEACON_2_MINOR)) {
                // beacon #2
                if ([[self textForProximity:firstBeacon.proximity]isEqualToString:@"Near"]) {
                    
                    NSLog(@"entrandooo!!");
                    
                    beacon2ViewController2 *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"beacon2ViewController2x"];
                    
                    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
                    
                    [self presentViewController:navigationController animated:YES completion:nil];
                    
                    [self.beaconManager stopRangingBeaconsInRegion:self.beaconRegion];
                    
                }
                
                if ([[self textForProximity:firstBeacon.proximity]isEqualToString:@"Immediate"]) {
                    
                    NSLog(@"entrandooo!!");
                    
                    beacon2ViewController2 *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"beacon2ViewController2x"];
                    
                    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
                    
                    [self presentViewController:navigationController animated:YES completion:nil];
                    
                    [self.beaconManager stopRangingBeaconsInRegion:self.beaconRegion];
                    
                }
                if ([[self textForProximity:firstBeacon.proximity]isEqualToString:@"Far"]) {
                    
                    
                    beacon1ViewController1 *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"beacon1ViewController1x"];
                    
                    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
                    
                    [self presentViewController:navigationController animated:YES completion:nil];
                    
                    [self.beaconManager stopRangingBeaconsInRegion:self.beaconRegion];
                    
                }
            }
            else if (isBeaconWithUUIDMajorMinor(firstBeacon, BEACON_3_UUID, BEACON_3_MAJOR, BEACON_3_MINOR)) {
                // beacon #3
                
                if ([[self textForProximity:firstBeacon.proximity]isEqualToString:@"Near"]) {
                    
                    NSLog(@"entrandooo!!");
                    
                    beacon3ViewController3 *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"beacon3ViewController3x"];
                    
                    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
                    
                    [self presentViewController:navigationController animated:YES completion:nil];
                    
                    [self.beaconManager stopRangingBeaconsInRegion:self.beaconRegion];
                    
                }
                
                if ([[self textForProximity:firstBeacon.proximity]isEqualToString:@"Immediate"]) {
                    
                    NSLog(@"entrandooo!!");
                    
                    beacon3ViewController3 *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"beacon3ViewController3x"];
                    
                    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
                    
                    [self presentViewController:navigationController animated:YES completion:nil];
                    
                    [self.beaconManager stopRangingBeaconsInRegion:self.beaconRegion];
                    
                }
                if ([[self textForProximity:firstBeacon.proximity]isEqualToString:@"Far"]) {
                    
                    
                    beacon1ViewController1 *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"beacon1ViewController1x"];
                    
                    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
                    
                    [self presentViewController:navigationController animated:YES completion:nil];
                    
                    [self.beaconManager stopRangingBeaconsInRegion:self.beaconRegion];
                    
                }
            }
        }else {
            // no beacons found
            NSLog(@"There are no beacons nearby");
            
        }
        
        
        
       
    }
}

#pragma mark -

- (NSString *)textForProximity:(CLProximity)proximity
{
    switch (proximity) {
        case CLProximityFar:
            return @"Far";
            break;
        case CLProximityNear:
            return @"Near";
            break;
        case CLProximityImmediate:
            return @"Immediate";
            break;
            
        default:
            return @"Unknown";
            break;
    }
}

#pragma mark - ESTBeaconManager delegate

- (void)beaconManager:(id)manager monitoringDidFailForRegion:(CLBeaconRegion *)region withError:(NSError *)error
{
    UIAlertView* errorView = [[UIAlertView alloc] initWithTitle:@"Monitoring error"
                                                        message:error.localizedDescription
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
    
    [errorView show];
}

-(void)startRangingBeacons
{
    if ([ESTBeaconManager authorizationStatus] == kCLAuthorizationStatusNotDetermined)
    {
        [self.beaconManager requestAlwaysAuthorization];
        [self.beaconManager startRangingBeaconsInRegion:self.beaconRegion];
    }
    else if([ESTBeaconManager authorizationStatus] == kCLAuthorizationStatusAuthorized)
    {
        [self.beaconManager startRangingBeaconsInRegion:self.beaconRegion];
    }
    else if([ESTBeaconManager authorizationStatus] == kCLAuthorizationStatusDenied)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Location Access Denied"
                                                        message:@"You have denied access to location services. Change this in app settings."
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles: nil];
        
        [alert show];
    }
    else if([ESTBeaconManager authorizationStatus] == kCLAuthorizationStatusRestricted)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Location Not Available"
                                                        message:@"You have no access to location services."
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles: nil];
        
        [alert show];
    }
}


@end
