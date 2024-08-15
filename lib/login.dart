import 'package:flutter/material.dart';
import 'package:katalog_film/data/login_data.dart';
import 'package:katalog_film/models/login_data.dart';
import 'package:katalog_film/movies.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  String test = 'Halo';
  static String user = "";
  static String pass = "";
  int repeat = 0;

  @override
  void initState() {
    super.initState();
    repeat = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Expanded(
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
                  'Movie Catalog',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                        child: TextFormField(
                          controller: userController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Username',
                              prefixIcon: Icon(Icons.person)),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Username can't be empty";
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: TextFormField(
                          controller: passController,
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 16),
                        child: Row(
                          children: [
                            Text(
                              "Don't have an account yet?",
                              style: TextStyle(fontSize: 12),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            new InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, '/register');
                              },
                              child: new Text(
                                "Create an account here",
                                style: TextStyle(
                                    fontSize: 12,
                                    decoration: TextDecoration.underline),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        child: Center(
                          child: ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                if (userController.text == 'admin' &&
                                    passController.text == 'admin123') {
                                  LoginData().setLoginData(
                                      userController.text, passController.text);
                                  Navigator.pushReplacementNamed(
                                      context, '/movie');
                                } else {
                                  if (repeat == 0) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                'User data is not found!')));
                                    repeat++;
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                'Username : "admin" Password : "admin123"')));
                                    repeat--;
                                  }
                                }
                              }
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(fontSize: 16),
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                foregroundColor: Colors.white,
                                minimumSize: const Size(150, 50)),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
