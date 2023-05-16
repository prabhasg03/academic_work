<?php
setcookie("Auction_item","luxurycar", time()+2*24*60*60);
?>
<html>
<body>
<?php
if(isset($_COOKIE["Auction_item"])) {
echo "Auction item is a" .$_COOKIE["Auction_item"];
} else {
echo "no item for auction";
}
?>
</body>
</html>