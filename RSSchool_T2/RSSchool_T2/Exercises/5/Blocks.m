#import "Blocks.h"

@implementation Blocks

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.blockA(<#NSArray *#>) = ^(NSArray *array){
            if (array.count == 0) {
            }
        }
    }
    return self;
}

@end

