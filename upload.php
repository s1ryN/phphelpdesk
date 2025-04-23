<?php
//Logika pro nahrání profilového obrázku
require 'conn.php';

//Zkontroluje přihlášení
if (!isset($_SESSION['idOsoba'])) {
    header("Location: index.php");
    exit;
}

//Přenesení SESSION proměnné na PHP proměnnou
$idOsoba = $_SESSION['idOsoba'];

//Kontrola odeslání příkazu pro změnu profilovky
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_FILES['profilepicture'])) {
    $errors = [];
    $file_name = $_FILES['profilepicture']['name'];
    $file_size = $_FILES['profilepicture']['size'];
    $file_tmp = $_FILES['profilepicture']['tmp_name'];
    $file_type = $_FILES['profilepicture']['type'];
    $file_ext = strtolower(pathinfo($file_name, PATHINFO_EXTENSION));
    
    //Povolené formáty
    $extensions = ["jpeg", "jpg", "png"];
    
    //Kontrola formátu
    if (in_array($file_ext, $extensions) === false) {
        $errors[] = "Soubor musí být ve formátu .jpeg, .jpg nebo .png.";
    }

    //Kontrola maximální velikosti profilovky
    if ($file_size > 20971520) {
        $errors[] = 'Složka musí mít méně než 20 MB';
    }
    
    //Kontrola jestli není žádný error
    if (empty($errors)) {
        //Upload dat ohledně obrázku a samotného obrázku do DB
        $upload_dir = "uploads/";
        if (!file_exists($upload_dir)) {
            mkdir($upload_dir, 0755, true);
        }
        $new_file_name = $upload_dir . uniqid() . '.' . $file_ext;
        if (move_uploaded_file($file_tmp, $new_file_name)) {
            $query = "UPDATE osoba SET profilepicture = ? WHERE idOsoba = ?";
            $stmt = $conn->prepare($query);
            $stmt->bind_param("si", $new_file_name, $idOsoba);
            //Dotaz prošel
            if ($stmt->execute()) {
                header("Location: profil.php");
                exit;
            //Nahrávání se nepovedlo
            } else {
                $errors[] = "Nešlo nahrát do databáze.";
            }
        } else {
        //Nahrávání se nepovedlo
            $errors[] = "Soubor nešel nahrát.";
        }
    }
    
    if (!empty($errors)) {
        foreach ($errors as $error) {
            echo $error . "<br>";
        }
    }
}

$conn->close();
?>
