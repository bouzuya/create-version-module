{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ sources =
    [ "src/**/*.purs", "test/**/*.purs" ]
, name =
    "my-project"
, dependencies =
    [ "arrays"
    , "bouzuya-command-line-option-parser"
    , "console"
    , "effect"
    , "newtype"
    , "node-child-process"
    , "node-fs"
    , "node-process"
    , "psci-support"
    , "simple-json"
    , "test-unit"
    ]
, packages =
    ./packages.dhall
}
