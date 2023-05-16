<html>
<body>
<?php
$con=mysqli_connect("localhost","root","","test");
if($con)
print "connection established"."<br>";
else
print "connection failed".mysqli_error();
mysqli_select_db($con,"test");
mysqli_query($con,"create table reg1(uname varchar(25) primary key,email varchar(25),password varchar(15),age int)");
?>
</body>
</html>