class API{
  static const hostConnect = "http://192.168.0.101/api_taller3"; //cambiar el numero de direccion ip por la del pc
  static const hostConnectUser = "http://192.168.0.101/api_taller3/user";

  //registro usuario
  static const validateEmail = "$hostConnect/user/validate_email.php";
  static const signUp = "$hostConnect/user/signup.php";
  static const login = "$hostConnect/user/login.php";
}