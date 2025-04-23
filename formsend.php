<?php
//Odeslání formuláře
require 'conn.php';

//Ujištění že je uživatel přihlášený
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (!isset($_SESSION['idOsoba'])) {
        die('Prosím znovu se přihlašete.');
        header("Location: index.php");
        exit;
    }
    if (!isset($_SESSION['idOsoba'])) {
        header("Location: index.php"); 
        exit;
    }

    //Nastavení PHP proměnných
    $osoba_id = $_SESSION['idOsoba']; 
    $popis = $_POST['description'];
    $jmeno = $_POST['name'];
    $prijmeni = $_POST['surname']; 
    $kategorie = $_POST['department'];
    $stav_id = 1;
    $priorita_id = $_POST['priority'];

    //Připravení statementu pro vložení ticketu do databáze
    $stmt = $conn->prepare("INSERT INTO ticket (popis, jmeno, prijmeni, kategorie, Osoba_idOsoba, Stav_idStav, Priorita_idPriorita) VALUES (?, ?, ?, ?, ?, ?, ?)");
    $stmt->bind_param("ssssiii", $popis, $jmeno, $prijmeni, $kategorie, $osoba_id, $stav_id, $priorita_id);

    //Odeslání ticketu - projde/neprojde
    if ($stmt->execute()) {
        header("Location: odeslano.html");
        exit();
    } else {
        echo "Error: " . $stmt->error;
    }

    $stmt->close();
}

?>
