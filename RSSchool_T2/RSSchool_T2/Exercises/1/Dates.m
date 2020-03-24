#import "Dates.h"

@implementation Dates

- (NSString *)textForDay:(NSString *)day month:(NSString *)month year:(NSString *)year {
    
    NSArray *weekdays = @[@"воскресенье", @"понедельник", @"вторник", @"среда", @"четверг", @"пятница", @"суббота"];
    
    NSMutableString *stringDate = [[NSMutableString alloc] init];
    [stringDate appendString:day];
    [stringDate appendString:@" "];
    [stringDate appendString:month];
    [stringDate appendString:@" "];
    [stringDate appendString:year];
    
    NSDateFormatter* dateFormater = [[NSDateFormatter alloc] init];
    dateFormater.dateFormat = @"dd MM yyyy";

    NSDate *date = [dateFormater dateFromString:stringDate];
    if (date == nil) {
        return @"Такого дня не существует";
    }
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSInteger dayNumber = [calendar component:NSCalendarUnitWeekday fromDate:date];
    
    dateFormater.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ru-RU"];
    dateFormater.dateFormat = @"dd MMMM";
    
    return [[[dateFormater stringFromDate:date] stringByAppendingString:@", "] stringByAppendingString: weekdays[dayNumber-1]];
}

@end
