<?php
	include 'conn.php';
	$itemcode = $_REQUEST['item_code'];
	$itemname = $_REQUEST['item_name'];
	$itemprice = $_REQUEST['price'];
	$itemstock = $_REQUEST['stock'];
	// sql to delete a record
	$sql = "UPDATE tb_item set item_name='".$itemname."',"."price='".$itemprice."',"."stock='".$itemstock."'"."WHERE item_code='".$itemcode."'";
	$result = mysqli_query($connect, $sql); 
	echo json_encode($result);
?>