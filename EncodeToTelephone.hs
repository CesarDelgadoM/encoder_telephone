module EncodeToTelephone (encode) where

import KeyboardTelephone ( keyboard )



{-Implementacion de codificador de texto al teclado 
    numerico de los celulares antiguos-}


--Codifica texto a teclado numerico de celular
encode :: String -> [[Int]]
encode [] = []
encode (x:xs) = repetirKey posKeyboard cant : encode xs
    where
        arrValues   = searchInKeyboard keyboard x
        posKeyboard = head arrValues
        cant        = last arrValues


--Buscamos la letra en todas las teclas
searchInKeyboard :: [String] -> Char -> [Int]
searchInKeyboard keys l = go keys 0
    where 
        go [] _ = []
        go (x:xs) count
            | searchInKey x l /= -1 = [count, searchInKey x l]
            | otherwise = go xs (count + 1)


--Buscamos la letra en una sola tecla
searchInKey :: Eq a => [a] -> a -> Int
searchInKey keys l = go (length keys) 0
    where
        go 0 _ = -1
        go len count
            | keys !! count == l = count + 1
            | otherwise = go (len - 1) (count + 1)


--Repite un string cuantas veces se indique
repetirKey :: (Eq t, Num t) => a -> t -> [a]
repetirKey _ 0 = []
repetirKey key count = key : repetirKey key (count - 1)


