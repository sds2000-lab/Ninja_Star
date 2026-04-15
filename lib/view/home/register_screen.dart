import 'package:flutter/material.dart';
import 'profile_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("הרשמה")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text("שם מלא"),
            TextField(controller: nameCtrl, textDirection: TextDirection.rtl),
            const SizedBox(height: 20),

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
                // TODO: register logic
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProfileScreen(userName: nameCtrl.text),
                  ),
                );
              },
              child: const Text("הרשם"),
            ),
          ],
        ),
      ),
    );
  }
}
