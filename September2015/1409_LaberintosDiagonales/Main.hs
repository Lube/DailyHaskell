import Data.Char

aMaze =["+-+-+-+-+-+",
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

modelRow (x:xs) | x == '|' = "\\" ++ modelRow xs
		        | x == '-' = '/'  : modelRow xs
		        | x == '+' =  modelRow xs
		        | otherwise = ' ' : modelRow xs

modelRow _ = []

buildRow matrix b = [ if (hasCoord off a b ancho alto) then ' ' else  (matrix!!x)!!y | let ancho = length matrix, let alto = (length . head $ matrix), let off = ((ancho+alto-1) `div` 2), a <- [1,3..ancho+alto-2], let x = (a + b  - off)`div` 2, let y = b - (a + b  - off)`div` 2]

hasCoord  off a b ancho alto | ((a + b  - off) `mod` 2 /= 0)  = True
							 | ((a + b  - off) `div` 2 >= 0) && ((a + b  - off) `div` 2 < ancho) && (b - (a + b  - off)`div` 2 >= 0) && (b - (a + b  - off)`div` 2) < alto  = False
							 | otherwise           = True

buildMaze = map (buildRow aMaze) [1,3..(length aMaze + (length . head) aMaze - 1)]

showMaze = mapM putStrLn (map modelRow buildMaze)