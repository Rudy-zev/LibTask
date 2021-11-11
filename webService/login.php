<?php

include('configServ.php');
    
$username=$_POST['username']; 
$password=$_POST['password']; 

$sql = "SELECT admin, username FROM user WHERE username='$username' AND password='$password'";

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
