module Language
  ( Language
  , fromString
  , toString
  ) where

import Data.Maybe (Maybe(..))
import Data.Newtype (class Newtype)
import Data.Newtype as Newtype

newtype Language = Language String

derive instance newtypeLanguage :: Newtype Language _

fromString :: String -> Maybe Language
fromString = case _ of
  s@"JavaScript" -> Just (Newtype.wrap s)
  s@"PureScript" -> Just (Newtype.wrap s)
  s@"TypeScript" -> Just (Newtype.wrap s)
  _ -> Nothing

toString :: Language -> String
toString = Newtype.unwrap
