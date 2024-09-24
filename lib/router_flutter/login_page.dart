import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/router_flutter/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  var namauser;

  void _saveUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', _usernameController.text);
  }

  _showInput(TextEditingController controller, String placeholder, bool isPassword, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.blueGrey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          filled: true,
          fillColor: Colors.grey[200],
          hintText: placeholder,
        ),
      ),
    );
  }

  _showDialog(String message, Widget nextPage) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(message),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => nextPage),
                );
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
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        children: [
          // Bagian header dengan ikon
          Container(
            height: 150,
            child: const Center(
              child: Icon(
                Icons.login_rounded,
                size: 80,
                color: Colors.blueGrey,
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'GALANG REKOMENDASI',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          // Input field Username dengan ikon
          _showInput(_usernameController, 'Enter your username', false, Icons.person),
          // Input field Password dengan ikon
          _showInput(_passwordController, 'Enter your password', true, Icons.lock),
          const SizedBox(height: 30),
          // Tombol Login dengan warna solid dan bayangan
          Container(
            height: 55,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 8,
                ),
              ],
            ),
            child: ElevatedButton(
              onPressed: () {
                if (_usernameController.text == 'galang' &&
                    _passwordController.text == 'galang') {
                  _saveUsername();
                  _showDialog('Login Successful!', const HomePage());
                } else {
                  _showDialog('Incorrect Username or Password', const LoginPage());
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Login',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 25),
          Center(
            child: TextButton(
              onPressed: () {
                // Fungsi forgot password
              },
              child: const Text(
                'Forgot Password?',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
