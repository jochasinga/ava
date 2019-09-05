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

Because Julia is not Object-oriented language, instance methods like `"1.01".is_alpha()` won't happen.
In Python, the conventions were mixed as in module-level functions `os.listdir` and instance method `''.split`,
which is a source of confusion for many new to the language.

Module-level functions and/or static methods shold be considered better practice, especially in a library.





