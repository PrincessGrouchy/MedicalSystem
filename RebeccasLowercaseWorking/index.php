<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <link rel="stylesheet" href="./css/style.css">
</head>
<body>
  <header class="header-banner">
    <div class="container-width">
      <div class="logo-container">
        <div class="logo">
          471 Medical Project
        </div>
      </div>
      <nav class="menu"></nav>
      <div class="clearfix"></div>
      <div class="lead-title">
        Welcome!
      </div>
      <div class="row" id="it3pb3">
        <div class="cell" id="idnvug">
<?php
if( isset($_GET['error']) ){
    echo "<h3><b><u><font color=\"red\">Incorrect Username or Password</font></b></u></h3>";
}?>
          <form class="form" action = "php_result.php" method = "post">
            <div class="form-group">
              <label class="label">
                Username
              </label>
              <input placeholder="Username" required class="input" name = "username"/>
            </div>
            <div class="form-group">
              <label class="label">
                Password
              </label>
              <input type="password" placeholder="" required class="input" name = "password"/>
            </div>
            <div class="form-group">
            </div>
            <div class="form-group">
              <button type="submit" class="button" name = "submit">
                Login
              </button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </header>
</body>
<html>
