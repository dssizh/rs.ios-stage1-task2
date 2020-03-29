#import "Blocks.h"

@implementation Blocks

NSArray *blocksArray;

- (instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

- (BlockA)blockA {
    
    return ^(NSArray *array){
        if (array.count != 0) {
            blocksArray = array;
        }
    };
}

- (BlockB)blockB {
    
    __weak Blocks *weakSelf = self;
    
    BlockB blockB = ^(Class class){
        
        if (class == [NSString class]) {
            
            NSMutableString *result = [[NSMutableString alloc] init];
            for (int i=0; i<blocksArray.count; i++) {
                
                if ([blocksArray[i] isKindOfClass:class]) {
                    [result appendString:blocksArray[i]];
                }
            }
            weakSelf.blockC(result);
        };
        
        if (class == [NSNumber class]) {
            int sum = 0;
            for (int i=0; i<blocksArray.count; i++) {
                if ([blocksArray[i] isKindOfClass:class]) {
                    sum = sum + [blocksArray[i] intValue];
                }
            }
            weakSelf.blockC([NSNumber numberWithInt:sum]);
        }
                
        if (class == [NSDate class]) {
            
            NSDate *date = [[NSDate alloc]init];
            NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
            formatter.dateFormat = @"dd.MM.yyyy";
            for (int i=0; i<blocksArray.count; i++) {
                if ([blocksArray[i] isKindOfClass:class]) {
                    if (blocksArray[i] > date) {
                        date = blocksArray[i];
                    }
                }
            }
            weakSelf.blockC([formatter stringFromDate:date]);
        }
                
    };
    
    return [blockB copy];
}

@end

