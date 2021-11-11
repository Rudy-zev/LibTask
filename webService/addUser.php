<?php 

include('configServ.php');

$firstname=$_POST['firstname'];
$lastname=$_POST['lastname'];
$username=$_POST['username'];
$password=$_POST['password'];
$admin=$_POST['admin'];

    $sql = "INSERT INTO user (firstname, lastname, username, password, admin) VALUES ('$firstname', '$lastname', '$username', '$password', '$admin')";

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
