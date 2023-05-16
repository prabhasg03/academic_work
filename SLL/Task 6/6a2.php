<?php
session_start();
$t=$_REQUEST['etime'];
$exp=date("1,d-m-y h:i:s",time());
if($t<$exp)
echo "<center><h1>Page Time Expired</h1></center>";
else
{
echo "<center><h2>Name:".$_REQUEST['uname']."</h2></center>";
echo "<center><h2>City:".$_REQUEST['City']."</h2></center>";
echo "<center><h2>Phone No:".$_REQUEST['pno']."</h2></center>";
session_destroy();
}
?>