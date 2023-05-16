<?php
session_start();
$t=$_REQUEST['etime'];
$exp=date("1,d-m-y h:i:s",time());
if($t<$exp)
echo "<center><h1>Page Time Expired</h1></center>";
else
{
26
echo "<center><h2>Name : ",$_REQUEST['uname'];
echo "<center><h2>City : ",$_REQUEST['city'];
echo "<center><h2>Phone NO : ",$_REQUEST['pno'];
session_destroy();
} 
?>