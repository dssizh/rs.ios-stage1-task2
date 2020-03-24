#import "TimeConverter.h"

@implementation TimeConverter
// Complete the following function
- (NSString*)convertFromHours:(NSString*)hours minutes:(NSString*)minutes {
    
    NSMutableString *result = [[NSMutableString alloc] init];
    NSArray *minutesArray = @[
                        @[@"minutes",      @"ten minutes",         @""],
                        @[@"one minute",   @"eleven minutes",      @""],
                        @[@"two minutes",   @"twelve minutes",      @"twenty "],
                        @[@"three minutes", @"thirteen minutes",    @"half"],
                        @[@"four minutes",  @"fourtenn minutes",    @"forty "],
                        @[@"five minutes",  @"quarter",     @"fifty"],
                        @[@"six minutes",   @"sixteen minutes",     @""],
                        @[@"seven minutes", @"seventeen minutes",   @""],
                        @[@"eight minutes", @"eighteen minutes",    @""],
                        @[@"nine minutes",  @"nineteen minutes",    @""],
                        ];
    NSArray *hoursArray = @[
                            @"one",
                            @"two",
                            @"three",
                            @"four",
                            @"five",
                            @"six",
                            @"seven",
                            @"eight",
                            @"nine",
                            @"ten",
                            @"eleven",
                            @"twelve",
                            ];
    
    
    NSString *(^getTime)(int, int, NSString*) = ^(int hours, int minutes, NSString *timeWord){
        NSMutableString *time = [[NSMutableString alloc] init];
        if (minutes >= 20) {
             [time appendString:minutesArray[minutes/10][2]];
        }
        if (minutes != 30) {
            [time appendString:minutesArray[minutes%10][minutes<20 ? minutes/10 : 0] ];
        }
        [time appendString:timeWord];
        [time appendString:hoursArray[hours]];
        return time;
    };
    
    
    int intHours = [hours intValue] - 1;
    int intMinutes = [minutes intValue];
    NSString *timeWord = @" past ";
    
    if (intMinutes > 59) {
        return @"";
    }
    if (intMinutes == 0) {
        [result appendString:hoursArray[intHours]] ;
        [result appendString:@" o' clock"];
        return result;
    }
    if (intMinutes > 30) {
        timeWord = @" to ";
        intMinutes = 60 - intMinutes;
        intHours++;
    }
    [result appendString:getTime(intHours, intMinutes, timeWord)];
        
    return result;
}
@end
