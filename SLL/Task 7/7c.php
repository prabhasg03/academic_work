<!DOCTYPE html>

<html>

<head>

<title>Login</title>

</head>

<body>

<?php

require('7a.php');

if (isset($_POST['submit']))

{

 $username = $_REQUEST['username'];

$password = $_REQUEST['password'];

 $query = "SELECT * FROM `reg1` WHERE uname='$username' and

password='$password' ";

$result = mysqli_query($con, $query);

 $rows =mysqli_num_rows($result);

 if($rows==1)

{

echo " Welcome $username. Login successfull";

echo "<p><a href='7c.php'>Logout</a></p>";

}

 else

{

echo "<h3>Username/password is incorrect.</h3>

<br/>Click here to <a href='7c.php'>Login</a></div>";

}

}

else{

?>

<div class="form">

<h1>Log In</h1>

<form action="7c.php" method="post" name="login">

<input type="text" name="username" placeholder="Username" required />

<input type="password" name="password" placeholder="Password" required />

<input name="submit" type="submit" value="Login" />

</form>

<p>Not registered yet? <a href='7b.php'>Register Here</a></p>

</div>

<?php } ?>

</body>

</html> 