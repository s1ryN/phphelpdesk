<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
    }

    .header {
      background-color: #333;
      color: #fff;
      padding: 14px;
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

    .login-container {
      max-width: 400px;
      margin: 200px auto 50px;
      padding: 20px;
      border: 1px solid #ddd;
      border-radius: 5px;
    }

    form {
      display: flex;
      flex-direction: column;
    }

    label {
      margin-bottom: 5px;
    }

    input {
      padding: 8px;
      margin-bottom: 15px;
    }

    button {
      background-color: #4CAF50;
      color: white;
      padding: 10px;
      border: none;
      border-radius: 5px;
      cursor: pointer;
    }

    button:hover {
      background-color: #45a049;
    }
  </style>
  <title>Přihlášení</title>
</head>
<body>

<div class="header">
  <div class="logo">
    <img src="SAKUB.png" alt="Logo">
    <span class="helpdesk">Helpdesk</span>
  </div>
</div>

<div class="login-container">
  <?php if (isset($_GET['error']) && $_GET['error'] == 'invalid'): ?>
    <!--Error pokud uživatel zadal špatné údaje -->
    <p style="color: red;">Špatné přihlašovací údaje.</p>
  <?php endif; ?>
  <form action="login.php" method="post">
    <label for="username">Jméno:</label>
    <input type="text" id="username" name="username" required>

    <label for="password">Heslo:</label>
    <input type="password" id="password" name="password" required>

    <button type="submit">Přihlásit se</button>
  </form>
</div>

</body>
</html>
