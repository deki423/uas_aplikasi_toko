<?php
	include 'conn.php';
	
	$queryResult = $connect->query("SELECT * FROM tb_item");
	$result = array();
	while($fetchData = $queryResult->fetch_assoc()){
		//print_r($fetchData);
		$result[] = $fetchData;
	}
	echo json_encode($result);
?>