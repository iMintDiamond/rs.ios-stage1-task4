#import "ArrayCalculator.h"

@implementation ArrayCalculator
+ (NSInteger)maxProductOf:(NSInteger)numberOfItems itemsFromArray:(NSArray *)array {
    long long product = 0;
    
    NSMutableArray *maximals = [NSMutableArray new];
    NSMutableArray *positives = [NSMutableArray new];
    NSMutableArray *negatives = [NSMutableArray new];
    
    for (id number in array) {
        if ([number isKindOfClass:[NSNumber class]]) {
            if ([number longValue] > 0) {
                [positives addObject:number];
            } else {
                [negatives addObject:number];
            }
        }
    }
    
    if (([positives count] + [negatives count]) > 0) {
         product = 1;
    }
    
    if (numberOfItems >= ([positives count] + [negatives count])) {
        for (NSNumber *number in positives) {
            product *= [number longValue];
        }
        for (NSNumber *number in negatives) {
            product *= [number longValue];
        }
        return product;
    }
    
    NSSortDescriptor *lowestToHighest = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:YES];
    [negatives sortUsingDescriptors:[NSArray arrayWithObject:lowestToHighest]];
    [positives sortUsingDescriptors:[NSArray arrayWithObject:lowestToHighest]];
    
    for (long i = 1; i <= numberOfItems; i++) {
        if ([positives count] > 0) {
            NSNumber *maximalPositive = [positives lastObject];
            [positives removeLastObject];
            [maximals addObject:maximalPositive];
        } else {
            if (i == numberOfItems) {
                NSNumber *minimalNegative = [negatives firstObject];
                [negatives removeObjectAtIndex:0];
                [maximals addObject:minimalNegative];
            } else {
                NSNumber *maximalNegative = [negatives lastObject];
                [negatives removeLastObject];
                [maximals addObject:maximalNegative];
            }
        }
    }
    [maximals sortUsingDescriptors:[NSArray arrayWithObject:lowestToHighest]];
    
    
    for (long i = 0; i < numberOfItems; i += 2) {
        if ([negatives count] < 2) {
            break;
        }
        NSNumber *minimal1Negative = [negatives firstObject];
        [negatives removeObjectAtIndex:0];
        NSNumber *minimal2Negative = [negatives firstObject];
        [negatives removeObjectAtIndex:0];
        if ([[maximals objectAtIndex:i] longValue] * [[maximals objectAtIndex:i+1] longValue] <
            [minimal1Negative longValue] * [minimal2Negative longValue]) {
            [maximals removeObjectAtIndex:0];
            [maximals removeObjectAtIndex:0];
            [maximals insertObject:minimal1Negative atIndex:0];
            [maximals insertObject:minimal2Negative atIndex:0];
        } else {
            break;
        }
    }
    
    
    for (NSNumber *number in maximals) {
        product *= [number longValue];
    }
    
    return product;
}
@end
