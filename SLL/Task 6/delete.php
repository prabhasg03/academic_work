<?php
setcookie("auctionitem","luxurycar", time()+2*24*60*60);
?>
<html>
<body>
<?php
setcookie("auctionitem"," ",time()-60);
?>
<?php
echo "cookie is deleted";
?>
</body>
</html>