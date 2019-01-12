Simon Tharby's solution to [Binary Tree exercise](https://www.theodinproject.com/courses/ruby-programming/lessons/data-structures-and-algorithms?ref=lnav), Odin Project:

### My Implementation (divergence from, & additions to, instructions):

  * <code>tree.rb</code> contains Tree and Node classes
  * <code>examples.rb</code> run to see examples of Tree searches
  * <code>time.rb</code> run to see measurement of time complexity of searches

I implemented separate <code>Node</code> and <code>Tree</code> classes, rather than only a <code>Node</code> class (as instructed), as this seemed more logical to me.

The <code>Tree</code> class builds a binary search tree on initialization of a new instance, from an array passed into <code>Tree.new(ary)</code>.

Although the exercise of building searches (breadth or depth first) that search all nodes is interesting and challenging, using such a search does not leverage the structure that is created when building the (unbalanced tree). Thus, I also wrote a conditional search that takes advantage of the tree structure.

I measured the the time complexity by comparing all search methods over multiple searches (see <code>time.rb</code>). This is why all my search methods contain a counter (to count the number of nodes visited in finding a target value).

As expected, using breadth or depth first searches resulted in an average of n/2 operations (if you have no guide as to where a value might be / not be, on average you will find it half-way though a search of all elements). The conditional search was much faster (more than 10 times less elements searched for arrays of 200 elements). This roughly confirms the expected Ologn result expected (vs n/2 for the slower search methods).

### Instructions:

You’ll build a simple binary tree data structure from some arbitrary input and also the “crawler” function that will locate data inside of it.

1.  Build a class <code>Node</code>. It should have a value that it stores and also links to its parent and children (if they exist) [**note: I am pretty sure a link to a parent is unnecessary, and will proceed with only using links to child nodes**]. Build getters and setters for it (e.g. parent node, child node(s)).
2. Write a method <code>build_tree</code> which takes an array of data (e.g. [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]) and turns it into a binary tree full of <code>Node</code> objects appropriately placed. Start by assuming the array you get is sorted.
3. Now refactor your <code>build_tree</code> to handle data that isn’t presorted and cannot be easily sorted prior to building the tree. You’ll need to figure out how to add a node for each of the possible cases (e.g. if it’s a leaf versus in the middle somewhere).
4. Write a simple script that runs <code>build_tree</code> so you can test it out.
5. Build a method <code>breadth_first_search</code> which takes a target value and returns the node at which it is located using the breadth first search technique. Tip: You will want to use an array acting as a queue to keep track of all the child nodes that you have yet to search and to add new ones to the list (as you saw in the video). If the target node value is not located, return nil.
6. Build a method <code>depth_first_search</code> which returns the node at which the target value is located using the depth first search technique. Use an array acting as a stack to do this.
7. Next, build a new method <code>dfs_rec</code> which runs a depth first search as before but this time, instead of using a stack, make this method recursive.
