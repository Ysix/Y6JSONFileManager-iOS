//
//  Y6JSONFileManager.m
//
//  Created by Ysix on 26/03/2014.
//

#import "Y6JSONFileManager.h"

@implementation Y6JSONFileManager

@synthesize keepACopy;

- (id)initForFileNamed:(NSString *)name andUseByDefault:(id)defaultObject
{
	if (self = [super init])
	{
		NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
		NSString *documentsDirectory = [paths objectAtIndex:0];

		filePath = [documentsDirectory stringByAppendingPathComponent:name];

		BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:filePath];
        
		if (!fileExists)
		{
			if (![self writeObject:defaultObject])
				return nil;
		}
        
        keepACopy = YES;
	}
	return self;
}

- (id)getObject
{
    if (keepACopy && objectCopy)
    {
        return objectCopy;
    }
    
	NSData *data = [NSData dataWithContentsOfFile:filePath];

	id object = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];

// TODO: handle the errors
    
	return object;
}

- (BOOL)writeObject:(id)object
{
    if (keepACopy)
        objectCopy = object;
    
	NSData *data = [NSJSONSerialization dataWithJSONObject:object options:kNilOptions error:nil];
    
// TODO: handle the errors


	return [data writeToFile:filePath atomically:YES];
}


@end
