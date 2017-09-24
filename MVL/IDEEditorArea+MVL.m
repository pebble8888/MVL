//
//  IDEEditorArea+MVL.m
//

#import <AppKit/AppKit.h>
#import "IDEEditorArea+MVL.h"
#import "MVL.h"
#import "MVL-Swift.h"

@implementation IDEEditorArea (MVL)
+ (void)mvl_hook
{
    if (self == [IDEEditorArea class]) {
        [self swizzleInstanceMethod:@selector(_setEditorModeViewControllerWithPrimaryEditorContext:) with:@selector(mvl__setEditorModeViewControllerWithPrimaryEditorContext:)];
    }
}

- (void)mvl__setEditorModeViewControllerWithPrimaryEditorContext:(id)arg1 {
    [self mvl__setEditorModeViewControllerWithPrimaryEditorContext:arg1];
    MVL.shared.editorArea = self;
}
@end
