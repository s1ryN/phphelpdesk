<?php
//Načtení dat o osobě z databáze
require 'conn.php';

//Kontrola přihlášení
if (!isset($_SESSION['idOsoba'])) {
    header("Location: index.php");
    exit;
}

//Nastavení PHP proměnné ze SESSION proměnné
$idOsoba = $_SESSION['idOsoba'];

//Dotaz na databázi
$query = "SELECT * FROM osoba WHERE idOsoba = ?";
$stmt = $conn->prepare($query);
$stmt->bind_param("i", $idOsoba);
$stmt->execute();
$result = $stmt->get_result();
$user = $result->fetch_assoc();
$conn->close();
?>

<!DOCTYPE html>
<html lang="cs">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
      display: flex;
      flex-direction: column;
      min-height: 100vh;
    }

    .header {
      background-color: #333;
      color: #fff;
      padding: 10px;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    .logo {
      display: flex;
      align-items: center;
    }

    .logo img {
      width: 100px;
      height: auto;
      margin-right: 10px;
    }

    .support {
      margin-right: 20px;
    }

    .helpdesk {
      font-size: 1.5em;
      font-weight: bold;
    }

    .menu-buttons {
      display: flex;
      align-items: center;
    }
    .logout-button,
    .user-button,
    .problem-button,
    .specific-problem-button {
      background-color: #4CAF50;
      color: white;
      padding: 10px;
      border: none;
      border-radius: 5px;
      cursor: pointer;
    }

    .logout-button:hover,
    .user-button:hover,
    .problem-button:hover,
    .specific-problem-button:hover {
      background-color: #45a049;
    }
    .menu-content {
      padding: 20px;
      flex: 1;
    }

    footer {
      background-color: #333;
      color: #fff;
      padding: 20px;
      text-align: center;
    }

    footer .logo img {
      margin-right: 0;
      width: 80px;
      height: auto;
    }

    .profile-container {
      max-width: 600px;
      margin: 70px auto 50px;
      padding: 20px;
      border: 1px solid #ddd;
      border-radius: 5px;
    }

    .profile-item {
      margin-bottom: 10px;
    }

    .menu-buttons a {
      margin-left: 10px;
    }
  </style>
  <title>Profil</title>
</head>

<body>
<div class="header">
  <div class="logo">
    <img src="SAKUB.png" alt="Logo"> 
    <span class="helpdesk">Helpdesk</span>
  </div>
  <div class="menu-buttons">
    <a href="index.php"><button class="logout-button">Odhlásit</button></a>
    <a href="menu.html"><button class="user-button">Menu</button></a>
  </div>
</div>

<div class="menu-content">
  <div class="profile-container">
    <h2>Profil uživatele</h2>
    <!-- Načtení uživatelských dat -->
    <div class="profile-item"><strong>Uživatelské jméno:</strong> <?php echo htmlspecialchars($user['prihlasjmeno']); ?></div>
    <div class="profile-item"><strong>Jméno:</strong> <?php echo htmlspecialchars($user['jmeno']); ?></div>
    <div class="profile-item"><strong>Příjmení:</strong> <?php echo htmlspecialchars($user['prijmeni']); ?></div>
    <div class="profile-item"><strong>Role:</strong> <?php echo htmlspecialchars($user['Role_idRole']); ?></div>
    <div class="profile-item"><strong>Lokace:</strong> <?php echo htmlspecialchars($user['Lokace_idLokace']); ?></div>
    <div class="profile-item">
      <strong>Profilový obrázek:</strong> 
      <img src="<?php echo htmlspecialchars($user['profilepicture']); ?>" alt="Profile Picture" style="width: 100px; height: auto;">
    </div>
    <div class="profile-item">
      <form action="upload.php" method="post" enctype="multipart/form-data">
        <label for="profilepicture">Změnit profilový obrázek:</label>
        <input type="file" name="profilepicture" id="profilepicture" required>
        <button type="submit">Nahrát</button>
      </form>
    </div>
  </div>
</div>

<footer>
  <div class="logo">
    <img src="SAKUB.png" alt="Logo">
  </div>
  <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet.</p>
  <p>Donec venenatis vulputate lorem. Maecenas vestibulum mollis diam. Pellentesque ultrices ultrices sapien, nec tincidunt nunc posuere ut. Maecenas vestibulum mollis diam.</p>
</footer>

</body>
</html>
