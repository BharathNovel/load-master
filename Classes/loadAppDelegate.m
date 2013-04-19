#import "loadAppDelegate.h"
#import "connectionController.h"
#import "VariableStore.h"

@implementation loadAppDelegate

@synthesize window;
@synthesize langs;
@synthesize details;

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after application launch.
    
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
	[langs release];
	[details release];
    [window release];
    [super dealloc];
}


-(IBAction)show:(id)sender{
	
	NSMutableDictionary *dict = [VariableStore sharedInstance].dict;
	NSArray *urls = [VariableStore sharedInstance].urls;
		
	connectionController *connMgr = [[connectionController alloc] init];
	
	for (NSString* url in urls) {		
		
		//getting image
		NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]
													cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:60];

		NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request 
														  delegate:connMgr startImmediately:YES];
						  
		if (connection) {        
			/* create an object to hold the received data */
			NSMutableDictionary *value = [NSMutableDictionary dictionary];
			
			NSMutableData *data = [NSMutableData data];
			
			[value setObject:data forKey:@"image"];						
			[value setObject:url forKey:@"url"];
						
			[dict setObject:value forKey:[connection description]];
		} //if
		
	} //for

	//[connMgr release];
}

-(void)awakeFromNib {		
    NSMutableArray* _langs = [[NSMutableArray alloc] initWithObjects:@"ASP",
							  @"CSS",
								 @"HTML", @"Javascript", @"Mysql", @"PHP", @"Python",
								 @"Ruby", @"XML",@"SQL", nil];

	NSMutableArray* _details = [[NSMutableArray alloc] initWithObjects:
									@"Active Server Pages",
									@"Cascading Style Sheets",
									@"HyperText Markup Language", 
									@"ECMAScript", @"My Sequel", 
									@"Personal Home Page Tools", 
									@"Monty Python's Flying Circus",
									@"Yukihiro Matsumoto", 
									@"Extensible Markup Language", 
									@"Structured Query Language", nil];

	
    self.langs = _langs;
	self.details = _details;
		
    [_langs release];
	[_details release];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [langs count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView
		cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	//putting reference tableView
	[VariableStore sharedInstance].tableView = tableView;
	
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CompanyCell"];
	
    if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
									   reuseIdentifier:@"CompanyCell"] autorelease];
    }
	[cell.textLabel setText:(NSString *)[langs objectAtIndex:indexPath.row]];
	[cell.detailTextLabel setText: (NSString *)[details objectAtIndex:indexPath.row]];
	
	if (cell.imageView.image == nil){
		cell.imageView.image = [UIImage imageNamed:@"page_blank_512.png"];
	}

	return cell;
}

@end
