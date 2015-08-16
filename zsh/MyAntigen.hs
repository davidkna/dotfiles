{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ExtendedDefaultRules #-}

module MyAntigen where

import Antigen (AntigenConfiguration (..)
              , bundle
              , antigen)

import Shelly (shelly)

bundles =
  [ bundle "Tarrasch/zsh-command-not-found"
  , bundle "Tarrasch/zsh-colors"
  , bundle "Tarrasch/zsh-autoenv"
  , bundle "Tarrasch/zsh-i-know"
  , bundle "Tarrasch/zsh-mcd"
  , bundle "zsh-users/zsh-syntax-highlighting"
  , bundle "zsh-users/zsh-history-substring-search"
  , bundle "zsh-users/zsh-completions"
  , bundle "mafredri/zsh-async"
  , bundle "sindresorhus/pure"
  , bundle "rimraf/k"
  ]

config = AntigenConfiguration bundles

main :: IO ()
main = shelly $ antigen config
