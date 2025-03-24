import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:phi_app/components/login_button.dart';
import 'package:phi_app/components/login_text_field.dart';
import 'package:phi_app/components/my_colors.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String loginError = '';
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void showLoginError(error) {
    setState(() {
      loginError = error.toString();
    });
  }

  void signUserIn() async {
    // loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      showLoginError(e);
    }

    if (mounted) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.bgColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
            Image.asset(
              'lib/images/logo.png',
              height: 100,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'PHI Assistant',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: MyColors.mainColor,
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            // login error display
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: Text(
                loginError,
                style: const TextStyle(color: Colors.red),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            // email field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: LoginTextField(
                controller: emailController,
                obscureText: false,
                hintText: 'Email',
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            // password field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: LoginTextField(
                controller: passwordController,
                obscureText: true,
                hintText: 'Password',
              ),
            ),
            const SizedBox(
              height: 30,
            ),

            // login button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: LoginButton(
                onTap: signUserIn,
                buttonText: 'Sign In',
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            // register button and text
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'New User?  ',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    'Register',
                    style: TextStyle(
                      color: Colors.blue[800],
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
