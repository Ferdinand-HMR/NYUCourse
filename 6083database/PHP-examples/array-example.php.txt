<?php

$price = array ("milk" => "3.99",
                "bread" => 2.78,
				"coffee"=>6.99);

echo  "PRICE VALUES";
// Print values in HTML table
echo "<table>\n";
    foreach ($price as $value) {
    	echo "\t<tr>\n";
        echo "\t\t<td>$value</td>\n";
    	echo "\t</tr>\n";
    }
echo "</table>\n";
echo  "PRICE KEYS and VALUES";
// Print values in HTML table
echo "<table>\n";
    foreach ($price as $item=>$value) {
    	echo "\t<tr>\n";
        echo "\t\t<td>$item</td>\n";
        echo "\t\t<td>$value</td>\n";
    	echo "\t</tr>\n";
    }
echo "</table>\n";
$item = "milk";
if (array_key_exists($item,$price))
	print "$item costs $price[$item]";
else
	print "price of $item unknown";

?> 
