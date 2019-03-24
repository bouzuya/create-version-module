module Test.Main
  ( main
  ) where

import Prelude

import Effect (Effect)
import Test.Formatters as Formatters
import Test.Language as Language
import Test.Options as Options
import Test.Unit.Main as TestUnitMain
import Test.VersionLoader as VersionLoader

main :: Effect Unit
main = TestUnitMain.runTest do
  Formatters.tests
  Language.tests
  Options.tests
  VersionLoader.tests
