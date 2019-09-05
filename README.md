# Ava

Ava is a collection of useful utilities in Julia Language that maps closely to the Python counterparts.

For a quick example, in Python, a [Counter](https://docs.python.org/3.5/library/collections.html#collections.Counter) object can be used to form a bag of words.

```python

>>> words = 'Two roads diverged in a yellow wood'.split()
>>> Counter(words).most_common()

```

With `Ava.Collections` you could write something similar:

```julia

> import Ava.Strings: Str
> import Ava.Collections: Counter
> words = Str('Two roads diverged in a yellow wood').split()
> Counter(words).most_common()

```

## Examples

Testing a string for alphanumeric:

```julia

using Ava
# Do this to avoid namespace clash with `Strings` module.
const Str = Ava.Strings


if !Str.isalpha("10.9")
	println("It's number")
end

```

List the files in a directory.

```julia

> import Ava: Os
> parent = Os.listdir("..")
# listdir has multiple dispatch which defaults empty parameter to "."
> current = Os.listdir()


```

## Case of Module-level Functions

Because Julia is not Object-oriented language, instance methods aren't very idiomatic.

In Python, the conventions were mixed between module-level functions and instance methods. This is a source of confusion for many.

Ava provides convenient wrapper constructors to create an illusion of instance methods. For example:

```julia

> using Ava
> const Str = Ava.Strings.Str
> pi = Str("3.1416")
> pi.isalpha()
# false

> Str("Hello, world!").split()
#=
2-element Array{String,1}:
  "Hello,"
  "world!"
=#

```

Find the ten most common words in Hamlet:

```julia

> import Ava.Collections: Counter
> open("hamlet.txt") do f
>	words = matchall(r"\w+", read(f, String))
>	Counter(words).most_common(10)
> end
#=
10-element Array{Pair{Any,Int64},1}:
  "the" => 1143
  "and" => 966
  "to" => 762
   ...
=#

```

However, module-level functions should be considered better practice.

```julia

> import DataStructures: counter
> import Ava.Collections: most_common
> counter(words) |> most_common

```
