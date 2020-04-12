#import "SquareDecomposer.h"

@implementation SquareDecomposer
- (NSArray <NSNumber*>*)decomposeNumber:(NSNumber*)number {
    long goal = 0;
    NSMutableArray *result = [[NSMutableArray alloc] initWithArray:@[number]];
    while ([result count]) {
        long current = [[result lastObject] longValue];
        [result removeLastObject];
        goal += current * current;
        for (long i = current - 1; i >= 0; i--) {
            if ((goal - i*i >= 0)) {
                goal -= i*i;
                [result addObject:[[NSNumber alloc] initWithLong:i]];
                if (goal == 0) {
                    NSSortDescriptor *lowestToHighest = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:YES];
                    [result sortUsingDescriptors:[NSArray arrayWithObject:lowestToHighest]];
                    return result;
                }
            }
        }
    }
    return nil;
}
@end
