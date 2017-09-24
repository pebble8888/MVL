//
//  Created by pebble on 2017/06/13.
//

#import "_TcC12SourceEditor16SourceEditorView+MVL.h"
#import "MVL.h"
#import "MVLTaskRunner.h"
#import "MVLStringUtil.h"
#import "NSObject+Swizzle.h"

@implementation _TtC12SourceEditor16SourceEditorView (MVL)
+ (void)mvl_initialize{
    [self mvl_swizzleInstanceMethod:@selector(selectedRange) with:@selector(mvl_selectedRange)];
    [self mvl_swizzleInstanceMethod:@selector(keyDown:) with:@selector(mvl_keyDown:)];
}

- (struct _NSRange)mvl_selectedRange{
    NSRange r = [self mvl_selectedRange];
    MVL.shared.insertionPoint = r.location;
    return r;
}

-  (void)mvl_keyDown:(NSEvent *)event {
    if (([event modifierFlags] & NSEventModifierFlagControl /* NSControlKeyMask*/) && event.keyCode == 16 /* y */)
    {
        // Ctrl-y
        IDEEditor *editor = MVL.shared.editorArea.lastActiveEditorContext.editor;
        IDEEditorDocument* document = editor.document;
        NSURL* documentURL = [document fileURL];
        NSString* filepath = documentURL.path;
        if (filepath != nil){
            NSUInteger linenumber = [MVLStringUtil lineWithPath:filepath pos:MVL.shared.insertionPoint];
            // use `brew install macvim`
            NSString* str = [NSString stringWithFormat:@"/usr/local/bin/mvim +%ld %@", linenumber, filepath];
            [MVLTaskRunner runScript:str];
        }
    }
    [self mvl_keyDown:event];
}
@end
