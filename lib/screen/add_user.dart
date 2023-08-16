import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

final TextEditingController userusernameController = TextEditingController();
final TextEditingController userpasswordController = TextEditingController();

class CreateUserPage extends StatefulWidget {
  const CreateUserPage({super.key});

  @override
  _CreateUserPageState createState() => _CreateUserPageState();
}

class _CreateUserPageState extends State<CreateUserPage> {
  @override
  void dispose() {
    userusernameController.dispose();
    userpasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create User')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: userusernameController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            TextFormField(
              controller: userpasswordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final db = await openMyDatabase();
                await createTableIfNotExists(db);
                await insertUser(db);
                Navigator.pop(context);
              },
              child: const Text('Create User'),
            ),
          ],
        ),
      ),
    );
  }
}

Future<Database> openMyDatabase() async {
  final databasesPath = await getDatabasesPath();
  final path = join(databasesPath, 'my_database.db');
  return openDatabase(path, onCreate: (db, version) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS user (
        id INTEGER PRIMARY KEY,
        username TEXT,
        password TEXT
      )
    ''');
  }, version: 1);
}

Future<void> createTableIfNotExists(Database db) async {
  await db.execute('''
    CREATE TABLE IF NOT EXISTS user (
      id INTEGER PRIMARY KEY,
      username TEXT,
      password TEXT
    )
  ''');
}

Future<void> insertUser(Database db) async {
  await db.insert(
    'user',
    {
      'username': userusernameController.text,
      'password': userpasswordController.text,
    },
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}
