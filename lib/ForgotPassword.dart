/*import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'homepage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kalkylanalys/ForgotPassword.dart'; // Import the new file
import 'package:kalkylanalys/authpage.dart' as auth; // Alias added

class ForgotPasswordPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 239, 182, 57),
      appBar: AppBar(
        title: Text('Glömt Lösenord'),
        backgroundColor: Color.fromARGB(255, 220, 154, 12),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            ElevatedButton(
              onPressed: () async {
                final email = emailController.text.trim();
                if (email.isNotEmpty) {
                  await auth.Auth().resetPassword(email); // Use the alias
                  // Show a message to the user that an email has been sent for password reset.
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          'Återställnings email av lösenord har skickats till $email'),
                    ),
                  );
                }
              },
              child: Text('Återställ Lösenord'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 255, 196, 69),
              ),
            ),
          ],
        ),
      ),
    );
  }
}*/
