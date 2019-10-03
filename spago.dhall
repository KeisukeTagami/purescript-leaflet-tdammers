{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name =
    "leaflet-tdammers"
, dependencies =
    [ "arrays", "console", "effect", "psci-support", "tuples" ]
, packages =
    ./packages.dhall
, sources =
    [ "src/**/*.purs", "test/**/*.purs", "example/**/*.purs" ]
}
