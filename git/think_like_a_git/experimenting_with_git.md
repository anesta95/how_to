# Experimenting with Git

**Starting from every branch and every tag**, Git walks back through the graph, building a list of every commit it can reach. This is very important.

Everything I've written up to this point has been to provide the background for you to **understand this one thing**. If I had ten seconds to tell you The Secret Of Git — *the entire point of this site* — I can fit it into these four words:

***REFERENCES MAKE COMMITS REACHABLE***

# References Make Committs Reachable

Let's unpack that sentence:

## References...

...whether they are [local branches, remote branches, or tags](./graphs_and_git.md#the-reference-reference).

## ...Make Commits...
which are [nodes in a graph](graphs_and_git.md#graphs-and-git)

## ...Reachable
so that you can [get back to them](graph_theory.md#reachability), and so that Git won't delete them when it decides it's time for [spring cleaning](graphs_and_git.md#garbage-collection).

# My Humble Beginnings

When I first started using Git, I was really paranoid about losing code. The only version control system I'd used before that was Subversion, where branching is this arcane thing that causes all kinds of trouble. So I didn't have a lot of practice with merging -- let alone rebasing, which everyone said was really dangerous.

So, before I tried something I was a little uncertain about, **I would back up *the entire directory***.

```
cd ..
cp -r work backup_work
cd work
```
Then I'd do the merge, or rebase, or whatever it was that I thought was tricky. If it looked like it worked, I'd continue on; if not, I'd delete the working directory, rename the old one, and try something else.

When I finally realized that [references make commits reachable](#references-make-committs-reachable), I (a) felt very dumb for all those times I backed up the repository, and (b) developed a much faster strategy for getting my repository back to a known state.

# Branches as Savepoints
Because a Git branch is just a 40-byte file on disk, it takes orders of magnitude more time for you to tell the computer to create a branch (by typing `git branch foo`) than for your computer to actually do it.

And because ***branches are references***, and (say it with me now) [References Make Commits (Nodes) Reachable](#references-make-committs-reachable), creating a branch is a way to "nail down" part of the graph that you might want to come back to later.

And because neither `git merge` nor `git rebase` will change your existing commits ([remember](graphs_and_git.md#garbage-collection), a commit's ID is a hash of its contents **and its history**), you can create a temporary branch any time you want to try something you're even just a little bit unsure about.

In other words, _creating a branch before you try a merge or a rebase is like saving your game before you battle the boss_.

# Use Your Targeting Computer, Luke
I use GitX in almost every coding session. GitX behaves like a web browser in one very important way: _it won't immediately reflect changes to your repository_— you have to hit **Cmd/Ctrl+R** to tell it to **(R)**efresh its view. (Since I first wrote this, later forks of GitX have added auto-refresh. I always turn it off.)

You can use this to your advantage. Here's how: *when you've done something on the command line*, switch back to your visualizer, but *don't refresh right away*. Instead, try to predict how what you did will change its view. (You can even try drawing out the graph on an index card.) Then, refresh the visualizer and ask yourself: *did it change in the way you expected*?

**If the answer is YES**: Congratulations! You just learned something!

**If the answer is NO**: Congratulations! You're about to learn something!

Repeat this process several thousand times, and eventually you won't need to refer to the visualizer as often. (*For those of you who like bad sci-fi movies, think of it as less "Use the force, Luke" and more **"Usul no longer needs the weirding module."***)

Here are some other [git resources](https://think-like-a-git.net/resources.html)