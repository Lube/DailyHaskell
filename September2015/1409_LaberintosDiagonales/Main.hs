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

modelMaze = map modelRow 

modelRow (x:xs) | x == '|' = "/" ++ modelRow xs
	        | x == '-' = '\\'  : modelRow xs
	        | otherwise = ' ' : modelRow xs

modelRow _ = []

shiftMaze maze = zipWith (++) (modelMaze maze) [concat(replicate n " ") | let l = (length maze) `div` 2, n <- ([l, l-1..0] ++ [1,2..l])]


transpose maze = [ (-a+b+((xlen+ylen-1)`div`2), a+b `div` 2, ((maze!!b)!!a)) | let ylen = (length maze), let xlen = (length . head $ maze), a <- [0..ylen-1], b <- [0..xlen-1]]
