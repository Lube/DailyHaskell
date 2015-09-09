<?php
function exor($a, $b) {
	if ($a xor $b)
		return '1';
	return '0';
}

function getNextGeneration($generation) 
{	
	
	$nextGen[] = exor("0" , $generation[0]); 
	for ($i=1; $i < (count($generation) - 1) ; $i++) 
	{ 
	 	$nextGen[] = exor($generation[$i-1], $generation[$i+1]);
	}
	$nextGen[] = exor($generation[count($generation) - 1], "0");

	return $nextGen; 
}

function getNGenerations($n, $input) 
{
	$input = str_split($input);
	$finalresult[] = prettyprint($input);
	for ($i=0; $i < $n; $i++) 
	{ 
		$input = getNextGeneration($input);
		$finalresult[] = prettyprint($input);
	}

	var_dump($finalresult);
}

function prettyprint($generation) 
{
	$ugly   = array("0", "1");
	$pretty = array("O", "X");

	return str_replace($ugly, $pretty, implode("", $generation));
}

getNGenerations(2, "0101010");