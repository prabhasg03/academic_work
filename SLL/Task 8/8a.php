<html>
<?php
$con=mysqli_connect("localhost","root","","test");
if($con)
print "connection established"."<br>";
else
print "connection failed".mysqli_error();
mysqli_select_db($con,"test");
mysqli_query($con,"create table student2(sno int primary key,sname varchar(25))");
mysqli_query($con,"insert into student2 values(590,'kittu')");
mysqli_query($con,"insert into student2 values(595,'balu')");
mysqli_query($con,"insert into student2 values(587,'madhu')");
mysqli_query($con,"update student2 set sname='jaanu' where sno=587");
$query=mysqli_query($con,"select * from student2");
$rows=mysqli_num_rows($query);
echo"<table><tr><th>serial no</th><th>student name</th></tr>";
for($j=0;$j<$rows;++$j)
{
$row=mysqli_fetch_row($query);
echo"<tr>";
for($k=0;$k<2;++$k)
echo"<td>$row[$k]</td>";
echo"</tr>";
}
echo"</table>";
mysqli_close($con);
?>
</html>