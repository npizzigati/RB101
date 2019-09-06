Multiple Signatures
===================

What do each of these puts statements output?

```
a = %w(a b c d e)
puts a.fetch(7)
puts a.fetch(7, 'beats me')
puts a.fetch(7) { |index| index**2 }
```

Answer
------

1. IndexError
2. beats me
3. 49
