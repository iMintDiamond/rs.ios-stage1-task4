#import "FullBinaryTrees.h"
#import "TreeNode.h"

@implementation FullBinaryTrees

- (NSString *)stringForNodeCount:(NSInteger)count {
    
    NSMutableString *result = [NSMutableString new];
    [result appendString:@"["];
    for (TreeNode *bt in [self findTreesFor:count]) {
        [result
            appendFormat:@"%@\n",
            [[self treeToString:bt]
                stringByReplacingOccurrencesOfString:@"<null>"
                withString:@"null"]
         ];
    }
    [result appendString:@"]"];
    
    return result;
}

- (NSArray *)findTreesFor:(NSInteger)count {
    NSMutableArray *result = [NSMutableArray new];
    if (count < 1 || count % 2 == 0) {
        return result;
    }
    if (count == 1) {
        [result addObject:[[TreeNode alloc] initTreeNodeWith:0]];
        return result;
    }
    
    for (int i = 1; i < count; i += 2) {
        for (TreeNode *left in [self findTreesFor:i]) {
            for (TreeNode *right in [self findTreesFor:(count - i - 1)]) {
                TreeNode *subroot = [[TreeNode alloc] initTreeNodeWith:0];
                subroot.left = left;
                subroot.right = right;
                [result addObject:subroot];
            }
        }
    }

    return result;
}

- (NSString *)treeToString:(TreeNode *)node {
    NSMutableArray *result = [NSMutableArray new];
    NSMutableArray *currentNodes = [NSMutableArray new];
    NSMutableArray *nextNodes = [NSMutableArray new];
    
    [nextNodes addObject:node];
    while ([nextNodes count] > 0) {
        currentNodes = [nextNodes copy];
        [nextNodes removeAllObjects];
        for (id currentNode in currentNodes) {
            if ([currentNode isKindOfClass:[TreeNode class]]) {
                [result addObject:[currentNode valueForKey:@"value"]];
                
                if ([currentNode valueForKey:@"left"] == nil) {
                    [nextNodes addObject:[NSNull null]];
                } else {
                    [nextNodes addObject:[currentNode valueForKey:@"left"]];
                }
                    
                if ([currentNode valueForKey:@"right"] == nil) {
                    [nextNodes addObject:[NSNull null]];
                } else {
                    [nextNodes addObject:[currentNode valueForKey:@"right"]];
                }
            } else {
                [result addObject:[NSNull null]];
            }
        }
    }
    
    while (true) {
        if ([result lastObject] == [NSNull null]) {
            [result removeLastObject];
        } else {
            break;
        }
    }
    
    return [[NSString alloc] initWithFormat:@"[%@]",
                [[result valueForKey:@"description"] componentsJoinedByString:@","]
            ];
}

@end
