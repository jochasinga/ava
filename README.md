# Ava

Ava is a collection of useful utilities in Julia Language that maps closely to the Python
counterpart for ease of use.

## Examples

Testing a string for alphanumeric:

```julia

using Ava
# Do this to avoid namespace clash with `Strings` module.
const Str = Ava.Strings


if Str.is_alpha("10.9")
	println("It's number")
end

```

List the files in a directory.

```julia

import Ava: Os

parent = Os.listdir("..")

# listdir has multiple dispatch which defaults empty parameter to "."
current = Os.listdir()


```

## Case of Module-level Functions

Because Julia is not Object-oriented language, instance methods like `"1.01".is_alpha()` is unnatural (and probably for the best).
In Python, the conventions were mixed as in module-level functions `os.listdir` and instance method `''.split`,
which is a source of confusion for many new to the language.

`Ava.Strings` provides a convenient constructor `Str` to wrap a `String` and create an illusion of instance methods. 

For example:

```julia

using Ava
const Str = Ava.Strings.Str

pi = Str("3.1416")
pi.is_alpha()  # true

Str("Hello, world!").split() # ["Hello,", "world!"]

```

However, module-level functions and/or static methods shold be considered better practice.





