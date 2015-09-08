module CA where

import Data.List
import Data.Char

data Cell = Cell Int deriving (Show)

getValue  :: Cell -> Int  
getValue  (Cell val) = val  
  
xor a b = mod ( a + b ) 2

prettyprint 0 = '_'
prettyprint 1 = 'x'

computeNextValue (Cell a) (Cell b) = Cell (xor a b)

printNGenerationsFromString n s = printNGenerations n (map Cell ([0] ++ map digitToInt s ++ [0])) 

printNGenerations 0 _ = putStrLn ""
printNGenerations n ca = do 
		putStrLn $ map prettyprint (currentValues ca)
		printNGenerations (n - 1) (computeNextGeneration ca)

currentValues ca = [ getValue cell | cell <- init(tail(ca)) ]

computeNextGeneration ca = [Cell 0] ++ [computeNextValue (ca!!(i - 1)) (ca!!(i + 1))  | i <- [1..(length ca - 2)]] ++ [Cell 0]
