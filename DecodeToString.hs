module DecodeToString (decode) where

import KeyboardTelephone ( keyboard )



decode :: [[Int]] -> String
decode [] = ""
decode (x:xs) = (key !! pos) : decode xs
    where
        key = keyboard !! head x
        pos = length x - 1


