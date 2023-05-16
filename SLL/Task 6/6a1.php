<html>
<body>
<form action="6a1.php" method="post">
<center>
<h2> Enter Username : <input type="text" name="name"></h2>
<h2> Enter Password : <input type="password" name="pwd"></h2>
<input type="submit" value="Login">
</center>
</form>
</body>
</html>
<?php
session_start();
$t=date("1,d-m-y h:i:s",time()+10);
if($_REQUEST['name']=='xyz'&& $_REQUEST['pwd']=='xyz')
{
?>
<html>
<body>
<h1><u><center>enterur details</center></u></h1>
<form action="6a2.php" method=get>
<input type='hidden' name='etime' value="<?php echo $t?>">
<h2> Enter Name : <input type=textbox name=uname></h2><br>
<h2> Enter City : <input type=textbox name=city></h2><br>
<h2> Enter Phone No : <input type=textbox name=pno></h2><br>
<input type=submit name=submit value=DISPLAY>
</form>
</body>
</html>
<?php
}
else 
echo "<center><h1>Invalid Username Or Password</h1></center>";
?>