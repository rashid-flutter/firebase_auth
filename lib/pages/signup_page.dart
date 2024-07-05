import 'package:firebase/pages/home_page.dart';
import 'package:firebase/services/fire_store_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _firstNameController,
              decoration: const InputDecoration(
                hintText: 'Enter your first name',
              ),
            ),
            TextField(
              controller: _lastNameController,
              decoration: const InputDecoration(
                hintText: 'Enter your last name',
              ),
            ),
            TextField(
              controller: _phoneNumberController,
              decoration: const InputDecoration(
                hintText: 'Enter your phone number',
              ),
            ),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                hintText: 'Enter your email',
              ),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                hintText: 'Enter your password',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final firstName = _firstNameController.text.trim();
                final lastName = _lastNameController.text.trim();
                final phoneNumber = _phoneNumberController.text.trim();
                final email = _emailController.text.trim();
                final password = _passwordController.text.trim();
                if (firstName.isNotEmpty &&
                    lastName.isNotEmpty &&
                    phoneNumber.isNotEmpty &&
                    email.isNotEmpty &&
                    password.isNotEmpty) {
                  User? user = await FireStoreService.signupWithEP(
                      email, password, firstName, lastName, phoneNumber);
                  if (user != null) {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => const HomePage()),
                        (Route) => false);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Sign up successful!'),
                      ),
                    );
                    // Navigate to home page or another page
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Error signing up.'),
                      ),
                    );
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please fill in all fields'),
                    ),
                  );
                }
              },
              child: const Text('Sign Up'),
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  "Back to LOGIN ?",
                  style: TextStyle(color: Colors.blue, fontSize: 10.0),
                ))
          ],
        ),
      ),
    );
  }
}
