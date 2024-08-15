import 'package:flutter/material.dart';
import 'package:katalog_film/data/item_data.dart';
import 'package:katalog_film/data/login_data.dart';
import 'package:katalog_film/models/login_data.dart';
import 'package:katalog_film/widgets/bottomnavbar.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool kembali = false;

  void _showLogoutConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          title: Text(
            'Logout',
            style: TextStyle(color: Colors.white),
          ),
          content: Text(
            'Are you sure you want to logout?',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            TextButton(
              child: Text(
                'Cancel',
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(
                'Yes',
                style: TextStyle(color: Colors.green),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushReplacementNamed(context, '/login');
                LoginData().name = "";
                LoginData().username = "";
                LoginData().password = "";
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(selectedItem: 1),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showLogoutConfirmationDialog();
        },
        child: Icon(
          Icons.logout,
          color: Colors.red,
          size: 35,
        ),
        backgroundColor: const Color.fromARGB(255, 255, 136, 127),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/default_profile_icon.png',
                width: 200,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                LoginData().getName().toString(),
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 50),
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/editAccount');
                },
                child: Text(
                  'Edit Account',
                  style: TextStyle(fontSize: 16),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(150, 50)),
              ),
            ),
          )
        ],
      )),
    );
  }
}
