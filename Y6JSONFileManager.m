//
//  Y6JSONFileManager.m
//  DreamGenerator
//
//  Created by Eddy Claessens on 26/03/2014.
//  Copyright (c) 2014 iPcrea. All rights reserved.
//

#import "Y6JSONFileManager.h"

@implementation Y6JSONFileManager


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
	}
	return self;
}

// read a file and get object

- (id)getObject
{
	NSData *data = [NSData dataWithContentsOfFile:filePath];

	id object = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];

	return object;
}

// write an object in a file

- (BOOL)writeObject:(id)object
{
	NSData *data = [NSJSONSerialization dataWithJSONObject:object options:kNilOptions error:nil];

	return [data writeToFile:filePath atomically:YES];
}


@end