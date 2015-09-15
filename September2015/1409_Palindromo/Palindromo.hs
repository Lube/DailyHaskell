import Data.Char
import Control.Monad

main = do
    input <- getLine
    inputs <- replicateM (read input) getLine
    print $ isPalindrome inputs

isPalindrome inputs 
                |original == reves   =  "Es Palindromo"
                |otherwise           =  "No es Palindromo"
                    where input    = map toLower (concat inputs)
                          original = filter isLetter input
                          reves    = reverse original