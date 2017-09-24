//
//  MVL.h
//

#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>
#import "IDEKit.h"

@interface MVL : NSObject
+ (MVL *)shared;
@property (weak) IDEEditorArea* editorArea;
@property NSUInteger insertionPoint;
@end
