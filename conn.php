<?php
//Konektor pro připojení databáze
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "jakubzeman";

$conn = new mysqli($servername, $username, $password, $dbname);

//Zapnutí session
session_start();

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>
