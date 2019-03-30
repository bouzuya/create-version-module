module Main
  ( main
  ) where

import Prelude

import Data.Array as Array
import Data.Either as Either
import Data.Maybe (Maybe(..))
import Data.Maybe as Maybe
import Effect (Effect)
import Effect.Console as Console
import Effect.Exception as Exception
import Formatters as Formatters
import Language as Language
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
      language <-
        Maybe.maybe
          (Exception.throw ("invalid language: " <> options.language))
          pure
          (Language.fromString options.language)
      content <-
        pure (Formatters.format language options.noComment version)
      case Array.head arguments of
        Nothing -> Console.log content
        Just file -> FS.writeTextFile Encoding.UTF8 file content
