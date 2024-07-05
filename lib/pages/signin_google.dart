import 'package:firebase/pages/home_page.dart';
import 'package:firebase/pages/signup_page.dart';
import 'package:firebase/services/fire_store_service.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final nameCon = TextEditingController();
  final passCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SIGN IN '),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameCon,
              decoration: const InputDecoration(hintText: "enter your email"),
            ),
            TextField(
              controller: passCon,
              obscureText: true,
              decoration:
                  const InputDecoration(hintText: "Enter your password"),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  // FireStoreService.signupWithEmailpass(
                  //     nameCon.text, passCon.text);
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (_) => const HomePage()));
                  final email = nameCon.text.trim();
                  final pass = passCon.text.trim();
                  if (email.isNotEmpty && pass.isNotEmpty) {
                    final user =
                        FireStoreService.signinWithEmailpass(email, pass);
                    if (user != null) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => const HomePage()));
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: const Text("sign Up Seccessful")));
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
                        content: Text('Please enter email and password'),
                      ),
                    );
                  }
                },
                child: const Text("Sign In")),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                TextButton(
                    onPressed: () async {
                      final email = nameCon.text.trim();
                      // FireStoreService.sendPasswordResetEmail(email);
                      if (email.isNotEmpty) {
                        await FireStoreService.sendPasswordResetEmail(email);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Password reset email sent'),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please enter your email'),
                          ),
                        );
                      }
                    },
                    child: const Text(
                      "Forget Password?",
                      style: TextStyle(color: Colors.blue, fontSize: 10),
                    )),
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => SignUpPage()));
                    },
                    child: const Text(
                      "SIGN UP?",
                      style: TextStyle(color: Colors.blue, fontSize: 10.0),
                    )),
              ],
            ),
            ElevatedButton(
              child: const Text('Sign in with Google'),
              onPressed: () async {
                final user = await FireStoreService.signInWithGoogle();
                if (user != null) {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Sign up successful!'),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
