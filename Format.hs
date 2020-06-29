module Format where

import Lam
import Pretty
import qualified Data.Text.Prettyprint.Doc as PP
import qualified Data.Text.Prettyprint.Doc.Render.Terminal as ANSI


newtype Format a = Format { runFormat :: Int -> PP.Doc ANSI.AnsiStyle }

format :: Format a -> PP.Doc ANSI.AnsiStyle
format f = runFormat f 0

var :: Int -> PP.Doc ANSI.AnsiStyle
var v = pretty '_' <> pretty v

doc :: PP.Doc ANSI.AnsiStyle -> Format a
doc = Format . const

instance Lam Format where
  lam f = Format $ \ v -> pretty '\\' <+> var v <+> pretty "->" <+> runFormat (f (doc (var v))) (v + 1)
  f $$ a = Format $ \ v -> runFormat f v <+> runFormat a v

instance Boolean Format where
  bool b = doc (pretty b)

  iff c t e = Format $ \ v -> pretty "if" <+> runFormat c v <+> pretty "then" <+> runFormat t v <+> pretty "else" <+> runFormat e v
