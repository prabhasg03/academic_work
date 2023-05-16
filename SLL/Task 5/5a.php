<html>
<head>
<title>FACTORIAL OF A NUMBER</title>
</head>
<body>
<font size=5>FACTORIAL OF A NUMBER</font>
<br><br/>
<form action="5a.php" method="get">
ENTER A NUMBER:<input type="text" name="t1"><br><br>
<input type="submit" value="FACTORIAL">
<?php
if(isset($_GET["t1"]))
{ 
$n=$_GET["t1"];
$fact=1;
echo "<br></br>";
echo "Factorial of $n is: ";
while($n>0)
{
$fact=$fact*$n;
$n--;
}
echo "$fact";
}
?>
</form>
</body>
</html>