<!DOCTYPE html>
<html>
<head>
<style>
table {
  width: 100%;
  border-collapse: collapse;
}
table, td, th {
  border: 1px solid black;
  padding: 5px;
}
th {text-align: left;}
</style>
</head>
<body>
<?php
$q = intval($_GET['q']);
$con = mysqli_connect('localhost','root','','test');
$sql="SELECT * FROM users WHERE ID = '".$q."'";
$result = mysqli_query($con,$sql);
echo "<table>
<tr>
<th>ID</th>
<th>Username</th>
<th>Phonenumber</th>
<th>Email-Id</th>
<th>Place</th>
</tr>";
while($row = mysqli_fetch_array($result)) {
  echo "<tr>";
  echo "<td>" . $row['ID'] . "</td>";
  echo "<td>" . $row['username'] . "</td>";
  echo "<td>" . $row['phno'] . "</td>";
  echo "<td>" . $row['EmailID'] . "</td>";
  echo "<td>" . $row['Place'] . "</td>";
  echo "</tr>";
}
echo "</table>";
mysqli_close($con);
?>
</body>
</html>