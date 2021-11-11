<?php

include('configServ.php');

$iduser=$_POST['iduser'];
$title=$_POST['title'];
$description=$_POST['description'];

$sql = "INSERT INTO task (iduser, title, description) VALUES ('$iduser', '$title', '$description')";

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

