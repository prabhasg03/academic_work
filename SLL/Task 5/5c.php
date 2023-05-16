<html>
<head>
<title>Sum of Digits</title>
</head>
<body>
<form name="my form" action="5c.php" method="POST">
enter the number:<br>
<input type="text" name="t1"><br>
<input type="submit" value="submit" name="s1">
</form>
</body>
</html>
<?php
$sum=0;
$rem=0;
if(isset($_POST['s1']))
{
$num=$_POST['t1'];
for($i=0;$i<=strlen($num);$i++)
{ 
$rem=$num%10; 
$sum = $sum + $rem; 
$num=$num/10; 
} 
}
echo "$sum";
?>