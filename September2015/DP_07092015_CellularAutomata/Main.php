<?php
function exor($a, $b) {
	if ($a xor $b){
		return '1';
	}
	return '0';
}

function getNextGeneration($generation) 
{	
        	
	$nextGen[] = exor("0", $generation[1]);
	for ($i=1; $i <= count($generation)-2 ; $i++) 
	{ 
	 	$nextGen[] = exor($generation[$i-1], $generation[$i+1]);
	}
	$nextGen[] = exor($generation[count($generation) - 2], "0");

	return $nextGen; 
}

function getNGenerations($n, $input) 
{
	$input = str_split($input);
	$finalRes[] = prettyprint($input);
	echo $finalRes[0];
	echo "\n";
	for ($i=0; $i < $n; $i++) 
	{ 
		$input = getNextGeneration($input);
		$finalRes[] = prettyprint($input);
		echo $finalRes[$i+1];
		echo "\n";
	}	
}

function prettyprint($generation) 
{
	$ugly   = array("0", "1");
	$pretty = array(" ", "X");

	return str_replace($ugly, $pretty, implode("", $generation));
}

getNGenerations(25, "0000000000000000000000000000100000000000000000000000000000");
