module Lam where

{-

some terms:

- “tagless final” - defining the bits of a DSL as typeclasses/interfaces
- “typed tagless final” - same as the above, but with the instance type being parameterized by a type indicating the result of the expression (we’ll see this later)
- “HOAS” - “Higher-Order Abstract Syntax” - instead of using strings or numbers to represent variables introduced by syntax, use functions! there are some weird tradeoffs worth talking about but it has some huge advantages too

plan (per tweets):

1. screen sharing to my machine
2. will demonstrate a quick lambda calculus
3. screen sharing to your machine
4. you do one
5. back to my machine, extend it with bools
6. back to yours, you add bools & numbers
7. mine, make it typed!
8. mine, formatter
9. yours, evaluator

revisions we might want to explore:

- some input/output (e.g. readline/putline)
- statements
- declarations
-

goals:

- you’ll write a lambda calculus
- I hope to convince you that making a language is way easier than it sounds :)
- leave you with some homework (e.g. maybe a parser? but fair warning, HOAS makes it surprisingly tricky!)

references:

- http://okmij.org/ftp/tagless-final/ — Oleg (warning: maximally dense prose) on “typed tagless final” style

-}
