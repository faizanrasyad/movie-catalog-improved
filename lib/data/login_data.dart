class LoginData {
  static final LoginData _instance = LoginData._internal();

  factory LoginData() {
    return _instance;
  }

  LoginData._internal();

  String? username;
  String? password;

  void setLoginData(String username, String password) {
    this.username = username;
    this.password = password;
  }

  String? getUsername() {
    return username;
  }

  String? getPassword() {
    return username;
  }
}
