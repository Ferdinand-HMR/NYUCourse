<?php

function authenticateUser($connection, $username, $password)
{
  // Test the username and password parameters
  if (!isset($username) || !isset($password))
    return false;

  // Create a digest of the password collected from
  // the challenge
  $password_digest = md5(trim($password));

  // Formulate the SQL find the user
  $query = "SELECT password FROM users WHERE user_name = '{$username}'
            AND password = '{$password_digest}'";

  if (!$result = @ mysql_query ($query, $connection))
    showerror();

  // exactly one row? then we have found the user
  if (mysql_num_rows($result) != 1)
    return false;
  else
    return true;
}
?>
