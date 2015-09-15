module CA where

import Data.List
import Data.Char

newtype Cell = Cell Int deriving (Show)


xor a b = mod ( a + b ) 2

prettyprint ((Cell 1):xs) = 'x' : prettyprint xs
prettyprint ((Cell _):xs) = ' ' : prettyprint xs
prettyprint _ = []

computeNextValue (Cell a) (Cell b) = Cell (xor a b)

computeNextGeneration ca = [  Cell (xor a c) | (Cell a):b:(Cell c):_<- tails ([Cell 0]++ca++[Cell 0])]

getNComputedGenerations n cells = take n (iterate computeNextGeneration cells)
									
prettyprintGenerations n s = mapM_ (putStrLn . prettyprint) (getNComputedGenerations n cells)
							where cells = map (Cell . digitToInt) s 
