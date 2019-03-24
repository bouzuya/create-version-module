module Test.Language
  ( tests
  ) where

import Prelude

import Data.Foldable as Foldable
import Data.Maybe (Maybe(..))
import Language as Language
import Test.Unit (TestSuite)
import Test.Unit as TestUnit
import Test.Unit.Assert as Assert

tests :: TestSuite
tests = TestUnit.suite "Language" do
  TestUnit.test "fromString / toString" do
    let
      languages =
        [ "JavaScript"
        , "PureScript"
        , "TypeScript"
        ]
    Foldable.for_ languages \language -> do
      Assert.equal
        (Just language)
        (map Language.toString (Language.fromString language))

    Assert.equal
      Nothing
      (map Language.toString (Language.fromString "Ruby"))
