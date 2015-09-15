module CA where

import Data.List
import Data.Char

data Cell = Cell { value :: Int } deriving (Show)
  
xor a b = mod ( a + b ) 2

prettyprint 0 = '_'
prettyprint 1 = 'x'

computeNextValue (Cell a) (Cell b) = Cell (xor a b)

printNGenerationsFromString n s = printNGenerations n (map Cell (map digitToInt s)) 

printNGenerations 0 _ = putStrLn ""
printNGenerations n ca = do 
		putStrLn $ map prettyprint (currentValues ca)
		printNGenerations (n - 1) (computeNextGeneration ca)

currentValues = map value . init . tail

computeNextGeneration ca = [ computeNextValue a c  | a:b:c:_<- tails ([Cell 0]++ca++[Cell 0])]
