{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE RecursiveDo #-}

module Main where

import Reflex.Dom

main :: IO ()
main = mainWidget $ do
    el "h1" $ text ""
    b1 <- button "increment"
    b2 <- button "decrement"
    let s = leftmost [(+1) <$ b1, (\x -> x - 1) <$ b2]
    rec let curr = (<3) <$> current e2
        e2 <- foldDyn ($) 0 (gate curr s)
    display e2
    return ()
