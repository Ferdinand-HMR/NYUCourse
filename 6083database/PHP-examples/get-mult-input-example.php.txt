<?php
// Connecting, selecting database
$link = mysql_connect('pdc-amd01', 'pfrankl','topsecret')
    or die('Could not connect: ' . mysql_error());
// echo 'Connected successfully';
mysql_select_db('pfrankl') or die('Could not select database');

//$input_topic = mysqlclean($_GET,"topic",30,$connection);
// $input_topic = $_GET["topic"];

// Performing SQL query
$query = 'SELECT * FROM book where topic in (';
foreach($_GET["topic"] as $input_topic)
     $query .="'$input_topic', ";
$query.="'XXX')"; //hack to deal with last comma from foreach
echo "query: $query "; //For debugging
$result = mysql_query($query) or die('Query failed: ' . mysql_error());

// Printing results in HTML
echo "<table border = \"1\">\n";
while ($line = mysql_fetch_array($result, MYSQL_ASSOC)) {
    echo "\t<tr>\n";
    foreach ($line as $col_value) {
        echo "\t\t<td>$col_value</td>\n";
    }
    echo "\t</tr>\n";
}
echo "</table>\n";

// Free resultset
mysql_free_result($result);

// Closing connection
mysql_close($link);
?> 
