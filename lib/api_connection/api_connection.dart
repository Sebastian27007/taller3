class API{
  static const hostConnect = "http://172.16.144.162/api_taller3"; //cambiar el numero de direccion ip por la del pc
  static const hostConnectUser = "http://172.16.144.162/api_taller3/user";

  //registro usuario
  static const validateEmail = "$hostConnect/user/validate_email.php";
  static const signUp = "$hostConnect/user/signup.php";
  static const login = "$hostConnect/user/login.php";
}