#import "VariableStore.h"

@implementation VariableStore

@synthesize dict;
@synthesize urls;
@synthesize tableView;

+ (VariableStore *)sharedInstance
{
    // the instance of this class is stored here
    static VariableStore *myInstance = nil;
	
    // check to see if an instance already exists
    if (nil == myInstance) {
        myInstance  = [[[self class] alloc] init];
		
        // initialize variables here
		[[self sharedInstance] setDict:[NSMutableDictionary dictionaryWithCapacity:10]];
		
		
		//URLS array stores URLS
		NSArray *urls = [NSArray arrayWithObjects:
						 @"http://193.219.125.2/pic/512x512/page_asp_512.png",
						 @"http://193.219.125.2/pic/512x512/page_css_512.png",
						 @"http://193.219.125.2/pic/512x512/page_html_512.png",
						 @"http://193.219.125.2/pic/512x512/page_javascript_512.png",
						 @"http://193.219.125.2/pic/512x512/page_mysql_512.png",
						 @"http://193.219.125.2/pic/512x512/page_php_512.png",
						 @"http://193.219.125.2/pic/512x512/page_python_512.png",
						 @"http://193.219.125.2/pic/512x512/page_ruby_512.png",
						 @"http://193.219.125.2/pic/512x512/page_xml_512.png",
						 @"http://193.219.125.2/pic/512x512/sql_512.png", nil];		
		[[self sharedInstance] setUrls:urls];

    }
    // return the instance of this class
    return myInstance;
}

- (void)dealloc {
	[urls release];
	[tableView release];
    [dict release];
    [super dealloc];
}
@end