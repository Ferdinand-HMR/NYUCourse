<html>
<body>
<form action = "get-input-example.php" method="GET">
<?php
// Connecting, selecting database
$connection = mysql_connect('pdc-amd01', 'pfrankl', 'topsecret')
    or die('Could not connect: ' . mysql_error());
// echo 'Connected successfully';
mysql_select_db('pfrankl') or die('Could not select database');
$tableName = 'book';
$attributeName = 'topic';
$pulldownName = 'topic';
$defaultVaule = 'No Topic';
 
print "Choose a topic<br>";
//  function selectDistinct ($connection, $tableName, $attributeName,
//                           $pulldownName, $defaultValue)
 // {
     $defaultWithinResultSet = FALSE;

     // Query to find distinct values of $attributeName in $tableName
     $distinctQuery = "SELECT DISTINCT {$attributeName} FROM
                       {$tableName}";

     // Run the distinctQuery on the databaseName
     if (!($resultId = @ mysql_query ($distinctQuery, $connection)))
        showerror();

     // Start the select widget
     print "\n<select name=\"{$pulldownName}\">";

     // Retrieve each row from the query
     while ($row = @ mysql_fetch_array($resultId))
     {
       // Get the value for the attribute to be displayed
       $result = $row[$attributeName];

       // Check if a defaultValue is set and, if so, is it the
       // current database value?
       if (isset($defaultvalue) && $result == $defaultValue)
          // Yes, show as selected
          print "\n\t<option selected value=\"{$result}\">{$result}";
       else
          // No, just show as an option
          print "\n\t<option value=\"{$result}\">{$result}";
       print "</option>";
     }
     print "\n</select>";
//  } // end of function
?>
<br>
<input type = "submit" value = "Show books">
</form>
</body>
</html>
