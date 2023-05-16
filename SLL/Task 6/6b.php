<html>
<body>
<?php
setcookie("user","sonuu", time()+172800);
if(!isset($_COOKIE["user"])) { 
echo "Sorry, cookie is not found!"; 
} else { 
echo "Cookie Value: ",$_COOKIE["user"]; 
} 
?>
</body>
</html>
<?php
setcookie("user","", time()-60); 
?>