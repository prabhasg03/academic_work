<HTML>
<title>Reverse</title>
<form name="frm3" method="POST" action="5b.php">
Enter number to be reversed:
<input type='text' name='r'>
<input type='submit' name='s' value='Get Reverse Number'>
</form>
<?php
if(isset($_POST['s'])){
    $x=$_POST['r'];
    $s=0;
    do{
        $r1=$x%10;
        $s=($s*10)+$r1;
        $x=(int)($x/10);
    }while($x>0);
    print("\nReverse of is".$s);
}
?>
</body>
</html>