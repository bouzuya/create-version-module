module Main where

import Prelude

import Data.Array as Array
import Data.Either as Either
import Effect (Effect)
import Effect.Console as Console
import Effect.Exception as Exception
import Formatters as Formatters
import Node.Encoding as Encoding
import Node.FS.Sync as FS
import Node.Process as Process
import Options as Options
import Simple.JSON (E)
import Simple.JSON as SimpleJSON

loadVersion :: Effect String
loadVersion = do
  packageJsonString <- FS.readTextFile Encoding.UTF8 "./package.json"
  package <-
    Either.either
      (Exception.throw <<< (Array.intercalate "\n") <<< (map show))
      pure
      ((SimpleJSON.readJSON packageJsonString) :: E { version :: String })
  pure package.version

main :: Effect Unit
main = do
  args <- map (Array.drop 2) Process.argv
  { options } <-
    Either.either Exception.throw pure (Options.parse args)
  if options.help
    then Console.log Options.help
    else do
      version <- loadVersion
      Console.log (Formatters.format options.noComment options.language version)
