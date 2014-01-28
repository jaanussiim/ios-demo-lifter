/*
 * Copyright 2014 JaanusSiim
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#import <MapKit/MapKit.h>
#import "ViewController.h"
#import "LiftedAnnotation.h"
#import "LiftingAnnotationView.h"

@interface ViewController () <MKMapViewDelegate>

@property (nonatomic, strong) IBOutlet MKMapView *mapView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    CLLocationCoordinate2D london = CLLocationCoordinate2DMake(51.507222, -0.1275);
    [self.mapView setCenterCoordinate:london animated:YES];

    LiftedAnnotation *annotation = [[LiftedAnnotation alloc] init];
    [annotation setCoordinate:london];
    [self.mapView addAnnotation:annotation];
}


- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    LiftingAnnotationView *annotationView = (LiftingAnnotationView *) [mapView dequeueReusableAnnotationViewWithIdentifier:@"identifier"];
    if (!annotationView) {
        UIImage *pin = [UIImage imageNamed:@"Pin"];
        annotationView = [[LiftingAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"identifier" image:pin];
    }

    return annotationView;
}

@end
