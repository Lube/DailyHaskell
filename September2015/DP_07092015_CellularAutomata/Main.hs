module CA where

import Data.List
import Data.Bits
import Data.Char

data Cell = Cell Int deriving (Show)

getValue  :: Cell -> Int  
getValue  (Cell val) = val  
  
computeNextValue (Cell 1) (Cell a) (Cell 1) = Cell 0
computeNextValue (Cell 0) (Cell a) (Cell 0) = Cell 0
computeNextValue (Cell 1) (Cell a) (Cell 0) = Cell 1
computeNextValue (Cell 0) (Cell a) (Cell 1) = Cell 1

printNGenerationsFromString n s = printNGenerations n ([Cell 0] ++ [ Cell (digitToInt cell) | cell <- s ] ++ [Cell 0]) 

printNGenerations 0 _ = putStrLn ""
printNGenerations n ca = do 
		putStrLn $ show $ currentValues ca
		printNGenerations (n - 1) (computeNextGeneration ca)

currentValues ca = [ getValue cell | cell <- init(tail(ca)) ]

computeNextGeneration ca = [Cell 0] ++ [ computeNextValue (ca!!(i - 1)) (ca !! i) (ca!!(i + 1))  | i <- [1..(length ca - 2)]] ++ [Cell 0]
