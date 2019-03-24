module Test.Options
  ( tests
  ) where

import Prelude

import Data.Either (Either(..))
import Data.Maybe as Maybe
import Data.String as String
import Options as Options
import Test.Unit (TestSuite)
import Test.Unit as TestUnit
import Test.Unit.Assert as Assert

tests :: TestSuite
tests = TestUnit.suite "Options" do
  TestUnit.test "help" do
    let
      include s = Maybe.isJust (String.indexOf (String.Pattern s) Options.help)
    Assert.assert "include --help" (include "--help")
    Assert.assert "include --language" (include "--language")
    Assert.assert "include --no-comment" (include "--no-comment")

  TestUnit.test "parse" do
    Assert.equal
      (Right
        { arguments: []
        , options:
          { help: true
          , language: "PureScript"
          , noComment: true
          }
        })
      (Options.parse ["--help", "--no-comment", "--language", "PureScript"])
