module Lam where

{-

some terms:

- “tagless final” - defining the bits of a DSL as typeclasses/interfaces
- “typed tagless final” - same as the above, but with the instance type being parameterized by a type indicating the result of the expression (we’ll see this later); cf Oleg on “typed tagless final” style, http://okmij.org/ftp/tagless-final/
- “HOAS” - “Higher-Order Abstract Syntax” - instead of using strings or numbers to represent variables introduced by syntax, use functions! there are some weird tradeoffs worth talking about but it has some huge advantages too

-}


class Lam expr where
  lam :: (expr a -> expr b) -> expr (a -> b)
  ($$) :: expr (a -> b) -> (expr a -> expr b)
  infixl 9 $$

id' :: Lam expr => expr (a -> a)
id' = lam id

const' :: Lam expr => expr (a -> b -> a)
const' = lam $ \ a -> lam (const a)

-- true :: Lam expr => expr (then' -> else' -> then')
-- true = const'

-- false :: Lam expr => expr (then' -> else' -> else')
-- false = lam $ \ _ -> lam id


class Boolean expr where
  bool :: Bool -> expr Bool

  iff :: expr Bool -> expr a -> expr a -> expr a

true, false :: Boolean expr => expr Bool
true  = bool True
false = bool False

not' :: (Boolean expr, Lam expr) => expr (Bool -> Bool)
not' = lam $ \ b -> iff b false true
