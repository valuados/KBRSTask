<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <meta charset="utf-8">
    <title>Ajax request</title>

    <script src="javascript/jquery-3.1.0.js"></script>
    <script src="javascript/ajax.js"></script>
    <script type="text/javascript" src="javascript/login.js"></script>
    <script type="text/javascript" src="javascript/login_overlay.js"></script>

    <link rel="stylesheet" href="css/overlay.css" type="text/css">
  </head>
  <body>

  <span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776; Login</span>

  <div id="myNav" class="overlay">
    <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
    <div class="overlay-content">
      <form id="loginField">
        <p><input id="login" type="text" size="20"></p>
        <p><input id="password" type="password" size="20"> </p>
        <input id="contactButton" type="submit"value="Authorise">
        <p class="fail"></p>
      </form>
    </div>
    <form><p class="displayUser"></p></form>
    </div>

  </div>


  <p class="large"> How to make Ajax call</p>
  <form id="updateUsername">
    <label for="username">What is your name?</label>
    <input type="text" id="username" name="username"/>
    <input type="submit" value="Submit"/>
  </form>
  <p class="displayName"></p>
  <hr/>
  <div>

  </div>
  </body>
</html>
