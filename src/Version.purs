module Version
  ( Version
  , load
  ) where

import Prelude

import Data.Array as Array
import Data.Either as Either
import Data.Newtype (class Newtype)
import Data.Newtype as Newtype
import Effect (Effect)
import Effect.Exception as Exception
import Node.Encoding as Encoding
import Node.FS.Sync as FS
import Simple.JSON (E)
import Simple.JSON as SimpleJSON

newtype Version = Version String

derive instance newtypeVersion :: Newtype Version _

load :: Effect Version
load = do
  packageJsonString <- FS.readTextFile Encoding.UTF8 "./package.json"
  package <-
    Either.either
      (Exception.throw <<< (Array.intercalate "\n") <<< (map show))
      pure
      ((SimpleJSON.readJSON packageJsonString) :: E { version :: String })
  pure (Newtype.wrap package.version)
