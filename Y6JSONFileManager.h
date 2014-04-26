//
//  Y6JSONFileManager.h
//  DreamGenerator
//
//  Created by Eddy Claessens on 26/03/2014.
//  Copyright (c) 2014 iPcrea. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Y6JSONFileManager : NSObject
{
	NSString *filePath;
    BOOL     keepACopy;
    id       objectCopy;
}

/**
 *  By default at YES, this indicates that a copy of teh object is keep and updated at each write, it's useful if you want to access a lot to the object because it's avoid the reading of the file, but keep the object in memory.
 */
@property   (nonatomic) BOOL keepACopy;

/**
 *  Initialise the JSONFileManager with a file named with parameter name in the NSDocument directory, write the default object in the file if the file doesn't exist.
 *
 *  @param name          The name of the file.
 *  @param defaultObject the default content of the object if the file is not existing.
 *
 *  @return A Y6JSONFileManager object for access to the content of the file or rewrite it.
 */
- (id)initForFileNamed:(NSString *)name andUseByDefault:(id)defaultObject;
/**
 *  Read the file and get the object.
 *
 *  @return The object writen in the file.
 */
- (id)getObject;

/**
 *  Write an object in the file
 *
 *  @param object The object to write in the file.
 *
 *  @return YES if the operation succeeds, otherwise NO.
 */
- (BOOL)writeObject:(id)object;

@end
