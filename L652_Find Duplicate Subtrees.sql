Given a binary tree, return all duplicate subtrees. For each kind of duplicate subtrees, you only need to return the root node of any one of them.

Two trees are duplicate if they have the same structure with same node values.

Example 1:

        1
       / \
      2   3
     /   / \
    4   2   4
       /
      4
The following are two duplicate subtrees:

      2
     /
    4
and

    4
    

class Solution:
    def findDuplicateSubtrees(self, root: TreeNode) -> List[TreeNode]:
        self.ans=[]
        m=defaultdict(int)
        self.helper(root,m)
        return self.ans
        
    def helper(self,root,m):
        if not root:
            return '#'
        path=str(root.val)+','+self.helper(root.left,m)+','+self.helper(root.right,m)
        
        if m[path]==1:
            self.ans.append(root)
        m[path]+=1
        return path
        
        
        
