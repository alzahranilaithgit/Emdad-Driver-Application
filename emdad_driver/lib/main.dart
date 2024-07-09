import 'package:flutter/material.dart';
import 'package:odoo_rpc/odoo_rpc.dart';
import 'records_page.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Odoo Login App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _serverController = TextEditingController();
  TextEditingController _databaseController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Future<void> _login() async {
    String serverUrl = _serverController.text.trim();
    String database = _databaseController.text.trim();
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();

    OdooClient client = OdooClient(serverUrl);

    try {
      await client.authenticate(database, username, password);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => RecordsPage()),
      );
      // Authentication successful, navigate to the next screen
      // Replace the below line with navigation logic to your next screen
      print('Authentication successful');
    } catch (e) {
      // Authentication failed, handle the error
      print('Authentication failed: $e');
    } finally {
      client.close();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Odoo Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _serverController,
              decoration: InputDecoration(labelText: 'Server URL'),
            ),
            TextField(
              controller: _databaseController,
              decoration: InputDecoration(labelText: 'Database'),
            ),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
