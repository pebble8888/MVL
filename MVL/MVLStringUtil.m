//
//  MVLStringUtil.m
//

#import "MVLStringUtil.h"

@implementation MVLStringUtil
+ (NSUInteger)lineWithPath:(NSString*)path pos:(NSUInteger)pos
{
    NSError* error;
    NSString* s = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&error];
    if (s == nil){ return 0;}
    NSUInteger end = s.length;
    NSUInteger line = 1;
    for (NSUInteger i = 0; i < end && i < pos; ++i){
        unichar uc = [s characterAtIndex:i];
        if (uc == 0x0A){
            line += 1;
        }
    }
    return line;
}

@end
