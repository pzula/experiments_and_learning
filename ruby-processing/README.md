ruby-processing
===============

Using Ruby &amp; Processing to make something like ye old Paint app. Thanks to http://tutorials.jumpstartlab.com/projects/process_artist.html

Requires the [ruby-processing](https://github.com/jashkenas/ruby-processing) gem, and a local installation of the Java SDK.

To run the program, in your terminal, run the command prompt by loading `ruby process_artist.rb`
This should launch the Java runtime locally and you will see the shapes and colors specified in the program.

In your terminal, you can redefine the colors in the CLI by calling `b` followed by the RGB specification of the color combination you seek to change the background to.
For example, a full command may look like `b255,0,0`, followed by pressing the enter key.

This should render your new background color.
