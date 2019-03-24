module Version
  ( load
  ) where

import Prelude

import Data.Array as Array
import Data.Either as Either
import Effect (Effect)
import Effect.Exception as Exception
import Node.Encoding as Encoding
import Node.FS.Sync as FS
import Simple.JSON (E)
import Simple.JSON as SimpleJSON

load :: Effect String
load = do
  packageJsonString <- FS.readTextFile Encoding.UTF8 "./package.json"
  package <-
    Either.either
      (Exception.throw <<< (Array.intercalate "\n") <<< (map show))
      pure
      ((SimpleJSON.readJSON packageJsonString) :: E { version :: String })
  pure package.version
