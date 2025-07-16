# Testing Out Merges

W hat follows are two simple recipes that should help you play around with `git merge` until you understand exactly what it does. 
Both techniques basically do the same thing, but one of them relies on a slightly scarier-sounding Git command for the undo.

You might prefer one or the other based on how uncertain you are—about either your Git skills, or the specific merge you're about to try.

* Use the Scout pattern if you're still unclear on exactly what `git merge` does, or if you think it's likely that you'll decide to back out of the merge.
* Use the Savepoint pattern if you're pretty sure what you want to do, but just want to leave yourself an undo button in case things get too messy.
# The Scout Pattern

Here's a quick overview of the steps in this recipe:

1. Make sure you're on the right branch and that you have a clean working state.
2. Create a new branch (I often name it _test_merge_) and switch to it.
3. Do the merge.
4. Switch to your visualizer and predict how its view will change when you refresh it.
5. Refresh your visualizer and see whether your prediction was correct.
6. Are you happy with the result?
    - If YES: Move your real branch forward to where the `test_merge` branch is.
    - If NO: Delete the `test_merge` branch.

I call this the Scout pattern: you're unsure what the terrain ahead is like, so you send a scouting party ahead to check it out. If they radio back that everything's okay, you'll move ahead and join them. If not, well, it was just a small scouting party and we'll tell the families that they died with honor...

## The Long Scout Version
You're on the `main` branch and you want the changes from the `spiffy_new_feature` branch to be incorporated into `main`. You're not sure if this will be a good idea, so you want to try out the merge, but be able to abort it if things don't go smoothly.

1. **Make sure you're on the right branch and that you have a clean working state.**
   - Whatever visualizer you're using, figure out how it shows you where your current branch is. Or, at the command line, type `git status` and you should see something like this:
   ```
   # On branch main
   nothing to commit (working directory clean)
   ```
2. **Create a new branch and switch to it.**
   - Type `git checkout -b test_merge`. Now, if you type `git status` again, you should see a message that you're on the `test_merge` branch.
3. **Do the merge.**
   - Type `git merge spiffy_new_feature`. If you're lucky, there won't be any merge conflicts you can't resolve.
   - **If you want to abort the merge** at this point, type `git reset --hard`.
4. **Switch to your visualizer and predict how its view will change when you refresh it.**
   - For example: 
   - After a merge you should see a new commit.
   - The new commit should have a message like "Merge branch 'spiffy_new_feature' into test_merge".
   - Your ***test_merge*** branch label should have moved to this new commit, while the ***main*** and ***spiffy_new_feature*** branch labels should still be in the same place.
5. Refresh your visualizer and see whether your prediction was correct.
6. Are you happy with the result?
   - **If YES:** Move the _main_ branch forward to where the *test_merge* branch is by executing:
   ```
   git checkout main
   git merge test_merge 
   ```
   - **If NO:** Drop the *test_merge* branch with:
   ```
   git checkout main
   git branch -D test_merge
   ```
   
# The Savepoint Pattern

Here's a quick overview of the steps in this recipe:

1. Make sure you're on the right branch and that you have a clean working state.
2. Create a new branch to use as a savepoint, but don't switch to it.
3. Do the merge.
4. Switch to your visualizer and predict how its view will change when you refresh it.
5. Refresh your visualizer and see whether your prediction was correct.
6. Are you happy with the result?
    - If YES: Delete the savepoint.
    - If NO: Reset your branch to the savepoint.

## The Long Savepoint Version
You're on the ***main*** branch and you want the changes from the ***spiffy_new_feature*** branch to be incorporated into ***main***. You're reasonably confident that you'll want to keep the changes, but you want to be able to abort it if, for example, this feature has unintended side effects.

1. **Make sure you're on the right branch and that you have a clean working state.**
   - Whatever visualizer you're using, figure out how it shows you where your current branch is. Or, at the command line, type `git status` and you should see something like this:
   ```
   # On branch main
   nothing to commit (working directory clean)
   ```
2. **Create a new branch to use as a savepoint, but don't switch to it.**
    - Type `git branch savepoint`. Now, if you type `git status` again, you should still see a message that you're on the ***main*** branch.
3. **Do the merge.**
   - Type `git merge spiffy_new_feature`. If you're lucky, there won't be any merge conflicts you can't resolve.
   - **If you want to abort the merge** at this point, type `git reset --hard`.
4. **Switch to your visualizer and predict how its view will change when you refresh it.**
   - For example: 
   - After a merge you should see a new commit.
   - The new commit should have a message like "Merge branch 'spiffy_new_feature' into test_merge".
   - Your ***main*** branch label should have moved to this new commit, while the ***spiffy_new_feature*** branch labels should still be in the same place.
5. Refresh your visualizer and see whether your prediction was correct.
6. Are you happy with the result?
   - **If YES:** Delete the savepoint with:
   ```
   git branch -d savepoint
   ```
   - **If NO:** Reset your branch to the savepoint with:
   ```
   git reset --hard savepoint
   ```
     - After the reset, if you want to clean up, you can now delete the savepoint with git branch -d savepoint.

# Black Belt Merging

Once you're comfortable with the Savepoint pattern, you might get tired of creating the savepoint branch, only to have to remember to delete it every time. If so, I have good news for you: you don't actually need to use a branch as a savepoint for merges.

Merge commits always wind up with a branch label pointing at them, and one of the branch's parent commits will be the commit that that branch label was just moved from.

It may take you a few tries to parse that sentence. The upshot is that the commit you started on—the one you would've marked with a savepoint branch—**will always be reachable**.

Here's the thing: Git doesn't care what you call your branches. Remember, branches are just a 40-byte file on disk that points to the commit's SHA-1 hash, which is what Git really uses for all of its work. The branch is just there for us puny humans to have some convenient, memorable name pointing to part of the graph.

At the end of [the Savepoint pattern](#the-savepoint-pattern), the command you type to reset your branch to the savepoint is `git reset --hard savepoint` (where "savepoint" is a branch name). If you look at the documentation that comes up when you type `git reset -h`, you'll see that the final argument it takes is called `<commit>`. Older versions of the documentation called this `<commit-ish>`, which was a convenient reminder that you could use anything that Git can turn into a SHA-1 hash.

Things Git is happy to accept in a `<commit>` argument include (but are probably not limited to):
- Branch names
- Tags
- Relative references like `HEAD^`, `HEAD^^`, or `HEAD~3`
- Partial SHA-1 hashes like `8d434382` (you just have to provide enough initial digits to be unique; Git will fill in the rest for you)
- Complete SHA-1 hashes like `8d434382d9420940be260199a8a058cf468d9037` (these are very easy for Git to turn into SHA-1 hashes!)

So, at the end of [the Savepoint pattern](#the-savepoint-pattern), if you wanted to back out of the merge, you could just as easily use `git log` or your visualizer to find the SHA-1 of the commit (let's say it starts with `1234abcd`), and type this:

```
git reset --hard 1234abcd
```
...and **Git would behave exactly the same** as if you'd remembered to create a branch in the first place.


