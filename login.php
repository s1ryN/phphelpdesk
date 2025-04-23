<?php
//Logika pro přilášení
session_start();
require 'conn.php'; 

//Nastavení PHP proměnných a jejich převzetí z HTML proměnných
$username = $_POST['username'];
$password = $_POST['password'];

//Zabezpečení vůči MySQL injectionu - očištění zadaných údajů
$username = mysqli_real_escape_string($conn, $username);
$password = mysqli_real_escape_string($conn, $password);

//Dotaz na databázi
$query = "SELECT idOsoba FROM osoba WHERE prihlasjmeno='$username' AND heslo='$password'";
$result = $conn->query($query);

//Výsledek dotazu - pokud je pouze jeden správný výsledek, proběhne přihlášení, jinak vyhodí error
if ($result->num_rows == 1) {
    $user = $result->fetch_assoc();
    $_SESSION['idOsoba'] = $user['idOsoba'];
    header("Location: menu.html");
    exit;
} else {
    header("Location: index.php?error=invalid");
    exit;
}

$conn->close();
?>
