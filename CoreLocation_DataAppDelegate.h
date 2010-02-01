//
//  CoreLocation_DataAppDelegate.h
//  CoreLocation Data
//
//  Created by Martin Brandenburg on 1/31/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <CoreLocation/CoreLocation.h>

@interface CoreLocation_DataAppDelegate : NSObject <NSApplicationDelegate, CLLocationManagerDelegate> {
    NSWindow *window;
	NSTextField *coordinateField;
	NSTextField *altitudeField;
	NSTextField *horizontalAccuracyField;
	NSTextField *verticalAccuracyField;
	NSTextField *timestampField;
	CLLocationManager *clManager;
}

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet NSTextField *coordinateField;
@property (assign) IBOutlet NSTextField *altitudeField;
@property (assign) IBOutlet NSTextField *horizontalAccuracyField;
@property (assign) IBOutlet NSTextField *verticalAccuracyField;
@property (assign) IBOutlet NSTextField *timestampField;

- (IBAction)refresh:(id)sender;

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error;
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation;

- (void)updateData:(CLLocation*)location;

@end
