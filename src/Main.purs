module Main
  ( main
  ) where

import Prelude

import Data.Array as Array
import Data.Either as Either
import Effect (Effect)
import Effect.Console as Console
import Effect.Exception as Exception
import Formatters as Formatters
import Node.Process as Process
import Options as Options
import Version as Version

main :: Effect Unit
main = do
  args <- map (Array.drop 2) Process.argv
  { options } <-
    Either.either Exception.throw pure (Options.parse args)
  if options.help
    then Console.log Options.help
    else do
      version <- Version.load
      Console.log (Formatters.format options.noComment options.language version)
