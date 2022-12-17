<?php
include 'conn.php';

$itemcode = $_REQUEST ['item_code'];
$sql = "DELETE FROM tb_item WHERE item_code = '".$itemcode."'";
mysqli_query($connect,$sql);

?>