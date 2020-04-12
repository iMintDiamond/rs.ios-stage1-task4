#import <Foundation/Foundation.h>

@interface TreeNode : NSObject
- (TreeNode *_Nullable)initTreeNodeWith:(NSInteger)value;

@property NSInteger value;
@property (weak, nullable) TreeNode* left;
@property (weak, nullable) TreeNode* right;

@end
