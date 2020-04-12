#import "TreeNode.h"

@implementation TreeNode

- (TreeNode *)initTreeNodeWith:(NSInteger)value {
    self = [super init];
    if (self) {
        self.value = value;
    }
    return self;
}

@end
