//
//  CoreLocation_DataAppDelegate.m
//  CoreLocation Data
//
//  Created by Martin Brandenburg on 1/31/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "CoreLocation_DataAppDelegate.h"

@implementation CoreLocation_DataAppDelegate

@synthesize window;
@synthesize coordinateField;
@synthesize altitudeField;
@synthesize horizontalAccuracyField;
@synthesize verticalAccuracyField;
@synthesize timestampField;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	// Insert code here to initialize your application 
	clManager = [[CLLocationManager alloc] init];

	if ([clManager locationServicesEnabled] == NO) {
		NSLog(@"Location Services are disabled.");
	} else {
		NSLog(@"Location Services are enabled.");
	}
	[clManager setDelegate:self];
	[clManager startUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
	NSLog(@"Got error: %s", [error localizedDescription]);
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
	NSLog(@"Got update: %s", [newLocation description]);
	
	[self updateData:newLocation];
}

- (IBAction)refresh:(id)sender {
	[self updateData:[clManager location]];
}

- (void)updateData:(CLLocation*)location {
	CLLocationCoordinate2D coordinate = [location coordinate];
	CLLocationDistance altitude = [location altitude];
	NSDate *ts = [location timestamp];
	
	NSString *altitudeFormat;
	NSString *tsString;
	
	if (altitude != 1.0) {
		altitudeFormat = @"%f meters";
	} else {
		altitudeFormat = @"%f meter";
	}
	
	if (ts == nil) {
		tsString = @"No timestamp returned.";
	} else {
		tsString = [ts descriptionWithLocale:[[NSUserDefaults standardUserDefaults] dictionaryRepresentation]];
	}
	
	[coordinateField setStringValue:[NSString stringWithFormat:@"%f° %f°", coordinate.longitude, coordinate.latitude]];
	[altitudeField setStringValue:[NSString stringWithFormat:altitudeFormat, [location altitude]]];
	[horizontalAccuracyField setStringValue:[NSString stringWithFormat:@"%f", [location horizontalAccuracy]]];
	[verticalAccuracyField setStringValue:[NSString stringWithFormat:@"%f", [location verticalAccuracy]]];
	[timestampField setStringValue:tsString];
}

@end
