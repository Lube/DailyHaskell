import Data.Char
import Data.String.Utils
import Control.Monad

{-main = do
    input <- getLine
    inputs <- replicateM (read input) getLine
    print $ diagonalized inputs-}

maze = ["+-+-+-+-+-+",
		"  |       |",
		"+ +-+-+ + +",
		"| |     | |",
		"+ + + + + +",
		"|   | |   |",
		"+-+-+ +-+-+",
		"|     |   |",
		"+ + +-+ + +",
		"| |     |  ",
		"+-+-+-+-+-+"]

{-model maze = replace "-|+" "\\/" maze



diagonalized inputs 
                |original == reves   =  "Es Palindromo"
                |otherwise           =  "No es Palindromo"
                    where input    = map toLower (concat inputs)
                          original = filter isLetter input
                          reves    = reverse original-}