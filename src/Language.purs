module Language
  ( Language(..)
  , fromString
  , toString
  ) where

import Data.Maybe (Maybe(..))

data Language
  = JavaScript
  | PureScript
  | TypeScript

fromString :: String -> Maybe Language
fromString s = case s of
  "JavaScript" -> Just JavaScript
  "PureScript" -> Just PureScript
  "TypeScript" -> Just TypeScript
  _ -> Nothing

toString :: Language -> String
toString = case _ of
  JavaScript -> "JavaScript"
  PureScript -> "PureScript"
  TypeScript -> "TypeScript"
