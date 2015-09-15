module SGS where

import Data.List

data Forma     = Diamante | Ovalada | Difusa   deriving (Eq, Show)
data Color     = Rojo     | Violeta | Verde	   deriving (Eq, Show)
data Numero    = Uno      | Dos     | Tres     deriving (Eq, Show)
data Sombreado = Abierto  | Roto    | Completo deriving (Eq, Show)

getForma     (Carta f _ _ _) = f
getColor     (Carta _ c _ _) = c
getNumero    (Carta _ _ n _) = n
getSombreado (Carta _ _ _ s) = s

data Carta = Carta Forma Color Numero Sombreado deriving (Eq, Show)

genForma 'D' = Diamante
genForma 'O' = Ovalada
genForma 'S' = Difusa

ppF Diamante = 'D'
ppF Ovalada  = 'O'
ppF Difusa   = 'S'

genColor 'R' = Rojo
genColor 'V' = Violeta
genColor 'G' = Verde

ppC Rojo    = 'R'
ppC Violeta = 'V'
ppC Verde   = 'G'

genNumero '1' = Uno
genNumero '2' = Dos
genNumero '3' = Tres

ppN Uno  = '1'
ppN Dos  = '2'
ppN Tres = '3'

genSombreado 'A' = Abierto
genSombreado 'H' = Roto
genSombreado 'C' = Completo

ppS Abierto   = 'A'
ppS Roto      = 'H'
ppS Completo  = 'C'

generarCartas = map generarCarta 

generarCarta :: String -> Carta
generarCarta cartaString = Carta f c n s 
							where 
								  f = genForma	      $ cartaString!!0
								  c = genColor	      $ cartaString!!1
								  n = genNumero	      $ cartaString!!2
								  s = genSombreado	  $ cartaString!!3
				
--validSet :: (Carta, Carta, Carta) -> Bool
validateCond a b c
				|a == b && b == c && a == c = True
				|a /= b && b /= c && a /= c = True
				|otherwise = False

validateAtt [a,b,c] f = validateCond (f a) (f b) (f c)

someCartas = generarCartas ["SV3C", "DV3A", "DR2C", "SV3H", "DG3A", "SR1H", "SG2A", "SV1C", "SV3A", "OR3A", "OR3H", "OR2H"]

validSet posibleSet = all id [validateAtt posibleSet getForma, validateAtt posibleSet getColor, validateAtt posibleSet getNumero, validateAtt posibleSet getSombreado]

allSets cartas = [[a,b,c] | (a:as) <- tails cartas, (b:bs) <- tails as, c <- bs, validSet [a,b,c]]

prettyPrint (Carta f c n s) = ppF f : ppC c : ppN n : ppS s : [] 

printSet [a, b, c] = prettyPrint a ++ " " ++ prettyPrint b ++ " " ++ prettyPrint c

printSets = map printSet 

