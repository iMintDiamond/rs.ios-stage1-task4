#import "TelephoneFinder.h"

@implementation TelephoneFinder
- (NSArray <NSString*>*)findAllNumbersFromGivenNumber:(NSString*)number {
    NSDictionary *neigbors = @{
        @"1" : @[@"2", @"4"],
        @"2" : @[@"1", @"3", @"5"],
        @"3" : @[@"2", @"6"],
        @"4" : @[@"1", @"5", @"7"],
        @"5" : @[@"2", @"4", @"6", @"8"],
        @"6" : @[@"3", @"5", @"9"],
        @"7" : @[@"4", @"8"],
        @"8" : @[@"5", @"7", @"9", @"0"],
        @"9" : @[@"6", @"8"],
        @"0" : @[@"8"]
    };
    
    NSMutableArray *result = [NSMutableArray new];
    
    for (int i = 0; i < [number length]; i++)
    {
        NSMutableString *numberCopy = [[NSMutableString alloc] initWithString:number];
        NSString *numeral = [[NSString alloc] initWithFormat:@"%c", [number characterAtIndex:i]];
        NSArray *numeralNeigbors = [neigbors valueForKey:numeral];
        if ([numeralNeigbors count] == 0) {
            return nil;
        }
        for (NSString *numeralNeigbor in numeralNeigbors) {
            [numberCopy replaceCharactersInRange:NSMakeRange(i, 1) withString:numeralNeigbor];
            NSString *newNumber = [[NSString alloc] initWithString:numberCopy];
            [result addObject:newNumber];
        }
    }
    
    return result;
}
@end
