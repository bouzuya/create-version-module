module Main
  ( main
  ) where

import Prelude

import Data.Array as Array
import Data.Either as Either
import Data.Maybe (Maybe(..))
import Effect (Effect)
import Effect.Console as Console
import Effect.Exception as Exception
import Formatters as Formatters
import Node.Encoding as Encoding
import Node.FS.Sync as FS
import Node.Process as Process
import Options as Options
import VersionLoader as VersionLoader

main :: Effect Unit
main = do
  args <- map (Array.drop 2) Process.argv
  { arguments, options } <-
    Either.either Exception.throw pure (Options.parse args)
  if options.help
    then Console.log Options.help
    else do
      version <- VersionLoader.load
      content <-
        pure (Formatters.format options.noComment options.language version)
      case Array.head arguments of
        Nothing -> Console.log content
        Just file -> FS.writeTextFile Encoding.UTF8 file content
