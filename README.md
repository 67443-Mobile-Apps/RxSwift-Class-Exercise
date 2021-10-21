RXSwift-Class-Exercise
===

In the **Exercise** playground, you are given a function called `loadFile()` that will read a text file and return it as a `Single`. This function works fine and does not need to be edited.  Your task is to call that function so that it reads the file, if a legitimate text file is given, and produces an error message when there is a problem.

After you call the function with a filename, it will return a `Single` object that you can _subscribe_ to and then _dispose_ of (using the `disposeBag` provided). Be sure to call both these methods on your `Single` object.

In addition, when you subscribe, you need to pass a block (closure) to the `subscribe` method.  Remember in class we said that `Single` only has two states: `.success` and `.error`.  In the case of a `.success`, this block should print out the string; in the case of an `.error`, it should print out the error message.

Note that we have provided several files in the `Resources` directory to use for testing.  To verify this fully working, do the following: 

- test `loadText(from: "Quotes")` which should load the 42 quotes from HGTTG. 

- test `loadText(from: "fix_bug")` which should print 'fileNotFound' because that is a png file rather than text

- test `loadText(from: "fix_bugs")` which should print 'encodingFailed' because that is not a valid text file

- you can also test the non-existent "Quacks" file or even the "Empty" file provided (works but does nothing) if time allows


If you need additional guidance, all the examples we went over in class (and some we passed over) are available in the **Observables** playground.

