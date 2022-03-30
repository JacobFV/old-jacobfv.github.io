---
layout: post
title: Advanced Python Features
date: 2022-03-13
description: Now I know why so many of my professors use Python
categories: [notes]
comments: true
tags:   []
---

Python's always been a cool language for many reasons: it uses a lot of simple, English-language keywords, it cuts down on many of the braces and semicolons so prevelant in other programming languages, and it's cross-platform. Python code is beautiful. But besides these obvious perks, Python syntax and semantics go far deeper. In this post, I want to highlight 3 aspects of the language: functions, object definitions, and runtime introspection.

## Function signatures are highly expressive

You're probabbly familiar with ordered arguments:

```python
def foo(a, b, c):
  print(f'a={a}, b={b}, c={c}')

foo(1, 2, 3) # a=1, b=2, c=3
```

But have you ever passed in arguments by keyword?

```python
def foo(a, b, c):
  print(f'a={a}, b={b}, c={c}')

foo(1, 2, c=3) # a=1, b=2, c=3
foo(1, c=3, b=2) # a=1, b=2, c=3
```

You can also define a function with an arbitrary number of positional arguments like so:

```python
def foo(*args):
  print(f'a={args[0]}, b={args[1]}, c={args[2]}')

foo(1, 2, 3) # a=1, b=2, c=3
```

And you can do the same for keyword arguments:

```python
def foo(**kwargs):
  print(f'a={kwargs["a"]}, b={kwargs["b"]}, c={kwargs["c"]}')

foo(a=1, b=2, c=3) # a=1, b=2, c=3
foo(a=1, c=3, b=2, d=4) # d is ignored; a=1, b=2, c=3
```

You can even declare *position-only arguments* by terminating those args with a slash `/`:

```python
def foo(a, b, /, c):
  print(f'a={a}, b={b}, c={c}')

foo(1, 2, 3) # a=1, b=2, c=3
foo(1, 2, c=3) # a=1, b=2, c=3
foo(1, b=2, c=3) # error; b is a position-only argument
```

And you can do the same for *keyword-only arguments* by prefixing them in the argument list with an asterisk `*`:

```python
def foo(a, b, *, c):
  print(f'a={a}, b={b}, c={c}')

foo(1, 2, c=3) # a=1, b=2, c=3
foo(1, b=2, c=3) # a=1, b=2, c=3
foo(1, 2, 3) # error; c is a keyword-only argument
```

These features help you as a developer make the intent of your API more obvious by constraining how a function can be called. Python also offers the ability to annotate arguments with types, replace missing arguments with default values, and include a special triple-quote string at the start of your function for clear documentation.

## Everything is an object

Unlike C++ or Java, Python treats all semantic-level constructs the same; functions, classes, types, instances -- they're all `object`'s from the interpretter's point of view. All objects have a name, a type, and a value. So when we write something like:

```python
a=1

class B:
  pass

def c(): 
  return a
```

we've just initialized three objects: `a` which is an `int` with a value of 1; `B` which is a `type` object with a value of the `B` class's contents; and `c` which is a `function` with a value containing the function code, its signature, and some other data. We can verify this by running:

```python
for var in [a, B, c]:
  print(type(var))
```

which outputs
```
<class 'int'>
<class 'type'>
<class 'function'>
```

Since classes and functions are just plain-old `object`'s, that means you aren't limited by their block-style definition syntax. While certainly convenient, you can dynamically build your own types and functions.

Let's build a class `D` using the three objects above:

```python
D = type('D', (B,), dict(v1=a, v2=B, v3=c))
d = D()
```

This is the same as:
```python
class D(B):
  v1=a
  v2=B
  v3=c
```
but it gives us the flexibility to programmatically define what `D` should look like.

Python is sometimes like JavaScript, in that you can often add properties on the fly. (I.E.: `myobj.new_attribute = value`). In cases where the interpretter allows you to do this, it's usually because that object has a `__dict__` attribute defined. This attribute contains all the object's regular attributes and methods as well as hidden introspective variables (next section). You can override the `getattr` and `setattr` to methods to take managing the object's `__dict__` in your own hands. Finally, the `property(f_get, f_set, f_del)` method lets you define properties on objects with a custom getter (`f_get`), setter (`f_set`), and delete function (`f_del`). This function is available as a higher order function so you can write `@property` on the line above an instance method to make convert it into a propery accessor.

## Runtime introspection is super simple

Runtime introspection is the ability to look at the state of the programming runtime within the code that is being run. In simple cases, you might want to find out how deep you are in the stacktrace to avoid overflows. In complex cases, you could be allocating memory by hand, declaring new types, or changing the code being executed! First, some basics:

Python code is run in a two-stage processes: First, the source code file is opened, and Python compiles it into a `code` object. Then the interpretter begins executing the `code` at its top-level scope. Whenever you're just interpretting, compilation happens on the fly instead of ahead of time. This may sound complex, but conveniently, the `code` is a Python object type. That means we can introspect the code inside itself! 

`code` is much more common that you may realize. Every Python function contains a `__code__` property. Anytime you run a parameter-less function, you practically get identical behavior as if you had manually evaluated the function's code using Python's `eval` builtin:

```python
def foo():
  print(f'a={a}, b={b}, c={c}')

a=1; b=2; c=3
foo()
# same as
eval(foo.__code__, globals(), dict(a=1, b=2, c=3))
```

Pretty cool!

## Conclusion

I'm sure you can now see why so many computer science students use Python. It has awsome theoretical and practical power! Is there a feature of the Python programming language that you like? Please share it in the discussion.