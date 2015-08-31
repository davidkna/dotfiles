{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ExtendedDefaultRules #-}

module MyAntigen where

import Antigen (-- Rudimentary imports
                AntigenConfig (..)
              , defaultConfig
              , bundle
              , antigen)

bundles =
  [ bundle "Tarrasch/zsh-command-not-found"
  , bundle "Tarrasch/zsh-colors"
  , bundle "Tarrasch/zsh-autoenv"
  , bundle "Tarrasch/zsh-mcd"
  , bundle "zsh-users/zsh-syntax-highlighting"
  , bundle "zsh-users/zsh-history-substring-search"
  , bundle "zsh-users/zsh-completions"
  , bundle "mafredri/zsh-async"
  , bundle "sindresorhus/pure"
  ]

config = defaultConfig { plugins = bundles }

main :: IO ()
main = antigen config
