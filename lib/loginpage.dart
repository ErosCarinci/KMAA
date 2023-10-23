/*import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kalkylanalys/ForgotPassword.dart';
import 'authpage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? errorMessage = 'Försök igen';
  bool isLogin = true;

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Widget _title() {
    return const Text(
      'Logga In',
      style: TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _entryField(
    String title,
    TextEditingController controller,
  ) {
    return TextField(
      controller: controller,
      obscureText: title == 'password', // Hide password
      style: TextStyle(color: Colors.white), // Set text color to white
      decoration: InputDecoration(
        labelText: title,
        labelStyle: TextStyle(color: Colors.white), // Set label color to white
        focusedBorder: UnderlineInputBorder(
          borderSide:
              BorderSide(color: Colors.white), // Set underline color to white
        ),
      ),
    );
  }

  Widget _errorMessage() {
    return Text(
      errorMessage == '' ? '' : 'Hm ? $errorMessage',
      style: TextStyle(color: Colors.white), // Set text color to white
    );
  }

  Widget _submitButton() {
    return ElevatedButton(
      onPressed:
          isLogin ? signInWithEmailAndPassword : createUserWithEmailAndPassword,
      child: Text(
        isLogin ? 'Logga in' : 'Registrera',
        style: TextStyle(color: Colors.white), // Set text color to white
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.orange, // Set button color to orange
      ),
    );
  }

  Widget _loginOrRegistrationButton() {
    return Column(
      children: [
        TextButton(
          onPressed: () {
            setState(() {
              isLogin = !isLogin;
            });
          },
          child: Text(
            isLogin ? 'Registrera' : 'Logga in',
            style: TextStyle(color: Colors.white), // Set text color to white
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ForgotPasswordPage(),
              ),
            );
          },
          child: Text(
            'Glömt lösenord?',
            style: TextStyle(
                color: const Color.fromARGB(
                    255, 255, 255, 255)), // Set text color to orange
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        elevation: 0,
        title: Image.asset('assets/sba-logo (2) (3).png'),
        backgroundColor: Color.fromRGBO(0, 0, 0, 0),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Untitled-1.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _entryField('email', _controllerEmail),
            _entryField('password', _controllerPassword),
            _errorMessage(),
            _submitButton(),
            _loginOrRegistrationButton(),
          ],
        ),
      ),
    );
  }
}*/
