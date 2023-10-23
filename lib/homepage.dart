import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kalkylanalys/frontpage.dart';
import 'authpage.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final User? user = Auth().currentUser;

  Future<void> signOutAndGoBack(BuildContext context) async {
    await Auth().signOut();
    Navigator.pop(context); // Go back to the previous screen
  }

  Widget _userId() {
    return Text(
      user?.email ?? 'User Email',
      style: TextStyle(
        color: Colors.white,
        fontSize: 18,
      ),
    );
  }

  Widget _signOutButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () => signOutAndGoBack(context), // Use the new function
      child: const Text('Logga ut'),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 255, 196, 69),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Color.fromARGB(255, 220, 154, 12),
      appBar: AppBar(
        title: Image.asset('assets/sba-logo (2) (3).png'),
        backgroundColor: Color.fromARGB(255, 220, 154, 12),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _userId(),
            SizedBox(height: 20),
            _signOutButton(context), // Pass the context to the function
          ],
        ),
      ),
    );
  }
}

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}

void main() {
  runApp(const MaterialApp(
    home: FrontPage(),
  ));
}
