#import "connectionController.h"

@implementation connectionController

- (void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    /* Called when the server has determined that it has enough  
     information to create the NSURLResponse. It can be called 
     multiple times (for example in the case of a redirect), so 
     each time we reset the data. */
		
	NSMutableDictionary *value = [[VariableStore sharedInstance].dict objectForKey: [connection description]];
		
	[[value objectForKey:@"image"] setLength:0];
}

- (void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
	NSMutableDictionary *value = [[VariableStore sharedInstance].dict objectForKey: [connection description]];
	
    /* appends the new data to the received data */
	[[value objectForKey:@"image"] appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
	
	UITableView *tableView = [VariableStore sharedInstance].tableView;
	
	NSMutableDictionary *value = [[VariableStore sharedInstance].dict objectForKey: [connection description]];
	
	UIImage *image = [[UIImage alloc] initWithData:[value objectForKey:@"image"]];
		
	NSArray *urls = [VariableStore sharedInstance].urls;
	NSUInteger index = [urls indexOfObject: [value objectForKey:@"url"]];

	UITableViewCell *cell = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0]];

	if(cell) {
		cell.imageView.image = image;		
	}

}
@end
