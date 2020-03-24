#import "AbbreviationMaker.h"

@implementation AbbreviationMaker
// Complete the abbreviation function below.
- (NSString *) abbreviationFromA:(NSString *)a toB:(NSString *)b {
    
    NSMutableString *pattern = [[NSMutableString alloc] init];
    for (int i=0; i<b.length; i++) {
        [pattern appendString:@"[A-Z]*"];
        [pattern appendString:[NSString stringWithFormat:@"%C", [b characterAtIndex:i]]];
        NSLog(@"char - %c", [b characterAtIndex:i]);
    }
    [pattern appendString:@"[A-Z]*"];
    
    NSRegularExpressionOptions regexOptions = NSRegularExpressionCaseInsensitive;
    NSRegularExpression *regex =[NSRegularExpression regularExpressionWithPattern:pattern options:regexOptions error:NULL];
    
    NSUInteger numberOfMatches = [regex numberOfMatchesInString:a
    options:0
    range:NSMakeRange(0, [a length])];
    
    return numberOfMatches != 0 ? @"YES" : @"NO";
}
@end
