module Test.Main
  ( main
  ) where

import Prelude

import Effect (Effect)
import Test.Formatters as Formatters
import Test.Options as Options
import Test.Unit.Main as TestUnitMain

main :: Effect Unit
main = TestUnitMain.runTest do
  Formatters.tests
  Options.tests
