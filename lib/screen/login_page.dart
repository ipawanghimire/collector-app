import 'package:flutter/material.dart';
import 'package:hoeizon_app/screen/add_user.dart';
import 'package:hoeizon_app/screen/bottom_nav.dart';
import 'package:hoeizon_app/screen/widget/text_form_field.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

final TextEditingController loginpasswordController =
    TextEditingController(text: '12345');
TextEditingController loginemailController =
    TextEditingController(text: 'pawan');

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void dispose() {
    loginemailController.dispose();
    loginpasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.green],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Center(
            child: Container(
              margin: const EdgeInsets.fromLTRB(30, 80, 30, 40),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: Text(
                      "WELCOME",
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 48, right: 48, top: 30),
                    child: ReusableTextFormField(
                      fontSize: 26,
                      leftIcon: const Icon(
                        Icons.person,
                        size: 26,
                        color: Colors.black,
                      ),
                      label: 'Username',
                      textColor: Colors.black,
                      underlineColor: Colors.grey,
                      controller: loginemailController,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 48, right: 48, top: 10),
                    child: ReusableTextFormField(
                      fontSize: 26,
                      leftIcon: const Icon(
                        Icons.lock,
                        size: 26,
                        color: Colors.black,
                      ),
                      label: 'Password',
                      textColor: Colors.black,
                      underlineColor: Colors.grey,
                      controller: loginpasswordController,
                      password: true,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 30),
                    child: ElevatedButton(
                      onPressed: () {
                        handleLogin(context);
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Colors.blue, Colors.green],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          borderRadius: BorderRadius.circular(32),
                        ),
                        child: const Center(
                          child: Text(
                            "Login",
                            style: TextStyle(color: Colors.white, fontSize: 26),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 80,
                          child: Image.asset(
                            "assets/images/logo.png",
                            fit: BoxFit.fill,
                          ),
                        ),
                        const Text(
                          "Horizon Technology Pvt. Ltd.",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Jawalakhel, Lalitpur',
                            style: TextStyle(fontSize: 26),
                          ),
                        ),
                        const Align(
                          alignment: Alignment.center,
                          child: Text(
                            "01-4499030, 9851193614",
                            style: TextStyle(fontSize: 26),
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const CreateUserPage()),
                              );
                            },
                            child: const Text('add user'))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> handleLogin(BuildContext context) async {
  // Show loading indicator
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    },
  );

  // Open the database
  final database = await openDatabase(
    join(await getDatabasesPath(), 'my_database.db'),
  );

  String enteredUsername = loginemailController.text;
  String enteredPassword = loginpasswordController.text;

  // Query the database for the user
  final users = await database.rawQuery(
    'SELECT * FROM user WHERE username = ?',
    [enteredUsername],
  );

  // Hide loading indicator
  Navigator.pop(context);

  // Check if the user exists and the password matches
  if (users.isNotEmpty && users.first['password'] == enteredPassword) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const BottomNavigation()),
    );
  } else {
    // Show error message
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
          content: Text(
        'Invalid username or password',
        style: TextStyle(color: Colors.red),
      )),
    );
  }
}
