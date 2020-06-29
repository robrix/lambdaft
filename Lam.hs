module Lam where

{-

some terms:

- “tagless final” - defining the bits of a DSL as typeclasses/interfaces
- “typed tagless final” - same as the above, but with the instance type being parameterized by a type indicating the result of the expression (we’ll see this later); cf Oleg on “typed tagless final” style, http://okmij.org/ftp/tagless-final/
- “HOAS” - “Higher-Order Abstract Syntax” - instead of using strings or numbers to represent variables introduced by syntax, use functions! there are some weird tradeoffs worth talking about but it has some huge advantages too

-}
