import 'package:flutter/material.dart';
import 'profile_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("התחברות")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text("אימייל"),
            TextField(controller: emailCtrl, textDirection: TextDirection.rtl),
            const SizedBox(height: 20),

            const Text("סיסמה"),
            TextField(
              controller: passCtrl,
              obscureText: true,
              textDirection: TextDirection.rtl,
            ),
            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {
                // TODO: login logic
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProfileScreen(userName: "משתמש"),
                  ),
                );
              },
              child: const Text("התחבר"),
            ),
          ],
        ),
      ),
    );
  }
}
