#import <UIKit/UIKit.h>

@interface VariableStore : NSObject
{
    NSMutableDictionary *dict;
	NSArray *urls;
	UITableView IBOutlet *tableView;
	
}

@property (nonatomic, retain) NSMutableDictionary *dict;
@property (nonatomic, retain) NSArray *urls;
@property (nonatomic, retain) UITableView IBOutlet *tableView;

// message from which our instance is obtained
+ (VariableStore *)sharedInstance;

@end