<!DOCTYPE html>
<html>
<head>
<title>Registration</title>
</head>
<body>
<?php
require('db.php');
if (isset($_REQUEST['submit'])){
$username = $_REQUEST['username'];
$email = $_REQUEST['email'];
$password = $_REQUEST['password'];
$age = $_REQUEST['age'];
$query = "INSERT into `reg1` (uname,email,password,age) values('$username','$email','$password', '$age')";
$result = mysqli_query($con,$query);
if($result){
echo "<h3>You are registered successfully.</h3>
<br/>Click here to <a href='7c.php'>Login</a></div>";
}
}
else{
?>
<div class="form">
<h1>Registration</h1>
<form name="registration" action="7b.php" method="post">
<input type="text" name="username" placeholder="Username" required />
<input type="email" name="email" placeholder="Email" required />
<input type="password" name="password" placeholder="Password" required />
<input type="text" name="age" placeholder="age" required />
<input type="submit" name="submit" value="Register" />
</form>
</div>
<?php 
} 
?>
</body>
</html>