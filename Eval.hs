module Eval where

import Lam

newtype Eval a = Eval { eval :: a }

instance Lam Eval where
  lam f = Eval $ eval . f . Eval
  f $$ a = Eval $ eval f $ eval a

instance Boolean Eval where
  bool = Eval
  iff c t e = if eval c then t else e
