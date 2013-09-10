//
//  NSFileManager+DocumentsDirectory.m
//  YouGotListings
//
//  Created by trimm on 16.08.11.
//  Copyright 2011 RedShiftLab. All rights reserved.
//

#import "NSFileManager+IDPExtensions.h"


@implementation NSFileManager (IDPExtensions)

+ (NSString *)directoryPathForPath:(IDPDirectoryPath)thePath {
    NSString *result = nil;
    
    switch (thePath) {
        case IDPApplicationsDataPath:
            result = [self applicationDataPath];
            break;
            
        case IDPDocumentsDirectoryPath:
            result = [self documentsDirectoryPath];
            break;
            
        case IDPLibraryDirectoryPath:
            result = [self bundleDirectoryPath];
            break;
            
        case IDPBundleDirectoryPath:
            result = [self applicationDataPath];
            break;
            
        default:
            break;
    }
    
    return result;
}

+ (NSString *)documentsDirectoryPath {
	static NSString *__docsDirectory = nil;
	
	if (nil == __docsDirectory) {
		__docsDirectory = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] retain];
	}
	return __docsDirectory;
}

+ (NSString *)libraryDirectoryPath {
	static NSString *__libraryDirectory = nil;
	
	if (nil == __libraryDirectory) {
		__libraryDirectory = [[NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) objectAtIndex:0] retain];
	}
	return __libraryDirectory;
}

+ (NSString *)bundleDirectoryPath {
	return [[NSBundle mainBundle] bundlePath];
}

+ (NSString *)applicationDataPath {
	static NSString *__applicationDataDirectory = nil;
	
	if (nil == __applicationDataDirectory) {
		__applicationDataDirectory = [[NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, NSUserDomainMask, YES) objectAtIndex:0] retain];
	}
    
    NSFileManager *manager = [NSFileManager defaultManager];
    [manager createDirectoryAtPath:__applicationDataDirectory
       withIntermediateDirectories:YES
                        attributes:nil
                             error:NULL];
    
	return __applicationDataDirectory;	
}

+ (BOOL)fileNameExistsInDocumentsDirectory:(NSString *)fileName {
	return [self fileName:fileName existsInDirectory:[self documentsDirectoryPath]];
}

+ (BOOL)fileNameExistsInLibraryDirectory:(NSString *)fileName {
	return [self fileName:fileName existsInDirectory:[self libraryDirectoryPath]];	
}

+ (BOOL)fileNameExistsInBundleDirectory:(NSString *)fileName {
	return [self fileName:fileName existsInDirectory:[self bundleDirectoryPath]];
}

+ (BOOL)fileNameExistsInApplicationDataPath:(NSString *)fileName {
	return [self fileName:fileName existsInDirectory:[self applicationDataPath]];
}

+ (BOOL)fileName:(NSString *)fileName existsInDirectory:(NSString *)directoryPath {
	return [[NSFileManager defaultManager] fileExistsAtPath:[directoryPath stringByAppendingPathComponent:fileName]];
}

@end
