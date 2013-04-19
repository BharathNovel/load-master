#import <UIKit/UIKit.h>
#import "VariableStore.h"

@interface loadAppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow *window;
	
	NSMutableArray *langs;
	NSMutableArray *details;

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) NSMutableArray *langs;
@property (nonatomic, retain) NSMutableArray *details;

-(IBAction)show:(id)sender;

@end

