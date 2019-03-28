module VersionLoader
  ( Version
  , load
  ) where

import Prelude

import Data.Array as Array
import Data.Either as Either
import Data.Newtype (class Newtype)
import Data.Newtype as Newtype
import Data.String as String
import Effect (Effect)
import Effect.Exception as Exception
import Node.Buffer as Buffer
import Node.ChildProcess as ChildProcess
import Node.Encoding as Encoding
import Node.FS.Sync as FS
import Node.Path as Path
import Simple.JSON (E)
import Simple.JSON as SimpleJSON

newtype Version = Version String

derive instance newtypeVersion :: Newtype Version _

exec :: String -> Array String -> Effect String
exec command args = do
  buffer <-
    ChildProcess.execFileSync command args ChildProcess.defaultExecSyncOptions
  Buffer.toString Encoding.UTF8 buffer

load :: Effect Version
load = do
  directory <- map String.trim (exec "npm" ["prefix"])
  packageJsonString <-
    FS.readTextFile Encoding.UTF8 (Path.concat [directory, "package.json"])
  package <-
    Either.either
      (Exception.throw <<< (Array.intercalate "\n") <<< (map show))
      pure
      ((SimpleJSON.readJSON packageJsonString) :: E { version :: String })
  pure (Newtype.wrap package.version)
