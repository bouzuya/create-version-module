module Options
  ( Options
  , help
  , parse
  ) where

import Bouzuya.CommandLineOption as CommandLineOption
import Data.Either (Either)
import Data.Maybe (Maybe(..))
import Data.String as String

type Options =
  { help :: Boolean
  , language :: String
  , noComment :: Boolean
  }

help :: String
help =
  String.joinWith
    "\n"
    [ "Usage: create-version-module [options] [FILE]"
    , ""
    , "Options:"
    , "  -h, --help                display help"
    , "      --language <LANGUAGE> output language"
    , "      --no-comment          prevent comment"
    , ""
    ]

parse ::
  Array String
  -> Either String { arguments :: Array String, options :: Options }
parse =
  CommandLineOption.parse
    { help:
        CommandLineOption.booleanOption "help" (Just 'h') "display help"
    , language:
        CommandLineOption.stringOption
          "language" Nothing "<LANGUAGE>" "output language" "JavaScript"
    , noComment:
        CommandLineOption.booleanOption "no-comment" Nothing "no comment"
    }
