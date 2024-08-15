import 'package:flutter/material.dart';
import 'package:katalog_film/data/login_data.dart';
import 'package:katalog_film/data/user_data.dart';
import 'package:katalog_film/models/user.dart';

class EditAccount extends StatefulWidget {
  const EditAccount({super.key});

  @override
  State<EditAccount> createState() => _EditAccountState();
}

class _EditAccountState extends State<EditAccount> {
  late TextEditingController nameController = TextEditingController();
  late TextEditingController usernameController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  late User currentUser;

  @override
  void initState() {
    super.initState();

    String loggedInUsername = LoginData().username.toString();
    currentUser = UserData()
        .users
        .firstWhere((user) => user.username == loggedInUsername);

    nameController.text = currentUser.name;
    usernameController.text = currentUser.username;
    passwordController.text = currentUser.password;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Image.asset('assets/movie.jpg'),
                  Text(
                    'Edit Profile',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: 16, bottom: 8, right: 16, left: 16),
                          child: TextFormField(
                            maxLength: 20,
                            controller: nameController,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Name',
                                prefixIcon: Icon(Icons.person)),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Name can't be empty";
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 16, bottom: 8, right: 16, left: 16),
                          child: TextFormField(
                            controller: usernameController,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Username',
                                prefixIcon: Icon(Icons.account_circle)),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Username can't be empty";
                              }
                              if (UserData().users.any((user) =>
                                  user.username == value &&
                                  user.username != value)) {
                                return "Username already exists";
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 16, bottom: 8, right: 16, left: 16),
                          child: TextFormField(
                            controller: passwordController,
                            obscureText: true,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Password',
                                prefixIcon: Icon(Icons.key)),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Password can't be empty";
                              }
                              if (value.length < 5) {
                                return "Password must have 5 characters minimum";
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          child: Center(
                            child: ElevatedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  setState(() {
                                    currentUser.name = nameController.text;
                                    currentUser.username =
                                        usernameController.text;
                                    currentUser.password =
                                        passwordController.text;
                                  });

                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text('Account Updated!')));
                                  LoginData().name = currentUser.name;
                                  LoginData().username = currentUser.username;
                                  LoginData().password = currentUser.password;
                                  Navigator.pushNamed(context, '/profile');
                                }
                              },
                              child: Text(
                                'Submit',
                                style: TextStyle(fontSize: 16),
                              ),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  foregroundColor: Colors.white,
                                  minimumSize: const Size(150, 50)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
