= rhyme

A Java to Ruby and Ruby to Java objects translator

== DESCRIPTION:

Sometimes you have a Ruby object (a Hash for example) and you want to call a Java method that expects an object of an equivalent class (HashMap in this case). Instead of converting the object and all others inside manually to the Java similar you can tranlaste them all very easy using Rhyme.

Also, you may have a Ruby method/function that is being called from Java with Java objects as parameters, you can convert them all with Rhyme so they could be compatible with others operations, like some Ruby API.

== SYNOPSIS:

  In Ruby:

  Rhyme.translate([{ "date" => Date.new}])

  In Java:

  List array = new ArrayList();
  ...
  Rhyme.translate(array);

== REQUIREMENTS:

  jruby

== INSTALL:

  sudo gem install rhyme

== LICENSE:

(The MIT License)

Copyright (c) 2008 Rhyme

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.