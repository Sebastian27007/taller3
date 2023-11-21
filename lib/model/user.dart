class User{
  int user_ID;
  String user_name;
  String user_email;
  String user_password;

  User(
      this.user_ID,
      this.user_name,
      this.user_email,
      this.user_password,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
    int.parse(json["user_id"]),
    json["user_name"],
    json["user_email"],
    json["user_password"],
  );

  Map<String, dynamic> toJson() => {
    'ID_usuario': user_ID.toString(),
    'user_name' : user_name,
    'user_email' : user_email,
    'user_password' : user_password,
  };

}