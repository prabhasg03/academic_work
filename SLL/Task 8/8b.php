<html>
<body>
<?php
$con=mysqli_connect("localhost","root","","test");
if($con)
print "connection established"."<br>";
else
print "connection failed".mysqli_error();
mysqli_select_db($con,"test");
mysqli_query($con,"delete from student2 where sname='balu'");
$query=mysqli_query($con,("select * from student2"));
$rows=mysqli_num_rows($query);
echo "<table><tr><th>serialno.</th><th>student name</th></tr>";
for($j=0;$j<$rows;++$j)
{
$row=mysqli_fetch_row($query);
echo "<tr>";
for($k=0;$k<2;++$k)
echo "<td>$row[$k]</td>";
echo "</tr>";
}
echo "<table>";
print "no. of rows in table are ";
print $rows;
mysqli_close($con);
?>
</html>