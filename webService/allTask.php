<?php 

include('configServ.php');

$iduser=$_POST['iduser']; 

$sql = "SELECT * FROM task WHERE iduser='$iduser'";

if($result = mysqli_query($con, $sql))
{
	$resultArray = array();
	$tempArray = array();

	while($row = $result->fetch_object())
	{
		$tempArray = $row;
		array_push($resultArray, $tempArray);
	}

	echo json_encode($resultArray);
}

mysqli_close($con);

?>
