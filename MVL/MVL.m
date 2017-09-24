//
//  MVL.m
//

#import "MVL.h"

#import "IDEEditorArea+MVL.h"
#import "_TcC12SourceEditor16SourceEditorView+MVL.h"

@implementation MVL

+ (MVL *)shared
{
    static MVL * _shared = nil;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        _shared = [[self alloc] init];
    });
    return _shared;
}

+ (void)load {
    NSBundle* app = [NSBundle mainBundle];
    NSString* identifier = [app bundleIdentifier];
    
    if( ![identifier isEqualToString:@"com.apple.dt.Xcode"] ){
        return;
    }
    
    [IDEEditorArea mvl_hook];
    [_TtC12SourceEditor16SourceEditorView mvl_initialize];
}

- (id)init
{
    self = [super init];
    if (self) {
        _insertionPoint = 0;
    }
    return self;
}
@end
