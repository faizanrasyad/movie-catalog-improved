import 'package:katalog_film/models/user.dart';

class UserData {
  static final UserData _instance = UserData._internal();

  factory UserData() {
    return _instance;
  }

  UserData._internal();

  List<User> users = [
    User(name: 'Admin', username: 'admin', password: 'admin123')
  ];
}
