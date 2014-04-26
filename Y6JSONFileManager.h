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
}

- (id)initForFileNamed:(NSString *)name andUseByDefault:(id)defaultObject;
- (id)getObject;
- (BOOL)writeObject:(id)object;

@end
