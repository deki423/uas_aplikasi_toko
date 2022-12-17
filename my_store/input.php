<?php
	include 'conn.php';
	$itemcode = $_REQUEST['item_code'];
	$itemname = $_REQUEST['item_name'];
	$itemprice = $_REQUEST['price'];
	$itemstock = $_REQUEST['stock'];
	// sql to delete a record
	$sql = "INSERT INTO tb_item (item_code,item_name,price,stock) VALUES ("."'".$itemcode."',"."'".$itemname."',".$itemprice.",".$itemstock.")";
	$result = mysqli_query($connect, $sql); 
	echo json_encode($result);
?>