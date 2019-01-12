IN PROGRESS - Simon Tharby's solution to [Binary Tree exercise](https://www.theodinproject.com/courses/ruby-programming/lessons/data-structures-and-algorithms?ref=lnav), Odin Project:

#### My Implementation (divergence from, & additions to, instructions):

I implemented separate <code>Node</code> and <code>Tree</code> classes, not only a <code>Node</code> class (as instructed), as this seemed more logical to me.

My <code>Tree</code> class build a binary search tree on initialization, if an array is passed into <code>Tree.new(ary)</code>.

#### Instructions:

You’ll build a simple binary tree data structure from some arbitrary input and also the “crawler” function that will locate data inside of it.

1.  Build a class <code>Node</code>. It should have a value that it stores and also links to its parent and children (if they exist) [**note: I am pretty sure a link to a parent, and will proceed with only using links to child nodes**]. Build getters and setters for it (e.g. parent node, child node(s)).
2. Write a method <code>build_tree</code> which takes an array of data (e.g. [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]) and turns it into a binary tree full of <code>Node</code> objects appropriately placed. Start by assuming the array you get is sorted.
3. Now refactor your <code>build_tree</code> to handle data that isn’t presorted and cannot be easily sorted prior to building the tree. You’ll need to figure out how to add a node for each of the possible cases (e.g. if it’s a leaf versus in the middle somewhere).
4. Write a simple script that runs <code>build_tree</code> so you can test it out.
5. Build a method <code>breadth_first_search</code> which takes a target value and returns the node at which it is located using the breadth first search technique. Tip: You will want to use an array acting as a queue to keep track of all the child nodes that you have yet to search and to add new ones to the list (as you saw in the video). If the target node value is not located, return nil.
6. Build a method <code>depth_first_search</code> which returns the node at which the target value is located using the depth first search technique. Use an array acting as a stack to do this.
7. Next, build a new method <code>dfs_rec</code> which runs a depth first search as before but this time, instead of using a stack, make this method recursive.
