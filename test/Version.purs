module Test.Version
  ( tests
  ) where

import Prelude

import Test.Unit (TestSuite)
import Test.Unit as TestUnit

tests :: TestSuite
tests = TestUnit.suite "Version" do
  TestUnit.test "TODO" do
    pure unit
